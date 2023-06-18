local RunService = game:GetService("RunService")

local queue = {}
queue.__index = queue

function queue:Start()
	assert(self._State ~= "Running", "Do not start a queue twice.")
	
	self._State = "Running"
end

function queue:Stop()
	self._State = "Stopped"
end

function queue:Add(func : FunctionalTest)
	assert(func, "Provide a function")
	
	table.insert(self._Queue, func)
end

function queue:Remove(num : number)
	assert(num, "Provide a number")
	
	table.remove(self._Queue, num)
end

function queue:GetQueues()
	return self._Queue
end

function queue:Destroy()
	self = nil
end

function queue:Init()
	RunService.Heartbeat:Connect(function()
		if self.currentFunction == nil and #self._Queue > 0 and self._State == "Running" then
			self.currentFunction = self._Queue[1]
			self._OnSwitch:Fire(self._Queue[1])
			self.currentFunction()
			table.remove(self._Queue, 1)
			self.currentFunction = nil
			if #self._Queue <= 0 then self._OnEmpty:Fire() end
		end
	end)
end

function queue.new()
	local self = setmetatable({}, queue)
	local OnSwitch, OnEmpty = Instance.new("BindableEvent"), Instance.new("BindableEvent")
	
	self._Queue = {}
	self._State = "Stopped"
	self._OnSwitch = OnSwitch
	self._OnEmpty = OnEmpty
	
	self.OnEmpty = OnEmpty.Event
	self.OnSwitch = OnSwitch.Event
    self.currentFunction = nil
	
	self:Init()
	
	return self
end

return queue
