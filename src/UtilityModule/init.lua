--[[
V1.1.0

Before anything, I just want to say that this is pretty new and if any bugs occur, don't hesitate to report them.
Thank you for using this.
You are allowed to make changes.

Anything inside the "Util" folder is not made by me.
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
	@class utility
	Inside the **Main Module**, you'll find the following:
]=]
local utility = {}

-- ---------- MISC FUNCTIONS ------------

--[=[ 
	Warns if the provided value is false or nil.

	@param value -- The value to be checked
	@param warnMessage -- Optional warning that will be displayed if value is false or nil
	@tag Misc Function
]=]
function utility.assertwarn(value : any, warnMessage : string?)
	local WarnMessage = warnMessage or "Warn Assertion failed: value is false."

	if not value then
		warn(WarnMessage)
	end	
end	

--[=[ 
	Prints a message if the provided value is false or nil.

	@param value -- The value to be checked
	@param printMessage -- Optional print message that will be displayed if value is false or nil
	@tag Misc Function
]=]
function utility.assertprint(value : any, printMessage : string?)
	local PrintMessage = printMessage or "Value is false."

	if not value then
		print(PrintMessage)
	end	
end

-- ---------- INSTANCE FUNCTIONS --------

--[=[ 
	Clears All Children if the name matches up with the Name parameter.

	@param instance -- The instance that will get affected by this function.
	@param Name -- The name that the children are required to have to get deleted.
	@tag Instance Function
]=]
function utility:ClearAllChildrenWithName(instance: Instance, Name: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Name) ~= string, "The name must be a string.")

	for _, children in pairs(instance:GetChildren()) do
		if children.Name == Name then
			children:Destroy()
		end
	end
end

--[=[ 
	Clears All Children if the class matches up with the ClassName parameter.

	@param instance -- The instance that will get affected by this function.
	@param ClassName -- The class that the children are required to have to get deleted.
	@tag Instance Function
]=]
function utility:ClearAllChildrenWithClass(instance: Instance, ClassName: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(ClassName) ~= string, "The name must be a string.")

	for _, children in pairs(instance:GetChildren()) do
		if children.ClassName == ClassName then
			children:Destroy()
		end
	end
end

--[=[ 
	Clears All Descendants if the name matches up with the Name parameter.

	@param instance -- The instance that will get affected by this function.
	@param Name -- The name that the descendants are required to have to get deleted.
	@tag Instance Function
]=]
function utility:ClearAllDescendantsWithName(instance: Instance, Name: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Name) ~= string, "The name must be a string.")

	for _, descendant in pairs(instance:GetDescendants()) do
		if descendant.Name == Name then
			descendant:Destroy()
		end
	end
end

--[=[ 
	Clears All Descendants if the class matches up with the Class parameter.

	@param instance -- The instance that will get affected by this function.
	@param Class -- The class that the descendants are required to have to get deleted.
	@tag Instance Function
]=]
function utility:ClearAllDescendantsWithClass(instance: Instance, Class: string)
	assert(instance, "In order to get children with name, please add an instance")
	assert(typeof(Class) ~= string, "The name must be a string.")

	for _, descendant in pairs(instance:GetDescendants()) do
		if descendant.ClassName == Class then
			descendant:Destroy()
		end
	end
end

--[=[ 
	Returns all children with the same name as the given one.

	@param instance -- The instance that will get affected by this function.
	@param Name -- The name that the children are required to have.
	@tag Instance Function
]=]
function utility:GetChildrenWithName(instance: Instance, Name: string): { Instance }
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

--[=[ 
	Returns all children with the same class as the given one.

	@param instance -- The instance that will get affected by this function.
	@param ClassName -- The class that the children are required to have.
	@tag Instance Function
]=]
function utility:GetChildrenWithClass(instance: Instance, ClassName: string): { Instance }
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

