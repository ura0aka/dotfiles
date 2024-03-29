local cmp = require'cmp'
local lspkind = require('lspkind')

require("cmp_dictionary").setup({
	dic = {
		["*"] = { "/usr/share/dict/words" },
	},
	spelllang = {
		en = "/Users/ura0aka/.config/nvim/thesaurus/mthesaur.txt",
		fr = "/usr/share/dict/"
	},
	-- The following are default values, so you don't need to write them if you don't want to change them
	exact = 2,
	async = true,
	capacity = 5,
	debug = false,
})


cmp.setup({
    formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50, 
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
snippet = {
  expand = function(args)
    vim.fn["vsnip#anonymous"](args.body)
  end,
},
mapping = {
  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item()),
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
},
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' },
}, {
  { name = 'buffer' },
})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
sources = {
  { name = 'buffer' }
}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

