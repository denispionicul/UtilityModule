--[[

Before anything, I just want to say that this is pretty new and if any bugs occur, don't hesitate to report them.
Thank you for using this.
You are allowed to make changes.

-------- TUTORIAL --------

SIGNS : ! - required, ? - optional, / - not needed at all

- Instance Functions:

 * utility:ClearAllChildrenWithName(instance : Instance !, Name : String !) - Clears All Children if the name matches
 up with the Name parameter.

 * utility:ClearAllDescendantsWithName(instance : Instance !, Name : String !) - Clears all descendants that have the same name as the
 given one.

 * utility:ClearAllDescendantsWithClass(instance : Instance !, Class : String !) - Clears all descendants that have the same class as
 the given one.

 * utility:GetChildrenWithName(instance : Instance !, Name : string !) - Returns all children with the same name as
the given one.

 * utility:GetDescendantsWithName(instance : Instance !, Name : string !) - Returns all descendants with the same name
 as the given one.

 * (DEPRECATED)  utility:HasChildWithName(instance : Instance !, Name : string !) - Returns a boolean indicating if there is any
 existing child with the given name.

 * (DEPRECATED) utility:HasDescendantWithName(instance : Instance !, Name : string !) - Returns a boolean indicating if there is any
 existing descendant with the given name.

  * utility:ClearAllChildrenWithClass(instance : Instance !, ClassName : string !) - Clears All Children if the class matches
 up with the ClassName parameter.

 * utility:GetChildrenWithClass(instance : Instance !, ClassName : string !) - Returns all children with the same class as
the given one.

 * utility:GetDescendantsWithClass(instance : Instance !, ClassName : string !) - Returns all descendants with the same class
 as the given one.

 *  (DEPRECATED) utility:HasChildWithClass(instance : Instance !, ClassName : string !) - Returns a boolean indicating if there is any
 existing child with the given class.

 *  (DEPRECATED) utility:HasDescendantWithClass(instance : Instance !, ClassName : string !) - Returns a boolean indicating if there is any
 existing descendant with the given class.

 * utility:UngroupModel(Model : Model !, Parent : Instance ?) - Ungroups the model and if provided with a parent,
 all children of the model will go there, else the parent of the model

 - Table Functions:

 * utility:FilterTable(t : table !, callback : function !) - For every value in the table, the callback will fire with the
	value as the parameter. The callback MUST return a boolean. If the boolean is true on that value then it'll add to the
	returning table, else ignore.

 * utility:DeepClearTable(SentTable : table !) - Clears every instance, connection, key and table in the given table.

 * utility:GetWeightOfTable(SentTable : table !) - Returns the total sum of the numbers in the given table
 (if there aren't any numbers, it'll return 0).

 * utility:GetValuesWithName(SentTable : table !, Name : string !) - Returns a table (keys included) with only the
 values that match the Name inside the sent table.

 * utility:GetAllKeysWithName(SentTable : table !, Name : string !) - Returns a table with only the the keys that match
 the name (values will not be checked) inside the sent table.

 * utility:ClearAllValuesWithName(SentTable : table !, Name : string !) - Clears all values inside the sent table that
 match the given Name. Keys will not be deleted.

 * utility:HasValueWithName(SentTable : table !, Name : string !) - Returns a boolean indicating if there is any value
 with the given name, keys are not included.

 * utility:GroupTable(SentTable : table !, instanceParent : instance !) - Creates a model with and parents all the
 instances in the table to it, the model will be parented to the given one. Returns the model.

 - Radius Functions:

 * utility:GetHumanoidsInRadius(Position : Vector3 !, Radius : number !, OverlapParam : OverlapParams?, AliveOnly : boolean?) - Returns
 a table with all the humanoids in the position within the radius given. If AliveOnly is true, it'll only get alive humanoids.

 * utility:GetModelsInRadius(Position : Vector3 !, Radius : number !, OverlapParam : OverlapParams?) - Returns a table with all the
 models in the position within the radius given.

 * utility:GetPartsWithNameInRadius(Position : Vector3 !, Radius : number !, OverlapParam : OverlapParams ?, Name : string !) - Returns
 a table with all the parts within the radius and position given with the same name.

  * utility:GetPartsWithClassInRadius(Position : Vector3 !, Radius : number !, OverlapParam : OverlapParams ?, Class : string !) -
 Returns a table with all the parts within the radius and position given with the same class.

 * utility.CanSeeTarget(Position : Vector3 !, Target : BasePart or Model !, RaycastParam : RaycastParams ?, DotProduct : number?, Distance : number?)
  - Cast a raycast and returns a boolean indicating if the ray hit the basepart or anything inside the model. If a dot product is provided, it will check
 if it's facing the part too, the dot product goes from -1 (looking backwards) till 1 (looking directly at the part). If distance is provided, then
it will also check if the distance is at least the number provided.

 - Event Functions:

 (DEPRECATED, USE RBXScriptSignal:Once() instead) * utility:ConnectOnce(Event : RBXScriptSignal !, Function : function !) - Connect the given event to the given function and after
 fired disconnects it immediately.

 * utility:ConnectLimited(Limit : number !, Event : RBXScriptSignal !, Function : function !) - Connect the given event to the given
 function. After fired for Limit amount of times, it will disconnect itself.

 * utility:ConnectBind(Event: RBXScriptSignal !, callback : function !, Bind : RBXScriptConnection) - Whenever the event in the
	bind is disconnected, the Event given will also disconnect.	

-------- COUNTDOWN --------

 A countdown is a ticking value that can be customized and used for timers and other time-related functions. It can be easily
 customized and be used at your will. There are events that fire whenver ticking or reaching 0 which makes it even more 
 useful for timers and such.

 * utility:IsACountdown(Table : table): Boolean - Returns true if the given Table is a Countdown Class

 * utility.newCountdown(MaxCount : number ?) : Countdown - Returns a countdown class, the following commands can be used on it:

 Functions:

 - countdown:Start(Count : number ?) - Starts the countdown, if a count is provided, the timer will start on that number

 - countdown:SetTimer(timer : number !) - Sets the timer to the provided one.

 - countdown:Pause(pauseTime : number ?) - Pauses the countdown, if a pauseTime is provided, it will restart after that

 - countdown:Destroy() - Gets rid of the countdown

 Properties:

 countdown.MaxCount - The maximum the countdown can raise.

 countdown.Timer - The current number the timer is at, if changed it will not reset the cooldown.

 countdown.TimeToDrain - The timer needed to wait before the countdown loweres

 countdown.TimeConsumption - The amount the timer decrease by when being lowered

 countdown.UpdateEvent - The event that changes and listenes to the timer. Default is RunService.Heartbeat

 Events:

 countdown.OnCount(Timer) - Fires whenever the count lowers, returns the timer as a property

 countdown.OnFinished() - Fires whenever the count reaches 0 or lower.

 -------- QUEUE --------

	A queue is a collection of functions that run in order. You can add functions and have them queued in a line, awaiting to 
	be called. A queue can be paused or stopped.

 * utility:IsAQueue(Table : table): Boolean - Returns true if the given Table is a Queue Class

 * utility.newQueue() - Returns a queue class, the following commands can be used on it:

 Functions:

 - queue:Start() - Starts the queue, it will begin going over every queued function.

 - queue:Pause() - Stops the queue from running the next functions

 - queue:Stop() - Stops the queue from running the next functions and clears all the functions in the queue.

 - queue:Add(function : function !) - Adds a function to the queue.

 - queue:GetQueues() - returns the queues that there are currently

 - queue:Remove(number : number !) - Removes the function in the number's position, simply table.remove.

 - queue:Destroy() - Gets rid of the queue

 Properties:

queue.currentFunction - the current function that the queue is playing, if none then nil

 Events:

 queue.OnSwitch(func) - Fires whenever the queue switches functions, returns the current function.

 queue.OnEmpty() - Fires whenever the queue has no more functions.

  -------- METER --------

  A meter is simply a value within a given min or max value, unlike NumberRanges,
  they have a value. A meter also has events in which are fired whenever it is full, empty or simply changed. A meter can be set to an
  UI Instance and it will modify whenever the value inside a meter changes.

  * utility:IsAMeter(Table : table): Boolean - Returns true if the given Table is a Meter Class

  * utility.newMeter(Minimum : number ?, Maximum : number ?) - Returns a Meter class. If not provided with a min it will default to 0.
  If not provided with a max, it will default to 100. The following can be applied:

  Functions:

  - Meter:GetValue(): number - Returns the value that the meter is currently in.

  - Meter:SetValue(number : number !) - Sets the value of the meter to the given one.

  - Meter:GetPercentage(): number - Returns a percentage of 0 - 100 of the value that the meter is currently in.

  - Meter:SetUI(UI : GuiBase2D !, Axis : string !, TextUI : GuiBase2D ?) - Sets the meter to a UI Instance. The UI provided should be the UI that changes.
  The axis represents which part of the ui should change when the value inside the meter changes. Can be set to "X" or "Y".
  If A TextUI is provided, the value of the meter will display there.

  - Meter:RemoveUI() - Stops updating the UI inside the meter

  - Meter:Destroy() - Gets rid of the meter.

  Properties:

  Meter.Minimum - The minimum the value of the meter can go.

  Meter.Maximum - The maximum the value of the meter can go.

  Meter.IntegerOnly - If true, the number it returns when using Meter:GetValue() will always be an integer

  Meter.UI - The UI that the Meter is using. If none then nil

  Meter.UIDisplayPercentage - if true, if a meter UIText has been set, it'll display the value is a percentage. If false, simply show
  value.

  Events:

  Meter.OnChanged(value : number) - Fires whenever the meter changes its value, returns the value aswell.

  Meter.OnEmpty() - Fires whenever the Meter reaches the minimum value.

  Meter.OnFill() - Fires whenever the Meter reaches the maximum value.

 -------- TRACKER --------

  A tracker is a class that always display (or tracks) given parts or vectors. It has a prebuilt magnitude, unit and min-max range.
  Unlike the other classes above, you might want to change some of its properties before starting.

  * utility:IsATracker(Table : table): Boolean - Returns true if the given Table is a Tracker Class

  * utility.newTracker(Origin : BasePart | Vector3 !, Target : BasePart | Vector3 !) - Returns a Tracker class.
  The following can be applied:

 Functions:

  - Tracker:Start() - Begins the tracker. When active, the magnitude and unti will update. Should NOT be run twice.

  - Tracker:Stop() - Stops the tracker. Nothing will update and the tracker will stop tracking until started again. Should NOT be run
  twice.

  Properties:

  Tracker.Origin - The Origin given when creating the tracker. Can be set to a BasePart or Vector3

  Tracker.Target - The Target given when creating the tracker. Can be set to a BasePart or Vector3

  Tracker.Distance - The distance is a numbervalue that tell the tracker the max and min magnitude that the tracker will function at
  this also controls the events that will be discussed below.

  Tracker.Magnitude - The magnitude between the Origin and Target

  Tracker.Unit - The Unit between the Origin and Target

  Events:

  Tracker.OnEnter - This event fires when the magnitude entered in between the distance property. This will never fire if the Distance
  is not changed.

  Tracker.OnLeave - This even fires after the magnitude leaves the distance property. This will not fire if the Distance is not
  changed.

]]
local RunService = game:GetService("RunService")

