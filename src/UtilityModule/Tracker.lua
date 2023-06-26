--!nocheck
-- DO NOT change the line above

local RunService = game:GetService("RunService")

local function GetPosition(Property: BasePart | Vector3)
	return if typeof(Property) == "Instance" then Property.Position else Property
end

--[=[ 
	@class Tracker
	A tracker is a class that always display (or tracks) given parts or vectors. It has a prebuilt magnitude, unit and min-max range.
	Unlike the other classes above, ***you might*** **want to change some of its properties before starting.**
	:::note
	You can do self:Function() even if this document says Tracker.Function(self)!
	:::
]=]
local Tracker = {}
Tracker.__index = Tracker

Tracker.ClassName = "Tracker"

--[=[ 
	@interface Tracker 
	@within Tracker
	.Origin BasePart | Vector3
	.Target BasePart | Vector3
	.Distance NumberRange
	.Magnitude number
	.Unit Vector3
	.OnEnter RBXScriptSignal
	.OnLeave RBXScriptSignal

	The Tracker class.
]=]
type self = {
	Origin: BasePart | Vector3,
	Target: BasePart | Vector3,
	Distance: NumberRange,
	Magnitude: number,
	Unit: Vector3,
	OnEnter: RBXScriptSignal,
	OnLeave: RBXScriptSignal,
}

--[=[ 
	@prop Origin BasePart | Vector3
	@within Tracker
	The origin that the tracker will get its position from.
]=]
--[=[ 
	@prop Target BasePart | Vector3
	@within Tracker
	The target the origin will track.
]=]
--[=[ 
	@prop Distance NumberRange
	@within Tracker
	The min amd max distance the origin can have from the target.
]=]
--[=[ 
	@prop Magnitude number
	@within Tracker
	The distance between the origin and the tracker.
]=]
--[=[ 
	@prop Unit Vector3
	@within Tracker
	The Unit vector between the origin and the tracker.
]=]
--[=[ 
	@prop OnEnter RBXScriptSignal
	@within Tracker
	Fires whenever the tracker enters the distance range.
	:::caution
	This will not fire if the distance isn't provided.
	:::
]=]
--[=[ 
	@prop OnLeave RBXScriptSignal
	@within Tracker
	Fires whenever the tracker leaves the distance range.
	:::caution
	This will not fire if the distance isn't provided.
	:::
]=]
export type Tracker = typeof(setmetatable({} :: self, Tracker))

--[=[ 
	Starts the tracking and begins updating the properties.
]=]
function Tracker.Start(self: Tracker)
	assert(self._Connections.Main == nil, "You cannot start a tracker twice.")

	self._Connections.Main = RunService.Heartbeat:Connect(function()
		local Origin = GetPosition(self.Origin) or Vector3.zero
		local Target = GetPosition(self.Target) or Vector3.zero
		local Magnitude = (Target - Origin).Magnitude

		if
			(Magnitude >= self.Distance.Min and Magnitude <= self.Distance.Max)
			and (self.Magnitude < self.Distance.Min or self.Magnitude > self.Distance.Max)
		then
			self._OnEnter:Fire()
		elseif
			(Magnitude < self.Distance.Min or Magnitude > self.Distance.Max)
			and (self.Magnitude >= self.Distance.Min and self.Magnitude <= self.Distance.Max)
		then
			self._OnLeave:Fire()
		end

		self.Magnitude = Magnitude
		self.Unit = (Target - Origin).Unit
	end)
end

--[=[ 
	Stop the tracker from running and updating its properties.
]=]
function Tracker.Stop(self: Tracker)
	assert(self._Connections.Main ~= nil, "You cannot stop a tracker twice.")

	self._Connections.Main:Disconnect()
	self._Connections.Main = nil
end

--[=[ 
	Gets rid of the Tracker.
]=]
function Tracker.Destroy(self: Tracker)
	require(script.Parent):DeepClearTable(self)
	self = nil
end

--function Tracker._Init(self: Tracker): () end

function Tracker.new(Origin: BasePart | Vector3, Target: BasePart | Vector3): Tracker
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

	--	self:_Init()

	return self
end

return Tracker
