return {
    'epwalsh/obsidian.nvim',

	config = function()
		local status_ok, obsidian = pcall(require, "obsidian")

		if not status_ok then
			return
		end

		obsidian.setup({
			dir = "~/ObsidianRoot/",
			notes_subdir = "Notes",
			daily_notes = {
				folder = "Notes/DailyNotes",
			},
			completion = {
				nvim_cmp = true,
			},
			use_advanceduri = true,
		})
	end,
}
