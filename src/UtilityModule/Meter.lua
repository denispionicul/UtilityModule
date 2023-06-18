--!nocheck
-- DO NOT change the line above

local Meter = {}
Meter.__index = Meter

Meter.ClassName = "Meter"

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

export type Meter = typeof(setmetatable({} :: self, Meter))

function Meter.Destroy(self: Meter)
	 require(script.Parent):DeepClearTable(self)
	
	self = nil
end

function Meter.RemoveUI(self: Meter)
	assert(self.UI, "Can't remove ui, doesn't exist.")
	
	self.UI = nil
end

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

function Meter.GetPercentage(self: Meter): number
	return math.round((self._Value.Value / self.Maximum) * 100)
end

function Meter.SetValue(self: Meter, number: number)
	assert(number, "No number was provided whenever setting a meter value")
	self._Value.Value = math.clamp((self.IntegerOnly and math.round(number) or number), self.Minimum, self.Maximum)
end

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
