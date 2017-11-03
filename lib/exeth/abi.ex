defmodule Exeth.ABI do
	def encode_call(method, args) do
		encoded =
			args
			|> Stream.map(&encode_value/1)
			|> Enum.join("")
		"0x#{encode_function(method)}#{encoded}"
	end

	def encode_function(input) do
		input
		|> keccak
		|> String.slice(0..7)
	end

	def encode_value(true), do: encode_value(1)
	def encode_value(false), do: encode_value(0)


	def encode_value(input) when is_number(input) do
		input
		|> Integer.to_string(16)
		|> String.pad_leading(64, ["0"])
	end

	def encode_value(input) when is_binary(input) and binary_part(input, 0, 2) === "0x", do: "000000000000000000000000" <> String.replace_prefix(input, "0x", "")

	def encode_value(input) when is_binary(input) do
		input
		|> Base.encode16
		|> String.pad_trailing(64, ["0"])
	end

	def decode_number(""), do: 0

	def decode_number(value) do
		value
		|> Integer.parse(16)
		|> case do
			{result, _} -> result
		end
	end

	def decode_string(value) do
		value
		|> Base.decode16!
	end

	def decode_function(input) do
		input
		|> String.slice(-64..-1)
		|> case do
			result when binary_part(result, 0, 1) !== "0" ->
				result
				|> String.trim_trailing("0")
				|> decode_string
			result ->
				result
				|> String.trim_leading("0")
				|> decode_number
		end
	end

	def keccak(input) do
		256
		|> :keccak.hexhash(input)
		|> String.downcase
	end
end

defmodule Exeth.Adapter do
	@definitions [
		eth_getBalance: [
			params: [
				address: nil,
				block: "latest"
			],
			return: &Exeth.ABI.decode_number/1,
		],
		eth_call: [
			params: [
				transaction: nil,
				block: "latest",
			],
			return: &Exeth.ABI.decode_function/1,
		]
	]

	@callback execute(method :: String.t, params :: list) :: {:ok, any} | {:error, any}

	defmacro __using__(_) do
		head =
			quote do
				@behaviour Exeth.Adapter
			end
		tail =
			@definitions
			|> Enum.map(fn {key, [params: params, return: return]} ->
				arguments =
					params
					|> Enum.map(fn
						{key, nil} -> {key, [], Elixir}
						{key, default} -> {:\\, [], [{key, [], Elixir}, default]}
					end)
				params =
					params
					|> Keyword.keys
					|> Enum.map(&Macro.var(&1, Elixir))
				quote do
					def unquote(key)(unquote_splicing(arguments)) do
						params = unquote(params)
						result =
							unquote(key)
							|> execute(params)
							|> Map.get("result")
							|> String.replace_prefix("0x", "")
						cb = unquote(return)
						cb.(result)
					end
				end
			end)
		[head | tail]
	end

end

defmodule Exeth.HTTP do
	use Exeth.Adapter

	def execute(method, params) do
		json = %{
			jsonrpc: "2.0",
			id: 1,
			method: method,
			params: params,
		}
		|> Poison.encode!

		"https://mainnet.infura.io/uYEUbQtBmchuBfPqQyL2/"
		|> HTTPoison.post!(json, [
			"Content-Type": "application/json"
		])
		|> Map.get(:body)
		|> Poison.decode!
	end
end