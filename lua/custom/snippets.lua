local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node

print('SNIPPETS!')

ls.add_snippets("all", {
  snip({
    trig = "date",
    namr = "Date",
    dscr = "Date in the form of YYYY-MM-DD",
  }, {
    func(date, {}),
  }),
  snip({
      trig = "meta",
      namr = "Metadata",
      dscr = "Yaml metadata format for markdown"
    },
    {
      text({ "---",
        "title: " }), insert(1, "note_title"), text({ "",
      "author: " }), insert(2, "author"), text({ "",
      "date: " }), func(date, {}), text({ "",
      "categories: [" }), insert(3, ""), text({ "]",
      "lastmod: " }), func(date, {}), text({ "",
      "tags: [" }), insert(4), text({ "]",
      "comments: true",
      "---", "" }),
      insert(0)
    }),
})
