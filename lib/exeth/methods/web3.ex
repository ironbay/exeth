defmodule Exeth.Web3 do
	import Exeth.Macros

	call "web3_clientVersion", [], returns: :string

	call "web3_sha3", [body], returns: :string

end