return {
	enabled = false,
	"ggandor/leap.nvim",
	config = function()
		require("leap").create_default_mappings()
	end,
}
