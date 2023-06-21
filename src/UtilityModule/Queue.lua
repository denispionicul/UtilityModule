--!nocheck
-- DO NOT change the line above.

local RunService = game:GetService("RunService")

--[=[
    @class Queue

  	A queue is a collection of functions that run in order. You can add functions and have them queued in a line, awaiting to 
   be called. A queue can be paused or stopped.
]=]
local Queue = {}
Queue.__index = Queue

Queue.ClassName = "Queue"

type self = {
	CurrentFunction: () -> () | nil,

	OnEmpty: RBXScriptSignal,
	OnSwitch: RBXScriptSignal,
}

export type Queue = typeof(setmetatable({} :: self, Queue))

function Queue.Start(self : Queue)
	assert(self._Connections.Main == nil, "Do not start a Queue twice.")

	self._Connections.Main = RunService.Heartbeat:Connect(function()
		if self.CurrentFunction == nil and #self._Queue > 0 then
			self.CurrentFunction = self._Queue[1]
			self._OnSwitch:Fire(self._Queue[1])
			self.CurrentFunction()
			table.remove(self._Queue, 1)
			self.CurrentFunction = nil
			if #self._Queue <= 0 then
				self._OnEmpty:Fire()
			end
		end
	end)
end

function Queue.Clear(self: Queue)
	table.clear(self._Queue)
end

function Queue.Pause(self: Queue)
	assert(self._Connections.Main ~= nil, "You cannot stop an already stopped Queue")

	self._Connections.Main:Disconnect()
	self._Connections.Main = nil
end

function Queue.Stop(self: Queue)
	self:Pause()

	table.clear(self._Queue)
end

function Queue.Add(self: Queue, func: () -> ())
	assert(func, "Provide a function")

	table.insert(self._Queue, func)
end

function Queue.Remove(self: Queue, num: number)
	assert(num, "Provide a number")

	table.remove(self._Queue, num)
end

function Queue.GetQueues(self: Queue)
	return self._Queue
end

function Queue.Destroy(self: Queue)
	require(script.Parent).DeepClearTable(self)
end

--[[function Queue._Init(self: Queue)
	-- print("Starting")
end]]

function Queue.new(): Queue
	local self = setmetatable({}, Queue)
	local OnSwitch, OnEmpty = Instance.new("BindableEvent"), Instance.new("BindableEvent")

	self._Queue = {}
	self._OnSwitch = OnSwitch
	self._OnEmpty = OnEmpty
	self._Connections = {}

	self.OnEmpty = OnEmpty.Event
	self.OnSwitch = OnSwitch.Event
	self.CurrentFunction = nil

	--self:_Init()

	return self
end

return Queue
