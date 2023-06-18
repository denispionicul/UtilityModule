--!nocheck
-- DO NOT change the line above.

local RunService = game:GetService("RunService")

local Countdown = {}
Countdown.__index = Countdown

Countdown.ClassName = "Countdown"

type self = {
    MaxCount : number,
    Timer : number,
    TimeToDrain : number,
    TimerConsumption : number,
    UpdateEvent : RBXScriptSignal,

    OnCount : RBXScriptSignal,
    OnFinished : RBXScriptSignal
}

export type Countdown = typeof(setmetatable({} :: self, Countdown))

function Countdown.Start(self : Countdown, Count : number)
	assert(self._Connections.Main == nil, "You cannot run the same Countdown twice.")

	self._Tick = os.clock()
	if Count then self.Timer = Count end

    self._Connections.Main = self.UpdateEvent:Connect(function()
        local diff = os.clock() - self._Tick

		if diff >= self.TimeToDrain and self.Timer > 0 then
            local ConsumeAmount = self.TimerConsumption * math.floor(diff / self.TimerConsumption)

			if self.Timer > self.MaxCount then self.Timer = self.MaxCount end
			self._Tick = os.clock()
			self.Timer -= ConsumeAmount
			self._OnCount:Fire(self.Timer)
			if self.Timer <= 0 then
				self._OnFinished:Fire()
			end
		end
	end)
end

function Countdown.SetTimer(self : Countdown, timer : number)
	assert(type(timer) == "number", "Please provide a number")
	
	self._Tick = os.clock()
	self.Timer =  timer
end

function Countdown.Pause(self : Countdown, pauseTime : number)
    assert(self._Connections.Main ~= nil, "You cannot pause while not running.")

    self._Connections.Main:Disconnect()

	if pauseTime and type(pauseTime) == "number" then
		task.wait(pauseTime)
		self:Start()
	end
end

function Countdown.Stop(self : Countdown)
    assert(self.MaxCount < 100000, "Cannot stop timer if the MaxCount is inf")

    self:Pause()
    self.Timer = self.MaxCount
end

function Countdown.Destroy(self : Countdown)
	require(script.Parent).DeepClearTable(self)
end

function Countdown._Init(self : Countdown)
    -- print("Starting...")
end

function Countdown.new(MaxCount : number) : Countdown
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
	
    self:_Init()

	return self
end

return Countdown