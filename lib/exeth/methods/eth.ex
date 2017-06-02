defmodule Exeth.Eth do
	use Exeth.Macros, namespace: "eth"

	rpc protocolVersion(), returns: :string

	rpc syncing(), returns: :object_or_boolean

	rpc coinbase(), returns: :string

	rpc mining(), returns: :boolean

	rpc hashrate(), returns: :quantity

	rpc gasPrice(), returns: :quantity

	rpc accounts(), returns: :list

	rpc blockNumber(), returns: :quantity

	rpc getBalance(address, tag), returns: :quantity

	rpc getStorageAt(address, position, tag), returns: :quantity

	rpc getTransactionCount(address, tag), returns: :quantity

	rpc getBlockTransactionCountByHash(block), returns: :quantity

	rpc getBlockTransactionCountByNumber(block), returns: :quantity

	rpc getUncleCountByBlockHash(block), returns: :quantity

	rpc getCode(address, tag), returns: :quantity

	rpc sign

	rpc sendTransaction

	rpc sendRawTransaction

	rpc call

	rpc estimateGas

	rpc getBlockByHash

	rpc getBlockByNumber

	rpc getTransactionByHash

	rpc getTransactionByBlockHashAndIndex

	rpc getTransactionByBlockNumberAndIndex

	rpc getTransactionReceipt

	rpc getUncleByBlockHashAndIndex

	rpc getUncleByBlockNumberAndIndex

	rpc getCompilers

	rpc compileLLL

	rpc compileSolidity

	rpc compileSerpent

	rpc newFilter

	rpc newBlockFilter

	rpc newPendingTransactionFilter

	rpc uninstallFilter

	rpc getFilterChanges

	rpc getFilterLogs

	rpc getLogs

	rpc getWork

	rpc submitWork(data), returns: :boolean

	rpc submitHashrate(hashrate), returns: :boolean
end