local DebugMessages = false -- Enable this to recieve additional information whenever using a function. (Very few actually use this.)
local DisableWarns = false -- Disable this if you don't want a warning poppin up whenever using a deprecated feature

local Countdown = require(script.Countdown)
local Queue = require(script.Queue)
local Meter = require(script.Meter)
local Tracker = require(script.Tracker)

local function Warn(Message)
	if not DisableWarns then
		warn(Message)
	end
end

local function Debug(Message)
	if DebugMessages then
		print(Message)
	end
end

--[=[
    @class UtilityModule

    Inside the main Module, you'll find the functions:
]=]
local utility = {}

-------- INSTANCE FUNCTIONS --------

function utility:ClearAllChildrenWithName(instance: Instance, Name: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Name) ~= string, "The name must be a string.")

	for _, children in pairs(instance:GetChildren()) do
		if children.Name == Name then
			children:Destroy()
		end
	end
end

function utility:ClearAllChildrenWithClass(instance: Instance, ClassName: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(ClassName) ~= string, "The name must be a string.")

	for _, children in pairs(instance:GetChildren()) do
		if children.ClassName == ClassName then
			children:Destroy()
		end
	end
end

function utility:ClearAllDescendantsWithName(instance: Instance, Name: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Name) ~= string, "The name must be a string.")

	for _, descendant in pairs(instance:GetDescendants()) do
		if descendant.Name == Name then
			descendant:Destroy()
		end
	end
