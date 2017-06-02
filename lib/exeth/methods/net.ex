defmodule Exeth.Net do
	import Exeth.Macros

	call "net_listening", [], returns: :boolean

	call "net_peerCount", [], returns: :quantity
end