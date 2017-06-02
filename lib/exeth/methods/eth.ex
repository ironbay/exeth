defmodule Exeth.Eth do
	import Exeth.Macros

	call "eth_protocolVersion", [], returns: :quantity

	call "eth_syncing", []

	call "eth_coinbase", []

	call "eth_mining", []

	call "eth_hashrate", [], returns: :quantity

	call "eth_gasPrice", [], returns: :quantity

	call "eth_accounts", []

	call "eth_blockNumber", [], returns: :quantity

	call "eth_getBalance", [address, tag], returns: :quantity

	call "eth_getStorageAt", [address, position, tag], returns: :quantity

	call "eth_getTransactionCount", [address, tag], returns: :quantity

	call "eth_getBlockTransactionCountByHash", [block], returns: :quantity

	call "eth_getBlockTransactionCountByNumber", [block], returns: :quantity
	
	call "eth_getUncleCountByBlockHash", [block], returns: :quantity

	call "eth_getCode", [address, tag], returns: :quantity
end