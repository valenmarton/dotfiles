return {
	"ThePrimeagen/harpoon",

	config = function()
		local harpoon_ui = require("harpoon.ui")
		local harpoon_mark = require("harpoon.mark")

		vim.keymap.set("n", "<leader>a", function()
			harpoon_mark.add_file()
		end)
		vim.keymap.set("n", "<leader>e>", function()
			harpoon_ui.toggle_quick_menu()
		end)

		vim.keymap.set("n", "<C-e>", function()
			harpoon_ui.nav_file(1)
		end)
		vim.keymap.set("n", "<C-r>", function()
			harpoon_ui.nav_file(2)
		end)
		vim.keymap.set("n", "<C-t>", function()
			harpoon_ui.nav_file(3)
		end)
		vim.keymap.set("n", "<C-y>", function()
			harpoon_ui.nav_file(4)
		end)
	end,
}