--[=[ 
	Returns all descendats with the same name as the given one.

	@param instance -- The instance that will get affected by this function.
	@param Name -- The name that the children are required to have.
	@tag Instance Function
]=]
function utility:GetDescendantsWithName(instance: Instance, Name: string): { Instance }
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

--[=[ 
	Returns all descendats with the same class as the given one.

	@param instance -- The instance that will get affected by this function.
	@param ClassName -- The class that the children are required to have.
	@tag Instance Function
]=]
function utility:GetDescendantsWithClass(instance: Instance, ClassName: string): { Instance }
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

--[=[ 
	Returns a boolean indicating if there is any existing child with the given name.

	@param instance -- The instance that will get affected by this function.
	@param Name -- The name that the children is required to have.
	@tag Instance Function
	@deprecated v1 -- You might want to use Instance:FindFirstChild() instead.
]=]
function utility:HasChildWithName(instance: Instance, Name: string): boolean
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

--[=[ 
	Returns a boolean indicating if there is any existing child with the given class.

	@param instance -- The instance that will get affected by this function.
	@param ClassName -- The class that the children is required to have.
	@tag Instance Function
	@deprecated v1 -- You might want to use Instance:FindFirstChildOfClass() instead.
]=]
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

--[=[ 
	Returns a boolean indicating if there is any existing descendant with the given name.

	@param instance -- The instance that will get affected by this function.
	@param Name -- The name that the children is required to have.
	@tag Instance Function
	@deprecated v1 -- You might want to use Instance:FindFirstChild() instead.
]=]
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

--[=[ 
	Returns a boolean indicating if there is any existing descendant with the given class.

	@param instance -- The instance that will get affected by this function.
	@param ClassName -- The class that the children is required to have.
	@tag Instance Function
	@deprecated v1 -- You might want to use Instance:FindFirstChildOfClass() instead.
]=]
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

--[=[ 
	Ungroups the model (or folder or any instance for that matter) and if provided with a parent, all children of the model will go there,
	else the parent of the model

	@param Model -- The model that should be ungrouped.
	@param Parent -- The parent that the children inside the model will be on. If none then the parent of the model.
	@tag Instance Function
]=]
function utility:UngroupModel(Model: Model | Folder | Instance, Parent: Instance)
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

--[=[ 
	Returns the amount of Attributes that an instance has

	@param instance -- The instance that should be checked for attributes.
	@tag Instance Function
]=]
function utility:GetAmountOfAttributes(instance : Instance): number
	local ReturningNumber = 0

	for _, _ in pairs(instance:GetAttributes()) do
		ReturningNumber += 1
	end

	return ReturningNumber
end

--[=[ 
	Creates a simple blank part with no collision, transparency. Size of 1,1,1 and Anchored set to true. An attachment will also be inside.

	@tag Instance Function
]=]
function utility.CreateBlankPart(): Part
	local Part = Instance.new("Part")
	local Attachment = Instance.new("Attachment")

	Part.CanCollide = false
	Part.Transparency = true
	Part.Anchored = true
	Part.Size = Vector3.new(1, 1, 1)
	Attachment.Parent = Part

	return Part
end

-- ------ TABLE FUNCTIONS --------

--[=[ 
	For every value in the table, the callback will fire with the
	value as the parameter. The callback MUST return a boolean. If the boolean is true on that value then it'll add to the
	returning table, else ignore.

	@param t -- The table that should be filtered.
	@param callBack -- The callback function that determines wheter to filter the certain value or not. MUST return a boolean.
	@tag Table Function
]=]
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

--[=[ 
	Clears every instance, connection, thread, key and table in the given table. The table itself will not be cleared.

	@param SentTable -- The table that should be cleared.
	@tag Table Function
]=]
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

--[=[ 
	Returns the total sum of the numbers in the given table. (if there aren't any numbers, it'll return 0).

	@param SentTable -- The table that should be counted.
	@tag Table Function
]=]
function utility:GetWeightOfTable(SentTable: table): number
	assert(SentTable, "Please provide a table.")
	local returningNumber = 0

	for _, values in pairs(SentTable) do
		if type(values) == "number" then
			returningNumber += values
		end
	end

	return returningNumber
