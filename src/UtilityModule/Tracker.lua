--!nocheck
-- DO NOT change the line above

local RunService = game:GetService("RunService")

local function GetPosition(Property : BasePart | Vector3)
	return if typeof(Property) == "Instance" then Property.Position else Property
end

local Tracker = {}
Tracker.__index = Tracker

Tracker.ClassName = "Tracker"

type self = {
	Origin : BasePart | Vector3,
	Target : BasePart | Vector3,
	Distance : NumberRange,
	Magnitude : number,
	Unit : Vector3,
	OnEnter : RBXScriptSignal,
	OnLeave : RBXScriptSignal,
}

export type Tracker = typeof(setmetatable({} :: self, Tracker))

function Tracker.Destroy(self: Tracker)
	require(script.Parent):DeepClearTable(self)
end

function Tracker.Start(self: Tracker)
	assert(self._Connections.Main == nil, "You cannot start a tracker twice.")
	
	self._Connections.Main = RunService.Heartbeat:Connect(function()
		local Origin = GetPosition(self.Origin) or Vector3.zero
		local Target = GetPosition(self.Target) or Vector3.zero
		local Magnitude = (Target - Origin).Magnitude

		if (Magnitude >= self.Distance.Min and Magnitude <= self.Distance.Max) and (self.Magnitude < self.Distance.Min or self.Magnitude > self.Distance.Max) then
			self._OnEnter:Fire()
		elseif (Magnitude < self.Distance.Min or Magnitude > self.Distance.Max) and (self.Magnitude >= self.Distance.Min and self.Magnitude <= self.Distance.Max) then
			self._OnLeave:Fire()			
		end

		self.Magnitude = Magnitude
		self.Unit = (Target - Origin).Unit
	end)
end

function Tracker.Stop(self: Tracker)
	assert(self._Connections.Main ~= nil, "You cannot stop a tracker twice.")
	
	self._Connections.Main:Disconnect()
end

function Tracker._Init(self: Tracker): ()
	
end

function Tracker.new(Origin : BasePart | Vector3, Target : BasePart | Vector3): Tracker
	assert(Origin, "Please provide an origin.")
	assert(Target, "Please provide a target.")

	local self = setmetatable({} :: self, Tracker)

	self._OnEnter = Instance.new("BindableEvent")
	self._OnLeave = Instance.new("BindableEvent")
	self._Connections = {}

	self.Origin = Origin
	self.Target = Target
	self.Distance = NumberRange.new(0, 0)
	self.Magnitude = math.huge
	self.Unit = Vector3.zero

	self.OnEnter = self._OnEnter.Event
	self.OnLeave = self._OnLeave.Event

	self:_Init()

	return self
end

return Tracker	