end

function utility:ClearAllDescendantsWithClass(instance: Instance, Class: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Class) ~= string, "The name must be a string.")

	for _, descendant in pairs(instance:GetDescendants()) do
		if descendant.ClassName == Class then
			descendant:Destroy()
		end
	end
end

function utility:GetChildrenWithName(instance: Instance, Name: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Name) ~= string, "The name must be a string.")
	local returningTable = {}

	for _, children in pairs(instance:GetChildren()) do
		if children.Name == Name then
			table.insert(returningTable, children)
		end
	end

	return returningTable
end

function utility:GetChildrenWithClass(instance: Instance, ClassName: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(ClassName) ~= string, "The name must be a string.")
	local returningTable = {}

	for _, children in pairs(instance:GetChildren()) do
		if children.ClassName == ClassName then
			table.insert(returningTable, children)
		end
	end

	return returningTable
end

function utility:GetDescendantsWithName(instance: Instance, Name: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Name) ~= string, "The name must be a string.")
	local returningTable = {}

	for _, descendant in pairs(instance:GetDescendants()) do
		if descendant.Name == Name then
			table.insert(returningTable, descendant)
		end
	end

	return returningTable
end

function utility:GetDescendantsWithClass(instance: Instance, ClassName: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(ClassName) ~= string, "The name must be a string.")
	local returningTable = {}

	for _, descendant in pairs(instance:GetDescendants()) do
		if descendant.ClassName == ClassName then
			table.insert(returningTable, descendant)
		end
	end

	return returningTable
