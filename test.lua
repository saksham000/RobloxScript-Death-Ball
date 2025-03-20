local function debugPrint(...)
    print("[DEBUG]:", ...)
end

-- Capture function mappings if 'j' is used for obfuscation
local j = {}
setmetatable(j, {
    __index = function(t, k)
        return function(...)
            local args = {...}
            debugPrint("Function called:", k, "Args:", table.concat(args, ", "))
            return args[1] -- Returning first argument (modify if needed)
        end
    end
})

-- Capture global variable assignments
local W = {}
setmetatable(W, {
    __newindex = function(t, k, v)
        rawset(t, k, v)
        debugPrint("Variable assigned:", k, "->", v)
    end
})

-- Hook key functions
local oldLoadstring = loadstring
loadstring = function(code, ...)
    debugPrint("Executing code:", code)
    return oldLoadstring(code, ...)
end

local oldPcall = pcall
pcall = function(func, ...)
    debugPrint("pcall executed")
    return oldPcall(func, ...)
end

debugPrint("Deobfuscation Hook Installed")
