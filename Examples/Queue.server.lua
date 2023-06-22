local UtilityModule = require(script.Parent) -- path to UtilityModule
local Queue = UtilityModule.newQueue()

function AskForHelp()
    print("Help")
end

function Confusion()
    print("Excuse me?")
    task.wait(5)
end

Queue:Add(AskForHelp)
Queue:Add(AskForHelp)
Queue:Add(Confusion)
Queue:Add(AskForHelp)

Queue:Start()