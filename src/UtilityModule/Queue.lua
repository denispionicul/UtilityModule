--!nocheck
-- DO NOT change the line above.

local RunService = game:GetService("RunService")
local Signal = require(script.Parent.Parent:FindFirstChild("Signal") or script.Parent.Util.Signal)
--local Trove = require(script.Parent.Parent:FindFirstChild("Trove") or script.Parent.Util.Trove)

--[=[ 
	@class Queue

	A queue is a collection of functions that run in order. You can add functions and have them queued in a line, awaiting to 
	be called. A queue can be **paused** or **stopped**.
	:::note
	You can do self:Function() even if this document says Queue.Function(self)!
	:::
]=]
local Queue = {}
Queue.__index = Queue

Queue.ClassName = "Queue"

--[=[ 
	@interface Queue 
	@within Queue
	.CurrentFunction () -> () | nil
	.OnEmpty RBXScriptSignal
	.OnSwitch RBXScriptSignal

	The Queue class.
]=]
type self = {
	CurrentFunction: () -> () | nil,

	OnEmpty: RBXScriptSignal,
	OnSwitch: RBXScriptSignal,
}

--[=[ 
	@prop CurrentFunction () -> () | nil 
	@within Queue
	The current function that's running.
]=]
--[=[ 
	@prop OnEmpty RBXScriptSignal
	@within Queue
	Fires whenever the queue empties.
]=]
--[=[ 
	@prop OnSwitch RBXScriptSignal
	@within Queue
	Fires whenever the queue switches functions.
]=]
export type Queue = typeof(setmetatable({} :: self, Queue))

--[=[ 
	Starts the queue and begins going through the functions.
]=]
function Queue.Start(self: Queue)
	assert(self._Connections.Main == nil, "Do not start a Queue twice.")

	self._Connections.Main = RunService.Heartbeat:Connect(function()
		if self.CurrentFunction == nil and #self._Queue > 0 then
			self.CurrentFunction = self._Queue[1]
			self.OnSwitch:Fire(self._Queue[1])
			self.CurrentFunction()
			table.remove(self._Queue, 1)
			self.CurrentFunction = nil
			if #self._Queue <= 0 then
				self.OnEmpty:Fire()
			end
		end
	end)
end

--[=[ 
	Clears all the queued functions.
]=]
function Queue.Clear(self: Queue)
	table.clear(self._Queue)
end

--[=[ 
	Pauses the queue from running further.
]=]
function Queue.Pause(self: Queue)
	assert(self._Connections.Main ~= nil, "You cannot stop an already stopped Queue")

	self._Connections.Main:Disconnect()
	self._Connections.Main = nil
end

--[=[ 
	Stops the queue and clears all queued functions.
]=]
function Queue.Stop(self: Queue)
	self:Pause()

	table.clear(self._Queue)
end

--[=[ 
	Adds a function to the queue.

	@param func -- The function to add to the queue.
]=]
function Queue.Add(self: Queue, func: () -> ())
	assert(func, "Provide a function")

	table.insert(self._Queue, func)
end

--[=[ 
	Removes a function from the queue.

	@param num -- The number of the function to remove.
]=]
function Queue.Remove(self: Queue, num: number)
	assert(num, "Provide a number")

	table.remove(self._Queue, num)
end

--[=[ 
	Returns a list of all queued functions.
]=]
function Queue.GetQueues(self: Queue): { () -> any }
	return self._Queue
end

--[=[ 
	Gets rid of the queue.
]=]
function Queue.Destroy(self: Queue)
	require(script.Parent).DeepClearTable(self)
end

--[[function Queue._Init(self: Queue)
	-- print("Starting")
end]]

function Queue.new(): Queue
	local self = setmetatable({}, Queue)

	self._Queue = {}
	self._Connections = {}

	self.OnEmpty = Signal.new()
	self.OnSwitch = Signal.new()
	self.CurrentFunction = nil

	--self:_Init()

	return self
end

return Queue