end

function utility:HasChildWithName(instance: Instance, Name: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Name) ~= string, "The name must be a string.")
	Warn("This Feature is Deprecated: HasChildWithName")
	local returningBool = false

	for _, children in pairs(instance:GetChildren()) do
		if children.Name == Name then
			returningBool = true
			break
		end
	end

	return returningBool
end

function utility:HasChildWithClass(instance: Instance, ClassName: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(ClassName) ~= string, "The name must be a string.")
	Warn("This Feature is Deprecated: HasChildWithClass")
	local returningBool = false

	for _, children in pairs(instance:GetChildren()) do
		if children.ClassName == ClassName then
			returningBool = true
			break
		end
	end

	return returningBool
end

function utility:HasDescendantWithName(instance: Instance, Name: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Name) ~= string, "The name must be a string.")
	Warn("This Feature is Deprecated: HasDescendantWithName")
	local returningBool = false

	for _, descendant in pairs(instance:GetDescendants()) do
		if descendant.Name == Name then
			returningBool = true
			break
		end
	end

	return returningBool
end

function utility:HasDescendantWithClass(instance: Instance, ClassName: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(ClassName) ~= string, "The name must be a string.")
	warn("This Feature is Deprecated: HasDescendantWithClass")
	local returningBool = false

	for _, descendant in pairs(instance:GetDescendants()) do
		if descendant.Name == ClassName then
			returningBool = true
			break
		end
	end

	return returningBool