end

--[=[ 
	Returns a table (keys included) with only the values that match the Name inside the sent table.

	@param SentTable -- The table that should be filtered.
	@param Name -- The name of the values that should be searched.
	@tag Table Function
]=]
function utility:GetValuesWithName<T>(SentTable: { T }, Name: string): { [any?]: string }
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

--[=[ 
	Returns a table with only the the keys that match the name (values will not be checked) inside the sent table.

	@param SentTable -- The table that should be filtered.
	@param Name -- The name of the keys that should be searched.
	@tag Table Function
	@deprecated v1 -- This thing is straight up pointless.
]=]
function utility:GetAllKeysWithName(SentTable: table, Name: string): { [string]: any }
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

--[=[ 
	Clears all values inside the sent table that match the given Name. Keys will not be deleted.

	@param SentTable -- The table that should be filtered.
	@param Name -- The name of the values that should be searched.
	@tag Table Function
]=]
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

--[=[ 
	Returns a boolean indicating if a value with the give name exists on the table.

	@param SentTable -- The table that should be searched.
	@param Name -- The name of the values that should be searched.
	@tag Table Function
]=]
function utility:HasValueWithName(SentTable: table, Name: string): boolean
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

--[=[ 
	Creates a model with and parents all the instances in the table to it, the model will be parented to the given one.
	Returns the model.

	@param SentTable -- The table that should be made into a model.
	@param InstanceParent -- The parent that the model will go on.
	@tag Table Function
]=]
function utility:GroupTable(SentTable: table, InstanceParent: Instance): Model
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

-- ------ RADIUS --------

--[=[ 
	Returns a table with all the humanoids in the position within the radius given.
	If AliveOnly is true, it'll only get alive humanoids.

	@param Position -- The position that the radius will search on
	@param Radius -- The radius that it will detect humanoids on.
	@param OverlapParam -- Optional params.
	@param AliveOnly -- If true, it will only get humanoids who are alive.
	@tag Radius Function
]=]
function utility:GetHumanoidsInRadius(
	Position: Vector3,
	Radius: number,
	OverlapParam: OverlapParams?,
	AliveOnly: boolean?
): { Humanoid }
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

--[=[ 
	Returns a table with all the models in the position within the radius given.

	@param Position -- The position that the radius will search on
	@param Radius -- The radius that it will detect models on.
	@param OverlapParam -- Optional params.
	@tag Radius Function
]=]
function utility:GetModelsInRadius(Position: Vector3, Radius: number, OverlapParam: OverlapParams?): { Model }
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

--[=[ 
	Returns a table with all the parts in the position within the radius given that have the same name as the one provided.

	@param Position -- The position that the radius will search on
	@param Radius -- The radius that it will detect models on.
	@param OverlapParam -- Optional params.
	@param Name -- The name that the parts should have.
	@tag Radius Function
]=]
function utility:GetPartsWithNameInRadius(
	Position: Vector3,
	Radius: number,
	OverlapParam: OverlapParams?,
	Name: string
): { BasePart }
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

--[=[ 
	Returns a table with all the parts in the position within the radius given that have the same class as the one provided.

	@param Position -- The position that the radius will search on
	@param Radius -- The radius that it will detect models on.
	@param OverlapParam -- Optional params.
	@param Class -- The class that the parts should have.
	@tag Radius Function
]=]
function utility:GetPartsWithClassInRadius(
	Position: Vector3,
	Radius: number,
	OverlapParam: OverlapParams?,
	Class: string
): { BasePart }
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

