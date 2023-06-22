"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[172],{95130:e=>{e.exports=JSON.parse('{"functions":[{"name":"ClearAllChildrenWithName","desc":" \\nClears All Children if the name matches up with the Name parameter.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"Name","desc":"The name that the children are required to have to get deleted.","lua_type":"string"}],"returns":[],"function_type":"method","tags":["Instance Function"],"source":{"line":118,"path":"src/UtilityModule/init.lua"}},{"name":"ClearAllChildrenWithClass","desc":" \\nClears All Children if the class matches up with the ClassName parameter.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"ClassName","desc":"The class that the children are required to have to get deleted.","lua_type":"string"}],"returns":[],"function_type":"method","tags":["Instance Function"],"source":{"line":136,"path":"src/UtilityModule/init.lua"}},{"name":"ClearAllDescendantsWithName","desc":" \\nClears All Descendants if the name matches up with the Name parameter.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"Name","desc":"The name that the descendants are required to have to get deleted.","lua_type":"string"}],"returns":[],"function_type":"method","tags":["Instance Function"],"source":{"line":154,"path":"src/UtilityModule/init.lua"}},{"name":"ClearAllDescendantsWithClass","desc":" \\nClears All Descendants if the class matches up with the Class parameter.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"Class","desc":"The class that the descendants are required to have to get deleted.","lua_type":"string"}],"returns":[],"function_type":"method","tags":["Instance Function"],"source":{"line":172,"path":"src/UtilityModule/init.lua"}},{"name":"GetChildrenWithName","desc":" \\nReturns all children with the same name as the given one.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"Name","desc":"The name that the children are required to have.","lua_type":"string"}],"returns":[{"desc":"","lua_type":"{ Instance }\\r\\n"}],"function_type":"method","tags":["Instance Function"],"source":{"line":190,"path":"src/UtilityModule/init.lua"}},{"name":"GetChildrenWithClass","desc":" \\nReturns all children with the same class as the given one.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"ClassName","desc":"The class that the children are required to have.","lua_type":"string"}],"returns":[{"desc":"","lua_type":"{ Instance }\\r\\n"}],"function_type":"method","tags":["Instance Function"],"source":{"line":211,"path":"src/UtilityModule/init.lua"}},{"name":"GetDescendantsWithName","desc":" \\nReturns all descendats with the same name as the given one.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"Name","desc":"The name that the children are required to have.","lua_type":"string"}],"returns":[{"desc":"","lua_type":"{ Instance }\\r\\n"}],"function_type":"method","tags":["Instance Function"],"source":{"line":232,"path":"src/UtilityModule/init.lua"}},{"name":"GetDescendantsWithClass","desc":" \\nReturns all descendats with the same class as the given one.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"ClassName","desc":"The class that the children are required to have.","lua_type":"string"}],"returns":[{"desc":"","lua_type":"{ Instance }\\r\\n"}],"function_type":"method","tags":["Instance Function"],"source":{"line":253,"path":"src/UtilityModule/init.lua"}},{"name":"HasChildWithName","desc":" \\nReturns a boolean indicating if there is any existing child with the given name.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"Name","desc":"The name that the children is required to have.","lua_type":"string"}],"returns":[{"desc":"","lua_type":"boolean\\r\\n"}],"function_type":"method","tags":["Instance Function"],"deprecated":{"version":"v1","desc":"You might want to use Instance:FindFirstChild() instead."},"source":{"line":275,"path":"src/UtilityModule/init.lua"}},{"name":"HasChildWithClass","desc":" \\nReturns a boolean indicating if there is any existing child with the given class.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"ClassName","desc":"The class that the children is required to have.","lua_type":"string"}],"returns":[],"function_type":"method","tags":["Instance Function"],"deprecated":{"version":"v1","desc":"You might want to use Instance:FindFirstChildOfClass() instead."},"source":{"line":299,"path":"src/UtilityModule/init.lua"}},{"name":"HasDescendantWithName","desc":" \\nReturns a boolean indicating if there is any existing descendant with the given name.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"Name","desc":"The name that the children is required to have.","lua_type":"string"}],"returns":[],"function_type":"method","tags":["Instance Function"],"deprecated":{"version":"v1","desc":"You might want to use Instance:FindFirstChild() instead."},"source":{"line":323,"path":"src/UtilityModule/init.lua"}},{"name":"HasDescendantWithClass","desc":" \\nReturns a boolean indicating if there is any existing descendant with the given class.","params":[{"name":"instance","desc":"The instance that will get affected by this function.","lua_type":"Instance"},{"name":"ClassName","desc":"The class that the children is required to have.","lua_type":"string"}],"returns":[],"function_type":"method","tags":["Instance Function"],"deprecated":{"version":"v1","desc":"You might want to use Instance:FindFirstChildOfClass() instead."},"source":{"line":347,"path":"src/UtilityModule/init.lua"}},{"name":"UngroupModel","desc":" \\nUngroups the model (or folder or any instance for that matter) and if provided with a parent, all children of the model will go there,\\nelse the parent of the model","params":[{"name":"Model","desc":"The model that should be ungrouped.","lua_type":"Model | Folder | Instance"},{"name":"Parent","desc":"The parent that the children inside the model will be on. If none then the parent of the model.","lua_type":"Instance"}],"returns":[],"function_type":"method","tags":["Instance Function"],"source":{"line":371,"path":"src/UtilityModule/init.lua"}},{"name":"FilterTable","desc":" \\nFor every value in the table, the callback will fire with the\\nvalue as the parameter. The callback MUST return a boolean. If the boolean is true on that value then it\'ll add to the\\nreturning table, else ignore.","params":[{"name":"t","desc":"The table that should be filtered.","lua_type":"{ T }"},{"name":"callBack","desc":"The callback function that determines wheter to filter the certain value or not. MUST return a boolean.","lua_type":"(value: T) -> boolean"}],"returns":[{"desc":"","lua_type":"{ any }\\r\\n"}],"function_type":"method","tags":["Table Function"],"source":{"line":398,"path":"src/UtilityModule/init.lua"}},{"name":"DeepClearTable","desc":" \\nClears every instance, connection, thread, key and table in the given table. The table itself will not be cleared.","params":[{"name":"SentTable","desc":"The table that should be cleared.","lua_type":"{ any }"}],"returns":[],"function_type":"method","tags":["Table Function"],"source":{"line":418,"path":"src/UtilityModule/init.lua"}},{"name":"GetWeightOfTable","desc":" \\nReturns the total sum of the numbers in the given table. (if there aren\'t any numbers, it\'ll return 0).","params":[{"name":"SentTable","desc":"The table that should be counted.","lua_type":"table"}],"returns":[{"desc":"","lua_type":"number\\r\\n"}],"function_type":"method","tags":["Table Function"],"source":{"line":445,"path":"src/UtilityModule/init.lua"}},{"name":"GetValuesWithName","desc":" \\nReturns a table (keys included) with only the values that match the Name inside the sent table.","params":[{"name":"SentTable","desc":"The table that should be filtered.","lua_type":"{ T }"},{"name":"Name","desc":"The name of the values that should be searched.","lua_type":"string"}],"returns":[{"desc":"","lua_type":"{ [any?]: string }\\r\\n"}],"function_type":"method","tags":["Table Function"],"source":{"line":465,"path":"src/UtilityModule/init.lua"}},{"name":"GetAllKeysWithName","desc":" \\nReturns a table with only the the keys that match the name (values will not be checked) inside the sent table.","params":[{"name":"SentTable","desc":"The table that should be filtered.","lua_type":"table"},{"name":"Name","desc":"The name of the keys that should be searched.","lua_type":"string"}],"returns":[{"desc":"","lua_type":"{ [string]: any }\\r\\n"}],"function_type":"method","tags":["Table Function"],"deprecated":{"version":"v1","desc":"This thing is straight up pointless."},"source":{"line":491,"path":"src/UtilityModule/init.lua"}},{"name":"ClearAllValuesWithName","desc":" \\nClears all values inside the sent table that match the given Name. Keys will not be deleted.","params":[{"name":"SentTable","desc":"The table that should be filtered.","lua_type":"table"},{"name":"Name","desc":"The name of the values that should be searched.","lua_type":"string"}],"returns":[],"function_type":"method","tags":["Table Function"],"source":{"line":515,"path":"src/UtilityModule/init.lua"}},{"name":"HasValueWithName","desc":" \\nReturns a boolean indicating if a value with the give name exists on the table.","params":[{"name":"SentTable","desc":"The table that should be searched.","lua_type":"table"},{"name":"Name","desc":"The name of the values that should be searched.","lua_type":"string"}],"returns":[{"desc":"","lua_type":"boolean\\r\\n"}],"function_type":"method","tags":["Table Function"],"source":{"line":541,"path":"src/UtilityModule/init.lua"}},{"name":"GroupTable","desc":" \\nCreates a model with and parents all the instances in the table to it, the model will be parented to the given one.\\nReturns the model.","params":[{"name":"SentTable","desc":"The table that should be made into a model.","lua_type":"table"},{"name":"InstanceParent","desc":"The parent that the model will go on.","lua_type":"Instance"}],"returns":[{"desc":"","lua_type":"Model\\r\\n"}],"function_type":"method","tags":["Table Function"],"source":{"line":571,"path":"src/UtilityModule/init.lua"}},{"name":"GetHumanoidsInRadius","desc":" \\nReturns a table with all the humanoids in the position within the radius given.\\nIf AliveOnly is true, it\'ll only get alive humanoids.","params":[{"name":"Position","desc":"The position that the radius will search on","lua_type":"Vector3"},{"name":"Radius","desc":"The radius that it will detect humanoids on.","lua_type":"number"},{"name":"OverlapParam","desc":"Optional params.","lua_type":"OverlapParams?"},{"name":"AliveOnly","desc":"If true, it will only get humanoids who are alive.","lua_type":"boolean?\\r\\n"}],"returns":[{"desc":"","lua_type":"{ Humanoid }\\r\\n"}],"function_type":"method","tags":["Radius Function"],"source":{"line":601,"path":"src/UtilityModule/init.lua"}},{"name":"GetModelsInRadius","desc":" \\nReturns a table with all the models in the position within the radius given.","params":[{"name":"Position","desc":"The position that the radius will search on","lua_type":"Vector3"},{"name":"Radius","desc":"The radius that it will detect models on.","lua_type":"number"},{"name":"OverlapParam","desc":"Optional params.","lua_type":"OverlapParams?"}],"returns":[{"desc":"","lua_type":"{Model}\\r\\n"}],"function_type":"method","tags":["Radius Function"],"source":{"line":640,"path":"src/UtilityModule/init.lua"}},{"name":"GetPartsWithNameInRadius","desc":" \\nReturns a table with all the parts in the position within the radius given that have the same name as the one provided.","params":[{"name":"Position","desc":"The position that the radius will search on","lua_type":"Vector3"},{"name":"Radius","desc":"The radius that it will detect models on.","lua_type":"number"},{"name":"OverlapParam","desc":"Optional params.","lua_type":"OverlapParams?"},{"name":"Name","desc":"The name that the parts should have.","lua_type":"string\\r\\n"}],"returns":[{"desc":"","lua_type":"{ BasePart }\\r\\n"}],"function_type":"method","tags":["Radius Function"],"source":{"line":670,"path":"src/UtilityModule/init.lua"}},{"name":"GetPartsWithClassInRadius","desc":" \\nReturns a table with all the parts in the position within the radius given that have the same class as the one provided.","params":[{"name":"Position","desc":"The position that the radius will search on","lua_type":"Vector3"},{"name":"Radius","desc":"The radius that it will detect models on.","lua_type":"number"},{"name":"OverlapParam","desc":"Optional params.","lua_type":"OverlapParams?"},{"name":"Class","desc":"The class that the parts should have.","lua_type":"string\\r\\n"}],"returns":[{"desc":"","lua_type":"{ BasePart }\\r\\n"}],"function_type":"method","tags":["Radius Function"],"source":{"line":704,"path":"src/UtilityModule/init.lua"}},{"name":"CanSeeTarget","desc":" \\nCast a raycast and returns a boolean indicating if the ray hit the basepart or anything inside the model. If a dot product is provided,\\nit will check if it\'s facing the part too, the dot product goes from -1 (looking backwards) till 1 (looking directly at the part).\\nIf distance is provided, then it will also check if the distance is at least the number provided.","params":[{"name":"Position","desc":"The position that the raycast will start on.","lua_type":"Vector3 | CFrame"},{"name":"Target","desc":"The part or model that should be checked.","lua_type":"BasePart | Model"},{"name":"RayCastParams","desc":"Optional params.","lua_type":"RaycastParams?"},{"name":"DotProduct","desc":"The minimum dot product it should have.","lua_type":"number?"},{"name":"Distance","desc":"The maximum distance it should have.","lua_type":"number?\\r\\n"}],"returns":[{"desc":"","lua_type":"boolean\\r\\n"}],"function_type":"static","tags":["Radius Function"],"source":{"line":741,"path":"src/UtilityModule/init.lua"}},{"name":"ConnectOnce","desc":" \\nConnect the given event to the given function and after fired disconnects it immediately.","params":[{"name":"Event","desc":"The event that should be connected.","lua_type":"RBXScriptSignal"},{"name":"Function","desc":"The callback function.","lua_type":"\\"function\\""}],"returns":[{"desc":"","lua_type":"RBXScriptConnection\\r\\n"}],"function_type":"method","tags":["Event Function"],"deprecated":{"version":"v1","desc":"Please use RBXScriptSignal:Once() instead."},"source":{"line":792,"path":"src/UtilityModule/init.lua"}},{"name":"ConnectLimited","desc":" \\nConnect the given event to the given function and after fired for the amount provided, disconnects it immediately.","params":[{"name":"Limit","desc":"The max amount of times that this even can be fired.","lua_type":"number"},{"name":"Event","desc":"The event that should be connected.","lua_type":"RBXScriptSignal"},{"name":"Function","desc":"The callback function.","lua_type":"\\"function\\""}],"returns":[{"desc":"","lua_type":"RBXScriptConnection\\r\\n"}],"function_type":"method","tags":["Event Function"],"source":{"line":818,"path":"src/UtilityModule/init.lua"}},{"name":"ConnectBind","desc":" \\nConnect the given event to the given function. If the binded Bind is disconnected, so will this.","params":[{"name":"Event","desc":"The event that should be connected.","lua_type":"RBXScriptSignal"},{"name":"callback","desc":"The callback function.","lua_type":"(...any) -> ()"},{"name":"Bind","desc":"The connection that it should be binded to.","lua_type":"RBXScriptConnection"}],"returns":[{"desc":"","lua_type":"RBXScriptConnection\\r\\n"}],"function_type":"method","tags":["Event Function"],"source":{"line":849,"path":"src/UtilityModule/init.lua"}},{"name":"IsACountdown","desc":" \\nReturns a boolean indicating if the given table is a Countdown.","params":[{"name":"t","desc":"The table that should be checked.","lua_type":"table"}],"returns":[{"desc":"","lua_type":"boolean\\r\\n"}],"function_type":"method","source":{"line":879,"path":"src/UtilityModule/init.lua"}},{"name":"newCountdown","desc":" \\nReturns Countdown class.","params":[{"name":"MaxCount","desc":"The max count that the countdown should have.","lua_type":"number?"}],"returns":[{"desc":"","lua_type":"Countdown\\r\\n"}],"function_type":"static","source":{"line":890,"path":"src/UtilityModule/init.lua"}},{"name":"IsAQueue","desc":" \\nReturns a boolean indicating if the given table is a Queue.","params":[{"name":"t","desc":"The table that should be checked.","lua_type":"table"}],"returns":[{"desc":"","lua_type":"boolean\\r\\n"}],"function_type":"method","source":{"line":901,"path":"src/UtilityModule/init.lua"}},{"name":"newQueue","desc":" \\nReturns Queue class.","params":[],"returns":[{"desc":"","lua_type":"Queue\\r\\n"}],"function_type":"static","source":{"line":910,"path":"src/UtilityModule/init.lua"}},{"name":"IsAMeter","desc":" \\nReturns a boolean indicating if the given table is a Meter.","params":[{"name":"t","desc":"The table that should be checked.","lua_type":"table"}],"returns":[{"desc":"","lua_type":"boolean\\r\\n"}],"function_type":"method","source":{"line":921,"path":"src/UtilityModule/init.lua"}},{"name":"newMeter","desc":" \\nReturns Meter class.","params":[{"name":"Minimum","desc":"The minimum a meter value will go.","lua_type":"number?"},{"name":"Maximum","desc":"The maximum a meter value will go.","lua_type":"number?"}],"returns":[{"desc":"","lua_type":"Meter\\r\\n"}],"function_type":"static","source":{"line":933,"path":"src/UtilityModule/init.lua"}},{"name":"IsATracker","desc":" \\nReturns a boolean indicating if the given table is a Tracker.","params":[{"name":"t","desc":"The table that should be checked.","lua_type":"table"}],"returns":[{"desc":"","lua_type":"boolean\\r\\n"}],"function_type":"method","source":{"line":944,"path":"src/UtilityModule/init.lua"}},{"name":"newTracker","desc":" \\nReturns Tracker class.","params":[{"name":"Origin","desc":"The oring vector or part that tracks.","lua_type":"BasePart | Vector3"},{"name":"Target","desc":"The tracking vector or object.","lua_type":"BasePart | Vector3"}],"returns":[{"desc":"","lua_type":"Tracker\\r\\n"}],"function_type":"static","source":{"line":956,"path":"src/UtilityModule/init.lua"}}],"properties":[],"types":[],"name":"utility","desc":" \\nInside the **Main Module**, you\'ll find the following:","source":{"line":107,"path":"src/UtilityModule/init.lua"}}')}}]);