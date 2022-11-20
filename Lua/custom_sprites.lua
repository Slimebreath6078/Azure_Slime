editor_objlist["text_textof"] = {
    name = "text_textof",
    sprite_in_root = false,
    sprite = "text_textof",
    unittype = "text",
    tags = { "word_prefix", "word_special" },
    tiling = -1,
    type = 9,
    layer = 20,
    colour = { 4, 0 },
    colour_active = { 4, 1 },
}
editor_objlist["unicorn"] = {
    name = "unicorn",
    sprite_in_root = false,
    sprite = "hmsunicorn",
    unittype = "object",
    tags = { "machine" },
    tiling = -1,
    type = 0,
    layer = 16,
    colour = { 3, 1 },
}
editor_objlist["text_unicorn"] = {
    name = "text_unicorn",
    sprite_in_root = false,
    sprite = "text_hmsunicorn",
    unittype = "text",
    tags = { "machine" },
    tiling = -1,
    type = 0,
    layer = 20,
    colour = { 3, 0 },
    colour_active = { 3, 1 },
}
editor_objlist["text_swim"] = {
    name = "text_swim",
    sprite_in_root = false,
    sprite = "text_swim",
    unittype = "text",
    tags = { "water", "word_quality" },
    tiling = -1,
    type = 2,
    layer = 20,
    colour = { 3, 2 },
    colour_active = { 3, 3 },
    pairedwith = "text_sink",
}
editor_objlist["cube"] = {
    name = "cube",
    sprite_in_root = false,
    sprite = "cube",
    unittype = "object",
    tags = { "common", "decorative" },
    tiling = -1,
    type = 0,
    layer = 16,
    colour = { 1, 3 },
}
editor_objlist["text_cube"] = {
    name = "text_cube",
    sprite_in_root = false,
    sprite = "text_cube",
    unittype = "text",
    tags = { "common", "decorative" },
    tiling = -1,
    type = 0,
    layer = 20,
    colour = { 1, 2 },
    colour_active = { 1, 3 },
}
editor_objlist["u-110"] = {
    name = "u-110",
    sprite_in_root = false,
    sprite = "u-110",
    unittype = "object",
    tags = { "machine", "water" },
    tiling = 2,
    type = 0,
    layer = 16,
    colour = { 0, 3 },
}
editor_objlist["text_u-110"] = {
    name = "text_u-110",
    sprite_in_root = false,
    sprite = "text_u-110",
    unittype = "text",
    tags = { "machine", "water" },
    tiling = -1,
    type = 0,
    layer = 20,
    colour = { 0, 1 },
    colour_active = { 0, 3 },
}
editor_objlist["torpedo"] = {
    name = "torpedo",
    sprite_in_root = false,
    sprite = "torpedo",
    unittype = "object",
    tags = { "danger", "water", "machine" },
    tiling = 0,
    type = 0,
    layer = 16,
    colour = { 2, 2 },
}
editor_objlist["text_torpedo"] = {
    name = "text_torpedo",
    sprite_in_root = false,
    sprite = "text_torpedo",
    unittype = "text",
    tags = { "danger", "water", "machine" },
    tiling = -1,
    type = 0,
    layer = 20,
    colour = { 2, 1 },
    colour_active = { 2, 2 },
}
editor_objlist["text_pure"] = {
    name = "text_pure",
    sprite_in_root = false,
    sprite = "text_pure",
    unittype = "text",
    tags = { "common", "word_quality" },
    tiling = -1,
    type = 2,
    layer = 20,
    colour = { 0, 1 },
    colour_active = { 0, 3 },
}
editor_objlist["text_mine"] = {
    name = "text_mine",
    sprite_in_root = false,
    sprite = "text_mine",
    unittype = "text",
    tags = { "danger", "word_quality" },
    tiling = -1,
    type = 2,
    layer = 20,
    colour = { 2, 0 },
    colour_active = { 2, 2 },
}
editor_objlist["text_changed"] = {
    name = "text_changed",
    sprite_in_root = false,
    sprite = "text_changed",
    unittype = "text",
    tags = { "word_prefix" },
    tiling = -1,
    type = 3,
    layer = 20,
    colour = { 2, 2 },
    colour_active = { 2, 3 },
}

table.insert(editor_objlist_order, "text_textof")
table.insert(editor_objlist_order, "unicorn")
table.insert(editor_objlist_order, "text_unicorn")
table.insert(editor_objlist_order, "text_swim")
table.insert(editor_objlist_order, "cube")
table.insert(editor_objlist_order, "text_cube")
table.insert(editor_objlist_order, "u-110")
table.insert(editor_objlist_order, "text_u-110")
table.insert(editor_objlist_order, "torpedo")
table.insert(editor_objlist_order, "text_torpedo")
table.insert(editor_objlist_order, "text_pure")
table.insert(editor_objlist_order, "text_mine")
table.insert(editor_objlist_order, "text_changed")

formatobjlist()