--[=[ 
	Cast a raycast and returns a boolean indicating if the ray hit the basepart or anything inside the model. If a dot product is provided,
	it will check if it's facing the part too, the dot product goes from -1 (looking backwards) till 1 (looking directly at the part).
	If distance is provided, then it will also check if the distance is at least the number provided.

	@param Position -- The position that the raycast will start on.
	@param Target -- The part or model that should be checked.
	@param RayCastParams -- Optional params.
	@param DotProduct -- The minimum dot product it should have.
	@param Distance -- The maximum distance it should have.
	@tag Radius Function
]=]
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

-- ------ EVENTS --------

--[=[ 
	Connect the given event to the given function and after fired disconnects it immediately.

	@param Event -- The event that should be connected.
	@param Function -- The callback function.
	@tag Event Function
	@deprecated v1 -- Please use RBXScriptSignal:Once() instead.
]=]
function utility:ConnectOnce(Event: RBXScriptSignal, Function: "function"): RBXScriptConnection
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

--[=[ 
	Connect the given event to the given function and after fired for the amount provided, disconnects it immediately.

	@param Limit -- The max amount of times that this even can be fired.
	@param Event -- The event that should be connected.
	@param Function -- The callback function.
	@tag Event Function
]=]
function utility:ConnectLimited(Limit: number, Event: RBXScriptSignal, Function: "function"): RBXScriptConnection
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

--[=[ 
	Connect the given event to the given function. If the binded Bind is disconnected, so will this.

	@param Event -- The event that should be connected.
	@param callback -- The callback function.
	@param Bind -- The connection that it should be binded to.
	@tag Event Function
]=]
function utility:ConnectBind(
	Event: RBXScriptSignal,
	callback: (...any) -> (),
	Bind: RBXScriptConnection
): RBXScriptConnection
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

-- ------ COUNTDOWN --------

--[=[ 
	Returns a boolean indicating if the given table is a Countdown.

	@param t -- The table that should be checked.
]=]
function utility:IsACountdown(t: table): boolean
	assert(typeof(t) == table, "Please provide a table.")

	return getmetatable(t) == Countdown and t.ClassName == "Countdown"
end

--[=[ 
	Returns Countdown class.

	@param MaxCount -- The max count that the countdown should have.
]=]
function utility.newCountdown(MaxCount: number?): Countdown
	return Countdown.new(MaxCount)
end

-- ------ QUEUE --------

--[=[ 
	Returns a boolean indicating if the given table is a Queue.

	@param t -- The table that should be checked.
]=]
function utility:IsAQueue(t: table): boolean
	assert(typeof(t) == table, "Please provide a table.")

	return getmetatable(t) == Queue and t.ClassName == "Queue"
end

--[=[ 
	Returns Queue class.
]=]
function utility.newQueue(): Queue
	return Queue.new()
end

-- ------ METER --------

--[=[ 
	Returns a boolean indicating if the given table is a Meter.

	@param t -- The table that should be checked.
]=]
function utility:IsAMeter(t: table): boolean
	assert(typeof(t) == table, "Please provide a table.")

	return getmetatable(t) == Meter and t.ClassName == "Meter"
end

--[=[ 
	Returns Meter class.

	@param Minimum -- The minimum a meter value will go.
	@param Maximum -- The maximum a meter value will go.
]=]
function utility.newMeter(Minimum: number?, Maximum: number?): Meter
	return Meter.new(Minimum, Maximum)
end

-- ------ TRACKER --------

--[=[ 
	Returns a boolean indicating if the given table is a Tracker.

	@param t -- The table that should be checked.
]=]
function utility:IsATracker(t: table): boolean
	assert(typeof(t) == table, "Please provide a table.")

	return getmetatable(t) == Tracker and t.ClassName == "Tracker"
end

--[=[ 
	Returns Tracker class.

	@param Origin -- The oring vector or part that tracks.
	@param Target -- The tracking vector or object.
]=]
function utility.newTracker(Origin: BasePart | Vector3, Target: BasePart | Vector3): Tracker
	return Tracker.new(Origin, Target)
end

return utility
