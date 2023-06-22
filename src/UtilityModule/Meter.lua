--!nocheck
-- DO NOT change the line above

--[=[ 
	@class Meter
	A meter is simply a value within a given min or max value, unlike NumberRanges,
	they have a value. A meter also has events in which are fired whenever it is full, empty or simply changed. A meter can be set to an
	UI Instance and it will modify whenever the value inside a meter changes.

	:::note
	You can do self:Function() even if this document says Meter.Function(self)!
	:::
]=]
local Meter = {}
Meter.__index = Meter

Meter.ClassName = "Meter"

--[=[ 
	@interface Meter 
	@within Meter
	.Minimum number
	.Maximum number
	.IntegerOnly boolean
	.UIDisplayPercentage boolean
	.OnChanged RBXScriptSignal
	.OnEmpty RBXScriptSignal
	.OnFill RBXScriptSignal
	.UI GuiBase2d

	The Meter class.
]=]
type self = {
	Minimum: number,
	Maximum: number,
	IntegerOnly: boolean,
	OnChanged: RBXScriptSignal,
	OnEmpty: RBXScriptSignal,
	OnFill: RBXScriptSignal,
	UI: GuiBase2d,
	UIDisplayPercentage: boolean
}

--[=[ 
	@prop Minimum number
	@within Meter
	The Minimum the timer can reach.
]=]
--[=[ 
	@prop Maximum number
	@within Meter
	The Maximum the timer can reach.
]=]
--[=[ 
	@prop IntegerOnly boolean
	@within Meter
	Indicates if the number will always be an integer.
]=]
--[=[ 
	@prop UI GuiBase2d
	@within Meter
	The UI that the meter will use.
]=]
--[=[ 
	@prop UIDisplayPercentage boolean
	@within Meter
	Determines if the UI will display a %number rather that number.
]=]
--[=[ 
	@prop OnChanged RBXScriptSignal
	@within Meter
	Fires whenever the value changes.
]=]
--[=[ 
	@prop OnEmpty RBXScriptSignal
	@within Meter
	Fires whenever the value is 0 or lower.
]=]
--[=[ 
	@prop OnFill RBXScriptSignal
	@within Meter
	Fires whenever the value is at max.
]=]
export type Meter = typeof(setmetatable({} :: self, Meter))

--[=[ 
	Gets rid of the meter.
]=]
function Meter.Destroy(self: Meter)
	 require(script.Parent):DeepClearTable(self)
	
	self = nil
end

--[=[ 
	Removes the UI, if any.

	:::caution
	Will error if no UI is binded!
	:::
]=]
function Meter.RemoveUI(self: Meter)
	assert(self.UI, "Can't remove ui, doesn't exist.")
	
	self.UI = nil
end

--[=[ 
	Binds the meter to a UI Instance.

	@param UI -- The UI it should bind to.
	@param Axis -- the axis that the bar will change. "X" or "Y" only.
	@param TextUI -- Optional text label to display the meter value.
]=]
function Meter.SetUI(self: Meter, UI: GuiBase2d, Axis: string, TextUI: GuiLabel?)
	assert(UI, "No Gui provided whenever setting the meter UI.")
	assert(Axis, "An axis is require whenever setting up an ui to the meter.")
	assert(Axis == ("X" or "Y"), "You can only set the axis to X or Y on a meter UI.")
	
	self.UI = UI
	self._UIAxis = Axis
	
	if TextUI then
		self._UIText = TextUI
	end
end

--[=[ 
	Returns the value in a percentage _%_
]=]
function Meter.GetPercentage(self: Meter): number
	return math.round((self._Value.Value / self.Maximum) * 100)
end

--[=[ 
	Sets the value to the given one.

	:::note
	This will get affected by the "IntegerOnly" property.
	:::

	@param number -- The value it should be set to.
]=]
function Meter.SetValue(self: Meter, number: number)
	assert(number, "No number was provided whenever setting a meter value")
	self._Value.Value = math.clamp((self.IntegerOnly and math.round(number) or number), self.Minimum, self.Maximum)
end

--[=[ 
	Returns the value of the meter.
]=]
function Meter.GetValue(self: Meter): number
	return self._Value.Value
end

function Meter._Init(self: Meter): ()
	self._Value.Value = self.Maximum

	self._Connections.ChangedEvent = self._Value.Changed:Connect(function()
		self._ChangedSignal:Fire(self._Value.Value)
		
		if self.UI then
			local UI : GuiBase2d = self.UI
			local Percentage = self._Value.Value / self.Maximum
			UI.Size = UDim2.new((self._UIAxis == "X" and Percentage or UI.Size.X.Scale), UI.Size.X.Offset, (self._UIAxis == "Y" and Percentage or UI.Size.Y.Scale), UI.Size.Y.Offset)
			if self._UIText then
				self._UIText.Text = (self.UIDisplayPercentage and self:GetPercentage() or self:GetValue())
			end
		end
		
		if self._Value.Value <= self.Minimum then
			self._EmptySignal:Fire()
		elseif self._Value.Value >= self.Maximum then
			self._FullSignal:Fire()
		end
	end)

end

function Meter.new(Minimum : number?, Maximum : number?): Meter
	local self = setmetatable({} :: self, Meter)

	self._Value = Instance.new("NumberValue")
	self._ChangedSignal = Instance.new("BindableEvent")
	self._EmptySignal = Instance.new("BindableEvent")
	self._FullSignal = Instance.new("BindableEvent")
	self._UIAxis = "X"
	self._UIText = nil
	self._Connections = {}

	self.Minimum = Minimum or 0
	self.Maximum = Maximum or 100
	self.IntegerOnly = false
	self.UI = nil
	self.UIDisplayPercentage = true
	
	self.OnChanged = self._ChangedSignal.Event
	self.OnEmpty = self._EmptySignal.Event
	self.OnFill = self._FullSignal.Event

	self:_Init()

	return self
end

return Meter	
