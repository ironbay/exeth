defmodule Exeth.RPC do
	@url Application.get_env(:ethereum, :url) || "http://localhost:8545"
	@version "2.0"

	def call(method, params, options), do: call(method, params, UUID.uuid4(), options)

	def call(method, params, id, options) do
		payload = payload(method, params, id)
		case HTTPoison.post(@url, payload) do
			{:ok, %{body: body}} ->
				body
				|> Poison.decode!(keys: :atoms)
				|> handle_response(options)
			result -> result
		end
	end

	defp handle_response(response, options) do
		case response do
			%{ error: result } -> {:error, result}
			%{ result: result } ->
				result = parse_response(result, options)
				{:ok, result}
		end
	end

	defp parse_response(result, options) do
		case options do
			[returns: :quantity] ->
				 <<"0x", rest::binary>> = result
				 rest
				 |> Base.decode16!
				 |> :binary.decode_unsigned
			_ -> result
		end
	end

	defp payload(method, params, id) do
		%{
			jsonrpc: @version,
			method: method,
			params: params,
			id: id,
		}
		|> Poison.encode!
	end
end