local vim = vim;

function ColorMyShit(color)
	color = color or "rose-pine";
  local vimL = vim;
	vimL.cmd.colorscheme(color);

	-- Transparent Background
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" });

end

ColorMyShit();
