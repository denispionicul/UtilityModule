local UtilityModule = require(script.Parent.Parent)
local Queue = UtilityModule.newQueue()

function CriForHelp()
    print("HEEEELP HEELP MEE")
end

function what()
    print("r u fr")
    task.wait(5)
end

Queue:Add(what)
Queue:Add(CriForHelp)
Queue:Add(what)
Queue:Add(CriForHelp)

Queue:Start()