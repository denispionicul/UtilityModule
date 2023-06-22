local UtilityModule = require(script.Parent) -- path to UtilityModule
local Countdown = UtilityModule.newCountdown(30)
local RandomEvent = Instance.new("BindableEvent")

Countdown.UpdateEvent = RandomEvent.Event

Countdown:Start(30)

Countdown.OnCount:Connect(function(timer)
    print(timer)
end)

local Task = task.spawn(function()
    while true do
        task.wait(5)
        RandomEvent:Fire()
    end
end)

Countdown.OnFinished:Connect(function()
   task.cancel(Task)
end)