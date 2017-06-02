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

	rpc getBlockTransactionCountByNumber(tag), returns: :quantity

	rpc getUncleCountByBlockHash(block), returns: :quantity

	rpc getUncleCountByBlockNumber(block), returns: :quantity

	rpc getCode(address, tag), returns: :quantity

	rpc sign(address, message), returns: :string

	rpc sendTransaction(transaction), returns: :string

	rpc sendRawTransaction(signature), returns: :string

	rpc estimateGas(transaction), returns: :quantity

	rpc getBlockByHash(block, full), returns: :object_or_string

	rpc getBlockByNumber(tag, full), returns: :object_or_string

	rpc getTransactionByHash(hash), returns: :object_or_nil

	rpc getTransactionByBlockHashAndIndex(block, position), returns: :object_or_nil

	# rpc getTransactionByBlockNumberAndIndex
	#
	# rpc getTransactionReceipt
	#
	# rpc getUncleByBlockHashAndIndex
	#
	# rpc getUncleByBlockNumberAndIndex
	#
	# rpc getCompilers
	#
	# rpc compileLLL
	#
	# rpc compileSolidity
	#
	# rpc compileSerpent
	#
	# rpc newFilter
	#
	# rpc newBlockFilter
	#
	# rpc newPendingTransactionFilter
	#
	# rpc uninstallFilter
	#
	# rpc getFilterChanges
	#
	# rpc getFilterLogs
	#
	# rpc getLogs(filter), returns:
	#
	# rpc getWork(), returns: :list
	#
	# rpc submitWork(data), returns: :boolean
	#
	# rpc submitHashrate(hashrate), returns: :boolean
end