end

function utility:UngroupModel(Model: Model, Parent)
	assert(Model, "Please provide a model.")

	local Instances = Model:GetChildren()

	for _, instance in pairs(Instances) do
		if Parent then
			instance.Parent = Parent
		else
			instance.Parent = Model.Parent
		end
	end

	Model:Destroy()
end

-------- TABLE FUNCTIONS --------

function utility:FilterTable<T>(t: { T }, callBack: (value: T) -> boolean): { any }
	assert(type(t) == "table", "Please provide a table.")
	assert(typeof(callBack) == "function", "Please provid a callback function.")
	local returningTable = {}

	for _, value in pairs(t) do
		if callBack(value) then
			table.insert(returningTable, value)
		end
	end

	return returningTable
end

function utility:DeepClearTable(SentTable: { any })
	assert(SentTable, "Please provide a table.")

	for _, v in pairs(SentTable) do
		local Vtype = typeof(v)

		if Vtype == Instance then
			v:Destroy()
		elseif Vtype == "RBXScriptSignal" then
			v:Disconnect()
		elseif Vtype == table then
			utility:DeepClearTable(v)
			v = nil
		elseif Vtype == "thread" then
			task.cancel(v)
		else
			v = nil
		end
	end
end

function utility:GetWeightOfTable(SentTable: table)
	assert(SentTable, "Please provide a table.")
	local returningNumber = 0

	for _, values in pairs(SentTable) do
		if type(values) == "number" then
			returningNumber += values
		end
	end

	return returningNumber
end

function utility:GetValuesWithName(SentTable: table, Name: string)
	assert(SentTable, "Please provide a table.")
	assert(type(Name) ~= string, "Please provide a valid name.")
	local returningTable = {}

	for key, values in pairs(SentTable) do
		if type(values) == string and values == Name then
			if key then
				returningTable[key] = values
			else
				table.insert(returningTable, values)
			end
		end
	end

	return returningTable
end

function utility:GetAllKeysWithName(SentTable: table, Name: string)
	assert(SentTable, "Please provide a table.")
	assert(typeof(Name) ~= string, "Please provide a valid name.")
	Warn("This feature is deprecated: GetAllKeysWithName (I genuinely don't know why this function exists)")
	local returningTable = {}

	for key, values in pairs(SentTable) do
		if typeof(values) == table then
			returningTable[key] = utility:GetAllValuesWithName(key, Name)
		elseif typeof(key) == string and key == Name then
			returningTable[key] = values
		end
	end

	return returningTable
end

function utility:ClearAllValuesWithName(SentTable: table, Name: string)
	assert(SentTable, "Please provide a table.")
	assert(typeof(Name) ~= string, "Please provide a valid name.")

	for key, values in pairs(SentTable) do
		if key then
			if typeof(key) == table then
				utility:ClearAllValuesWithName(values, Name)
			elseif values == Name then
				values = nil
			end
		elseif values == Name then
			table.remove(SentTable, table.find(SentTable, values))
		end
	end

	return SentTable
end

function utility:HasValueWithName(SentTable: table, Name: string)
	assert(SentTable, "Please provide a table.")
	assert(typeof(Name) ~= string, "Please provide a valid name.")
	local returningBool = false

	for key, values in pairs(SentTable) do
		if key then
			if typeof(values) == table then
				returningBool = utility:HasValueWithName(values, Name)
			elseif values == Name then
				returningBool = true
				break
			end
		elseif values == Name then
			returningBool = true
			break
		end
	end

	return returningBool
end

function utility:GroupTable(SentTable: table, InstanceParent: Instance)
	assert(SentTable, "Please provide a table with instances.")
	assert(InstanceParent, "Please provide a parent for the model")

	local Model = Instance.new("Model")
	Model.Parent = InstanceParent

	for _, instances in pairs(SentTable) do
		if typeof(instances) == Instance then
			instances.Parent = Model
		else
			warn(instances .. " needs to be an instance")
		end
	end

	return Model
