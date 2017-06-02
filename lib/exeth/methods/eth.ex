defmodule Exeth.Eth do
	use Exeth.Macros, namespace: "eth"

	rpc protocolVersion(), returns: :quantity

	rpc syncing()

	rpc coinbase()

	rpc mining()

	rpc hashrate(), returns: :quantity

	rpc gasPrice(), returns: :quantity

	rpc accounts()

	rpc blockNumber(), returns: :quantity

	rpc getBalance(address, tag), returns: :quantity

	rpc getStorageAt(address, position, tag), returns: :quantity

	rpc getTransactionCount(address, tag), returns: :quantity

	rpc getBlockTransactionCountByHash(block), returns: :quantity

	rpc getBlockTransactionCountByNumber(block), returns: :quantity

	rpc getUncleCountByBlockHash(block), returns: :quantity

	rpc getCode(address, tag), returns: :quantity
end