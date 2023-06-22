--!nocheck
-- DO NOT change the line above.

local RunService = game:GetService("RunService")

--[=[ 
	@class Countdown
	A countdown is a ticking value that can be customized and used for timers and other time-related functions. It can be easily
	customized and be used at your will. There are events that fire whenver ticking or reaching 0 which makes it even more 
	useful for timers and such.

	:::note
	You can do self:Function() even if this document says Countdown.Function(self)!
	:::
]=]
local Countdown = {}
Countdown.__index = Countdown

Countdown.ClassName = "Countdown"

type self = {
	MaxCount: number,
	Timer: number,
	TimeToDrain: number,
	TimerConsumption: number,
	UpdateEvent: RBXScriptSignal,

	OnCount: RBXScriptSignal,
	OnFinished: RBXScriptSignal,
}

--[=[ 
	@interface Countdown 
	@within Countdown
	.MaxCount number
	.Timer number
	.TimeToDrain number
	.TimerConsumption number
	.UpdateEvent RBXScriptSignal
	.OnCount RBXScriptSignal
	.OnFinished RBXScriptSignal

	The Countdown class.
]=]
export type Countdown = typeof(setmetatable({} :: self, Countdown))

--[=[ 
	@prop MaxCount number
	@within Countdown
	The Max the timer can reach.
]=]
--[=[ 
	@prop Timer number
	@within Countdown
	The timer value.
]=]
--[=[ 
	@prop TimeToDrain number
	@within Countdown
	The timer needed to wait before the countdown loweres.
]=]
--[=[ 
	@prop TimerConsuption number
	@within Countdown
	The amount the timer decrease by when being lowered.
]=]
--[=[ 
	@prop UpdateEvent RBXScriptSignal
	@within Countdown
	The event that changes and listenes to the timer. Default is RunService.Heartbeat.
]=]
--[=[ 
	@prop OnCount RBXScriptSignal
	@within Countdown
	Fires whenever the count lowers, returns the timer as a property.
]=]
--[=[ 
	@prop OnFinished RBXScriptSignal
	@within Countdown
	Fires whenever the count reaches 0 or lower.
]=]

--[=[ 
	Starts the countdown, if a count is provided, the timer will start on that number

	@param Count -- The optional starting count.
]=]
function Countdown.Start(self: Countdown, Count: number)
	assert(self._Connections.Main == nil, "You cannot run the same Countdown twice.")

	self._Tick = os.clock()
	if Count then
		self.Timer = Count
	end

	self._Connections.Main = self.UpdateEvent:Connect(function()
		local diff = os.clock() - self._Tick

		if diff >= self.TimeToDrain and self.Timer > 0 then
			local ConsumeAmount = self.TimerConsumption * math.floor(diff / self.TimerConsumption)

			if self.Timer > self.MaxCount then
				self.Timer = self.MaxCount
			end
			self._Tick = os.clock()
			self.Timer -= ConsumeAmount
			self._OnCount:Fire(self.Timer)
			if self.Timer <= 0 then
				self._OnFinished:Fire()
			end
		end
	end)
end

--[=[ 
	Sets the timer to the number provided, resets tick.

	@param timer -- The count it should start at.
]=]
function Countdown.SetTimer(self: Countdown, timer: number)
	assert(type(timer) == "number", "Please provide a number")

	self._Tick = os.clock()
	self.Timer = timer
end

--[=[ 
	Pauses the countdown. If pauseTime is provided, restarts after yielding for that amount

	@param pauseTime -- If provided, count ill restart after the number given.
]=]
function Countdown.Pause(self: Countdown, pauseTime: number?)
	assert(self._Connections.Main ~= nil, "You cannot pause while not running.")

	self._Connections.Main:Disconnect()
	self._Connections.Main = nil

	if pauseTime and type(pauseTime) == "number" then
		task.spawn(task.wait(pauseTime))
		self:Start()
	end
end

--[=[ 
	Stops the countdown. The timer will go back to the MaxCount

	:::caution
	If your timer does not have a MaxCount then it will error!
	:::
]=]
function Countdown.Stop(self: Countdown)
	assert(self.MaxCount < 100000, "Cannot stop timer if the MaxCount is inf")

	self:Pause()
	self.Timer = self.MaxCount
end

--[=[ 
	Gets rid of the countdown.
]=]
function Countdown.Destroy(self: Countdown)
	require(script.Parent).DeepClearTable(self)
end

--[[function Countdown._Init(self: Countdown)
	-- print("Starting...")
end]]

function Countdown.new(MaxCount: number): Countdown
	local self = setmetatable({}, Countdown)

	self._OnCount, self._OnFinished = Instance.new("BindableEvent"), Instance.new("BindableEvent")
	self._Tick = os.clock()
	self._Connections = {}

	self.MaxCount = MaxCount or math.huge
	self.Timer = 0
	self.TimeToDrain = 1
	self.TimerConsumption = 1
	self.UpdateEvent = RunService.Stepped

	self.OnCount = self._OnCount.Event
	self.OnFinished = self._OnFinished.Event

	--	self:_Init()

	return self
end

return Countdown
