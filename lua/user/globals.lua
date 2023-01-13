P = function(v)
	print(vim.inspect(v))
	return v
end

specifyArgsForJava = function()
	--- refresh ?= JdtDebugRefreshConfigs
	local dap = require("dap")
	if dap.configurations.java == nil then
		print("Dap does not hava java config yet")
		return
	end

	local opts = {}
	for i, key in pairs(dap.configurations.java) do
		opts[i] = key.mainClass
	end

	local onSelectClass = function(s,idx)
		if s == nil then
			return
		end
		print("Got: " .. s)
		local onInputParams = function(i)
			print("Input for " .. s .. ": " .. i)
            dap.configurations.java[idx].args=i
		end
		vim.ui.input({ prompt = "Commandline params for " .. s .. ":",default=dap.configurations.java[idx].args }, onInputParams)
	end

	vim.ui.select(opts, { prompt = "Main Class" }, onSelectClass)
end
