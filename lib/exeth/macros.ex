defmodule Exeth.Macros do

	defmacro call(method, params, options \\ []) do
		[_prefix, function] = String.split(method, "_")
		function = String.to_atom(function)
		function_ex = "#{function}!"|> String.to_atom
		quote do
			def unquote(function)(unquote_splicing(params)) do
				Exeth.RPC.call(unquote(method), unquote(params), unquote(options))
			end

			def unquote(function_ex)(unquote_splicing(params)) do
				{:ok, result} = unquote(function)(unquote_splicing(params))
				result
			end
		end
	end
end