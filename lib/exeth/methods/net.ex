defmodule Exeth.Net do
	use Exeth.Macros, namespace: "net"

	rpc listening(), returns: :boolean

	rpc peer_count(), returns: :quantity
end