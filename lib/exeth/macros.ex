defmodule Exeth.Macros do

	defmacro __using__([namespace: namespace]) do
		quote do
			@namespace unquote(namespace)
			import Exeth.Macros
		end
	end

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

	defmacro rpc(function, options \\ []) do
		{name, line, params} = function
		name_ex = (Atom.to_string(name) <> "!") |> String.to_atom
		function_ex = {name_ex, line, params}
		quote do
			def unquote(function) do
				name = "#{@namespace}_#{unquote(name)}"
				Exeth.RPC.call(name, unquote(params), unquote(options))
			end

			def unquote(function_ex) do
				{:ok, result} = unquote(name)(unquote_splicing(params))
			end
		end
	end
end