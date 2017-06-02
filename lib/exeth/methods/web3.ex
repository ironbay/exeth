defmodule Exeth.Web3 do
	use Exeth.Macros, namespace: "web3"

	rpc clientVersion(), returns: :string

	rpc sha3(body), returns: :string

end