end

-------- RADIUS --------

function utility:GetHumanoidsInRadius(
	Position: Vector3,
	Radius: number,
	OverlapParam: OverlapParams?,
	AliveOnly: boolean?
)
	assert(typeof(Position) ~= Vector3, "Position must be a Vector3.")
	assert(typeof(Radius) == "number", "Radius must be a number.")

	local Humanoids = {}
	local Result = workspace:GetPartBoundsInRadius(Position, Radius, OverlapParam)

	for _, Part: BasePart in pairs(Result) do
		if Part.Name == "HumanoidRootPart" then
			local Humanoid = Part.Parent:FindFirstChild("Humanoid")

			if Humanoid then
				if AliveOnly and Humanoid.Health <= 0 then
					continue
				end
				table.insert(Humanoids, Humanoid)
				Debug("A humanoid has been found")
			end
		end
	end

	Debug("A total of " .. #Humanoids .. " humanoids have been found.")

	return Humanoids
end

function utility:GetModelsInRadius(Position: Vector3, Radius: number, OverlapParam: OverlapParams?)
	assert(typeof(Position) ~= Vector3, "Position must be a Vector3.")
	assert(typeof(Radius) == "number", "Radius must be a number.")

	local Models = {}
	local Result = workspace:GetPartBoundsInRadius(Position, Radius, OverlapParam)

	for _, Part: BasePart in pairs(Result) do
		local Model = Part:FindFirstAncestorOfClass("Model")

		if Model and not table.find(Models, Model) then
			table.insert(Models, Model)
			Debug("Found A Model")
		end
	end

	Debug("A total of " .. #Models .. " models have been found.")

	return Models
end

function utility:GetPartsWithNameInRadius(
	Position: Vector3,
	Radius: number,
	OverlapParam: OverlapParams?,
	Name: string
): { Instance }
	assert(typeof(Position) ~= Vector3, "Position must be a Vector3.")
	assert(typeof(Radius) == "number", "Radius must be a number.")
	assert(type(Name) ~= "string", "Please provide a Name.")

	local Parts = {}
	local Result = workspace:GetPartBoundsInRadius(Position, Radius, OverlapParam)

	for _, Part: BasePart in pairs(Result) do
		if Part.Name == Name then
			table.insert(Parts, Part)
			Debug("Found a Part")
		end
	end

	Debug("A total of " .. #Parts .. " parts have been found.")

	return Parts
end

function utility:GetPartsWithClassInRadius(
	Position: Vector3,
	Radius: number,
	OverlapParam: OverlapParams?,
	Class: string
): { Instance }
	assert(typeof(Position) ~= Vector3, "Position must be a Vector3.")
	assert(typeof(Radius) == "number", "Radius must be a number.")
	assert(type(Class) ~= "string", "Please provide a Name.")

	local Parts = {}
	local Result = workspace:GetPartBoundsInRadius(Position, Radius, OverlapParam)

	for _, Part: BasePart in pairs(Result) do
		if Part.ClassName == Class then
			table.insert(Parts, Part)
			Debug("Found a Part: " .. Part.Name)
		end
	end

	Debug("A total of " .. #Parts .. " parts have been found.")

	return Parts
end

function utility.CanSeeTarget(
	Position: Vector3 | CFrame,
	Target: BasePart | Model,
	RayCastParams: RaycastParams?,
	DotProduct: number?,
	Distance: number?
): boolean
	assert(Position, "Please provide a CFrame or Vector3")
	assert(Target, "Please provide a model or part to the target.")

	local TargetPart = if Target:IsA("Model")
		then Target.PrimaryPart or Target:FindFirstChildOfClass("BasePart")
		else Target
	local PositionType = typeof(Position)
	local Origin = if PositionType == "CFrame" then Position.Position else Position
	local RayCast = workspace:Raycast(Origin, TargetPart.Position - Origin, RayCastParams)

	if RayCast and RayCast.Instance then
		if RayCast.Instance:IsDescendantOf(Target) or RayCast.Instance == TargetPart then
			if DotProduct and PositionType == "CFrame" then
				if Position.LookVector:Dot((TargetPart.Position - Origin).Unit) < DotProduct then
					Debug("Cannot see target due to facing.")
					return false
				end
			end
			if Distance then
				if (Origin - TargetPart.Position).Magnitude > Distance then
					Debug("Cannot see target due to distance.")
					return false
				end
			end
			Debug("Can see target.")
			return true
		end
	end

	Debug("Cannot see Target.")

	return false
end

-------- EVENTS --------

function utility:ConnectOnce(Event: RBXScriptSignal, Function: "function")
	assert(typeof(Event) == "RBXScriptSignal", "Event has to be an event.")
	assert(typeof(Function) == "function", "Please provide a function.")
	Warn("utility:ConnectOnce() is deprecated. Please use RBXScriptSignal:Once() instead")

	local Connection

	Connection = Event:Connect(function(...)
		Connection:Disconnect()
		Function(...)
		Connection = nil
		Debug("Succesfully Disconnected Event.")
	end)

	Debug("Event Added.")
	return Connection
end

function utility:ConnectLimited(Limit: number, Event: RBXScriptSignal, Function: "function")
	assert(typeof(Event) == "RBXScriptSignal", "Event has to be an event.")
	assert(typeof(Function) == "function", "Please provide a function.")
	assert(type(Limit) ~= "number", "A limit is required.")

	local UsesLeft = Limit
	local Connection

	Connection = Event:Connect(function(...)
		UsesLeft -= 1
		Function(...)

		if UsesLeft == 0 then
			Connection:Disconnect()
			Connection = nil
			Debug("Succesfully Disconnected Event.")
		end
	end)

	Debug("Event Added.")
	return Connection
end

function utility:ConnectBind(Event: RBXScriptSignal, callback: (...any) -> (), Bind: RBXScriptConnection)
	assert(typeof(Event) == "RBXScriptSignal", "Event has to be an event.")
	assert(typeof(callback) == "function", "Please provide a function.")
	assert(typeof(Bind) == "RBXScriptConnection", "Bind has to be a connection.")

	local Connection = Event:Connect(callback)
	local Check

	Check = RunService.Stepped:Connect(function()
		if not Bind.Connected then
			Check:Disconnect()
			Connection:Disconnect()
			Debug("Event Disconnected.")
		end
	end)

	Debug("Event Added.")

	return Connection
end

-- stylua: ignore

-------- COUNTDOWN --------

function utility:IsACountdown(t: table): boolean
	assert(typeof(t) == table, "Please provide a table.")

	return getmetatable(t) == Countdown and t.ClassName == "Countdown"
end

---@diagnostic disable-next-line: undefined-type
function utility.newCountdown(MaxCount: number): Countdown
	return Countdown.new(MaxCount)
end

-------- QUEUE --------

function utility:IsAQueue(t: table): boolean
	assert(typeof(t) == table, "Please provide a table.")

	return getmetatable(t) == Queue and t.ClassName == "Queue"
end

---@diagnostic disable-next-line: undefined-type
function utility.newQueue(): Queue
	return Queue.new()
end

-------- METER --------

function utility:IsAMeter(t: table): boolean
	assert(typeof(t) == table, "Please provide a table.")

	return getmetatable(t) == Meter and t.ClassName == "Meter"
end

---@diagnostic disable-next-line: undefined-type
function utility.newMeter(Minimum: number?, Maximum: number?): Meter
	return Meter.new(Minimum, Maximum)
end

-------- TRACKER --------

function utility:IsATracker(t: table): boolean
	assert(typeof(t) == table, "Please provide a table.")

	return getmetatable(t) == Tracker and t.ClassName == "Tracker"
end

---@diagnostic disable-next-line: undefined-type
function utility.newTracker(Origin: BasePart | Vector3, Target: BasePart | Vector3): Tracker
	return Tracker.new(Origin, Target)
end

return utility
