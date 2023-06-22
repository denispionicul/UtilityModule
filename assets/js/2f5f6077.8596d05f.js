"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[792],{77062:e=>{e.exports=JSON.parse('{"functions":[{"name":"Start","desc":" \\nStarts the queue and begins going through the functions.","params":[{"name":"self","desc":"","lua_type":"Queue"}],"returns":[],"function_type":"static","source":{"line":56,"path":"src/UtilityModule/Queue.lua"}},{"name":"Clear","desc":" \\nClears all the queued functions.","params":[{"name":"self","desc":"","lua_type":"Queue"}],"returns":[],"function_type":"static","source":{"line":76,"path":"src/UtilityModule/Queue.lua"}},{"name":"Pause","desc":" \\nPauses the queue from running further.","params":[{"name":"self","desc":"","lua_type":"Queue"}],"returns":[],"function_type":"static","source":{"line":83,"path":"src/UtilityModule/Queue.lua"}},{"name":"Stop","desc":" \\nStops the queue and clears all queued functions.","params":[{"name":"self","desc":"","lua_type":"Queue"}],"returns":[],"function_type":"static","source":{"line":93,"path":"src/UtilityModule/Queue.lua"}},{"name":"Add","desc":" \\nAdds a function to the queue.","params":[{"name":"self","desc":"","lua_type":"Queue"},{"name":"func","desc":"The function to add to the queue.","lua_type":"() -> ()"}],"returns":[],"function_type":"static","source":{"line":104,"path":"src/UtilityModule/Queue.lua"}},{"name":"Remove","desc":" \\nRemoves a function from the queue.","params":[{"name":"self","desc":"","lua_type":"Queue"},{"name":"num","desc":"The number of the function to remove.","lua_type":"number"}],"returns":[],"function_type":"static","source":{"line":115,"path":"src/UtilityModule/Queue.lua"}},{"name":"GetQueues","desc":" \\nReturns a list of all queued functions.","params":[{"name":"self","desc":"","lua_type":"Queue"}],"returns":[{"desc":"","lua_type":"{ () -> any }\\r\\n"}],"function_type":"static","source":{"line":124,"path":"src/UtilityModule/Queue.lua"}},{"name":"Destroy","desc":" \\nGets rid of the queue.","params":[{"name":"self","desc":"","lua_type":"Queue"}],"returns":[],"function_type":"static","source":{"line":131,"path":"src/UtilityModule/Queue.lua"}}],"properties":[{"name":"CurrentFunction","desc":" \\nThe current function that\'s running.","lua_type":"() -> () | nil","source":{"line":41,"path":"src/UtilityModule/Queue.lua"}},{"name":"OnEmpty","desc":" \\nFires whenever the queue empties.","lua_type":"RBXScriptSignal","source":{"line":46,"path":"src/UtilityModule/Queue.lua"}},{"name":"OnSwitch","desc":" \\nFires whenever the queue switches functions.","lua_type":"RBXScriptSignal","source":{"line":51,"path":"src/UtilityModule/Queue.lua"}}],"types":[{"name":"Queue","desc":" \\n\\nThe Queue class.","fields":[{"name":"CurrentFunction","lua_type":"() -> () | nil","desc":""},{"name":"OnEmpty","lua_type":"RBXScriptSignal","desc":""},{"name":"OnSwitch","lua_type":"RBXScriptSignal","desc":""}],"source":{"line":29,"path":"src/UtilityModule/Queue.lua"}}],"name":"Queue","desc":" \\n\\nA queue is a collection of functions that run in order. You can add functions and have them queued in a line, awaiting to \\nbe called. A queue can be **paused** or **stopped**.\\n:::note\\nYou can do self:Function() even if this document says Queue.Function(self)!\\n:::","source":{"line":15,"path":"src/UtilityModule/Queue.lua"}}')}}]);