defmodule Exeth.Net do
	use Exeth.Macros, namespace: "net"

	rpc listening(), returns: :boolean

	rpc peerCount(), returns: :quantity
end