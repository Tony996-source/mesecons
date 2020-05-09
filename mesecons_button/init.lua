-- WALL BUTTON
-- A button that when pressed emits power for 1 second
-- and then turns off again

-- Stone Button

mesecon.button_turnoff = function (pos)
	local node = minetest.get_node(pos)
	if node.name ~= "mesecons_button:stone_on" then -- has been dug
		return
	end
	minetest.swap_node(pos, {name = "mesecons_button:stone_off", param2 = node.param2})
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	local rules = mesecon.rules.buttonlike_get(node)
	mesecon.receptor_off(pos, rules)
end

minetest.register_node("mesecons_button:stone_off", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_stone_button.png",
	"mesecons_stone_button.png",
	"mesecons_stone_button.png",
	"mesecons_stone_button.png",
	"mesecons_stone_button.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = mesecon.buttonlike_onrotate,
	sunlight_propagates = true,
	selection_box = {
	type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }	-- the button itself
	},
	groups = {dig_immediate=2, mesecon_needs_receiver = 1},
	description = "Stone Button",
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, {name = "mesecons_button:stone_on", param2=node.param2})
		mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
		minetest.sound_play("mesecons_button_push", {pos=pos})
		minetest.get_node_timer(pos):start(1)
	end,
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.buttonlike_get
	}},
	on_blast = mesecon.on_blastnode,
})

minetest.register_node("mesecons_button:stone_on", {
	drawtype = "nodebox",
	tiles = {
		"mesecons_stone_button.png",
		"mesecons_stone_button.png",
		"mesecons_stone_button.png",
		"mesecons_stone_button.png",
		"mesecons_stone_button.png",
		},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
	type = "fixed",
	fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
    },
	groups = {dig_immediate=2, not_in_creative_inventory=1, mesecon_needs_receiver = 1},
	drop = 'mesecons_button:stone_off',
	description = "Stone Button",
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.buttonlike_get
	}},
	on_timer = mesecon.button_turnoff,
	on_blast = mesecon.on_blastnode,
})

minetest.register_craft({
	output = "mesecons_button:stone_off 2",
	recipe = {
		{"group:mesecon_conductor_craftable","default:stone"},
	}
})

-- Wood Button

mesecon.button_turnoff = function (pos)
	local node = minetest.get_node(pos)
	if node.name ~= "mesecons_button:wood_on" then -- has been dug
		return
	end
	minetest.swap_node(pos, {name = "mesecons_button:wood_off", param2 = node.param2})
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	local rules = mesecon.rules.buttonlike_get(node)
	mesecon.receptor_off(pos, rules)
end

minetest.register_node("mesecons_button:wood_off", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_wood_button.png",
	"mesecons_wood_button.png",
	"mesecons_wood_button.png",
	"mesecons_wood_button.png",
	"mesecons_wood_button.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = mesecon.buttonlike_onrotate,
	sunlight_propagates = true,
	selection_box = {
	type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }	-- the button itself
	},
	groups = {dig_immediate=2, mesecon_needs_receiver = 1},
	description = "Wood Button",
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, {name = "mesecons_button:wood_on", param2=node.param2})
		mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
		minetest.sound_play("mesecons_button_push", {pos=pos})
		minetest.get_node_timer(pos):start(1)
	end,
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.buttonlike_get
	}},
	on_blast = mesecon.on_blastnode,
})

minetest.register_node("mesecons_button:wood_on", {
	drawtype = "nodebox",
	tiles = {
		"mesecons_wood_button.png",
		"mesecons_wood_button.png",
		"mesecons_wood_button.png",
		"mesecons_wood_button.png",
		"mesecons_wood_button.png",
		},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
	type = "fixed",
	fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
    },
	groups = {dig_immediate=2, not_in_creative_inventory=1, mesecon_needs_receiver = 1},
	drop = 'mesecons_button:wood_off',
	description = "Wood Button",
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.buttonlike_get
	}},
	on_timer = mesecon.button_turnoff,
	on_blast = mesecon.on_blastnode,
})

minetest.register_craft({
	output = "mesecons_button:wood_off 2",
	recipe = {
		{"group:mesecon_conductor_craftable","default:wood"},
	}
})

-- Acacia Button

mesecon.button_turnoff = function (pos)
	local node = minetest.get_node(pos)
	if node.name ~= "mesecons_button:acacia_on" then -- has been dug
		return
	end
	minetest.swap_node(pos, {name = "mesecons_button:acacia_off", param2 = node.param2})
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	local rules = mesecon.rules.buttonlike_get(node)
	mesecon.receptor_off(pos, rules)
end

minetest.register_node("mesecons_button:acacia_off", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_acacia_button.png",
	"mesecons_acacia_button.png",
	"mesecons_acacia_button.png",
	"mesecons_acacia_button.png",
	"mesecons_acacia_button.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = mesecon.buttonlike_onrotate,
	sunlight_propagates = true,
	selection_box = {
	type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }	-- the button itself
	},
	groups = {dig_immediate=2, mesecon_needs_receiver = 1},
	description = "Acacia Button",
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, {name = "mesecons_button:acacia_on", param2=node.param2})
		mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
		minetest.sound_play("mesecons_button_push", {pos=pos})
		minetest.get_node_timer(pos):start(1)
	end,
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.buttonlike_get
	}},
	on_blast = mesecon.on_blastnode,
})

minetest.register_node("mesecons_button:acacia_on", {
	drawtype = "nodebox",
	tiles = {
		"mesecons_acacia_button.png",
		"mesecons_acacia_button.png",
		"mesecons_acacia_button.png",
		"mesecons_acacia_button.png",
		"mesecons_acacia_button.png",
		},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
	type = "fixed",
	fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
    },
	groups = {dig_immediate=2, not_in_creative_inventory=1, mesecon_needs_receiver = 1},
	drop = 'mesecons_button:acacia_off',
	description = "Acacia Button",
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.buttonlike_get
	}},
	on_timer = mesecon.button_turnoff,
	on_blast = mesecon.on_blastnode,
})

minetest.register_craft({
	output = "mesecons_button:acacia_off 2",
	recipe = {
		{"group:mesecon_conductor_craftable","default:acacia_wood"},
	}
})

-- Aspen Button

mesecon.button_turnoff = function (pos)
	local node = minetest.get_node(pos)
	if node.name ~= "mesecons_button:aspen_on" then -- has been dug
		return
	end
	minetest.swap_node(pos, {name = "mesecons_button:aspen_off", param2 = node.param2})
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	local rules = mesecon.rules.buttonlike_get(node)
	mesecon.receptor_off(pos, rules)
end

minetest.register_node("mesecons_button:aspen_off", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_aspen_button.png",
	"mesecons_aspen_button.png",
	"mesecons_aspen_button.png",
	"mesecons_aspen_button.png",
	"mesecons_aspen_button.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = mesecon.buttonlike_onrotate,
	sunlight_propagates = true,
	selection_box = {
	type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }	-- the button itself
	},
	groups = {dig_immediate=2, mesecon_needs_receiver = 1},
	description = "Aspen Button",
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, {name = "mesecons_button:aspen_on", param2=node.param2})
		mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
		minetest.sound_play("mesecons_button_push", {pos=pos})
		minetest.get_node_timer(pos):start(1)
	end,
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.buttonlike_get
	}},
	on_blast = mesecon.on_blastnode,
})

minetest.register_node("mesecons_button:aspen_on", {
	drawtype = "nodebox",
	tiles = {
		"mesecons_aspen_button.png",
		"mesecons_aspen_button.png",
		"mesecons_aspen_button.png",
		"mesecons_aspen_button.png",
		"mesecons_aspen_button.png",
		},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
	type = "fixed",
	fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
    },
	groups = {dig_immediate=2, not_in_creative_inventory=1, mesecon_needs_receiver = 1},
	drop = 'mesecons_button:aspen_off',
	description = "Aspen Button",
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.buttonlike_get
	}},
	on_timer = mesecon.button_turnoff,
	on_blast = mesecon.on_blastnode,
})

minetest.register_craft({
	output = "mesecons_button:aspen_off 2",
	recipe = {
		{"group:mesecon_conductor_craftable","default:aspen_wood"},
	}
})

-- Desert Stone Button

mesecon.button_turnoff = function (pos)
	local node = minetest.get_node(pos)
	if node.name ~= "mesecons_button:desert_stone_on" then -- has been dug
		return
	end
	minetest.swap_node(pos, {name = "mesecons_button:desert_stone_off", param2 = node.param2})
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	local rules = mesecon.rules.buttonlike_get(node)
	mesecon.receptor_off(pos, rules)
end

minetest.register_node("mesecons_button:desert_stone_off", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_desert_stone_button.png",
	"mesecons_desert_stone_button.png",
	"mesecons_desert_stone_button.png",
	"mesecons_desert_stone_button.png",
	"mesecons_desert_stone_button.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = mesecon.buttonlike_onrotate,
	sunlight_propagates = true,
	selection_box = {
	type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }	-- the button itself
	},
	groups = {dig_immediate=2, mesecon_needs_receiver = 1},
	description = "Desert Stone Button",
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, {name = "mesecons_button:desert_stone_on", param2=node.param2})
		mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
		minetest.sound_play("mesecons_button_push", {pos=pos})
		minetest.get_node_timer(pos):start(1)
	end,
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.buttonlike_get
	}},
	on_blast = mesecon.on_blastnode,
})

minetest.register_node("mesecons_button:desert_stone_on", {
	drawtype = "nodebox",
	tiles = {
		"mesecons_desert_stone_button.png",
		"mesecons_desert_stone_button.png",
		"mesecons_desert_stone_button.png",
		"mesecons_desert_stone_button.png",
		"mesecons_desert_stone_button.png",
		},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
	type = "fixed",
	fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
    },
	groups = {dig_immediate=2, not_in_creative_inventory=1, mesecon_needs_receiver = 1},
	drop = 'mesecons_button:desert_stone_off',
	description = "Desert Stone Button",
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.buttonlike_get
	}},
	on_timer = mesecon.button_turnoff,
	on_blast = mesecon.on_blastnode,
})

minetest.register_craft({
	output = "mesecons_button:desert_stone_off 2",
	recipe = {
		{"group:mesecon_conductor_craftable","default:desert_stone"},
	}
})

-- Jungle Button

mesecon.button_turnoff = function (pos)
	local node = minetest.get_node(pos)
	if node.name ~= "mesecons_button:jungle_on" then -- has been dug
		return
	end
	minetest.swap_node(pos, {name = "mesecons_button:jungle_off", param2 = node.param2})
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	local rules = mesecon.rules.buttonlike_get(node)
	mesecon.receptor_off(pos, rules)
end

minetest.register_node("mesecons_button:jungle_off", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_jungle_button.png",
	"mesecons_jungle_button.png",
	"mesecons_jungle_button.png",
	"mesecons_jungle_button.png",
	"mesecons_jungle_button.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = mesecon.buttonlike_onrotate,
	sunlight_propagates = true,
	selection_box = {
	type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }	-- the button itself
	},
	groups = {dig_immediate=2, mesecon_needs_receiver = 1},
	description = "Jungle Button",
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, {name = "mesecons_button:jungle_on", param2=node.param2})
		mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
		minetest.sound_play("mesecons_button_push", {pos=pos})
		minetest.get_node_timer(pos):start(1)
	end,
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.buttonlike_get
	}},
	on_blast = mesecon.on_blastnode,
})

minetest.register_node("mesecons_button:jungle_on", {
	drawtype = "nodebox",
	tiles = {
		"mesecons_jungle_button.png",
		"mesecons_jungle_button.png",
		"mesecons_jungle_button.png",
		"mesecons_jungle_button.png",
		"mesecons_jungle_button.png",
		},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
	type = "fixed",
	fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
    },
	groups = {dig_immediate=2, not_in_creative_inventory=1, mesecon_needs_receiver = 1},
	drop = 'mesecons_button:jungle_off',
	description = "Jungle Button",
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.buttonlike_get
	}},
	on_timer = mesecon.button_turnoff,
	on_blast = mesecon.on_blastnode,
})

minetest.register_craft({
	output = "mesecons_button:jungle_off 2",
	recipe = {
		{"group:mesecon_conductor_craftable","default:junglewood"},
	}
})

-- Pine Button

mesecon.button_turnoff = function (pos)
	local node = minetest.get_node(pos)
	if node.name ~= "mesecons_button:pine_on" then -- has been dug
		return
	end
	minetest.swap_node(pos, {name = "mesecons_button:pine_off", param2 = node.param2})
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	local rules = mesecon.rules.buttonlike_get(node)
	mesecon.receptor_off(pos, rules)
end

minetest.register_node("mesecons_button:pine_off", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_pine_button.png",
	"mesecons_pine_button.png",
	"mesecons_pine_button.png",
	"mesecons_pine_button.png",
	"mesecons_pine_button.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = mesecon.buttonlike_onrotate,
	sunlight_propagates = true,
	selection_box = {
	type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }	-- the button itself
	},
	groups = {dig_immediate=2, mesecon_needs_receiver = 1},
	description = "Pine Button",
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, {name = "mesecons_button:pine_on", param2=node.param2})
		mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
		minetest.sound_play("mesecons_button_push", {pos=pos})
		minetest.get_node_timer(pos):start(1)
	end,
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.buttonlike_get
	}},
	on_blast = mesecon.on_blastnode,
})

minetest.register_node("mesecons_button:pine_on", {
	drawtype = "nodebox",
	tiles = {
		"mesecons_pine_button.png",
		"mesecons_pine_button.png",
		"mesecons_pine_button.png",
		"mesecons_pine_button.png",
		"mesecons_pine_button.png",
		},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
	type = "fixed",
	fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
    },
	groups = {dig_immediate=2, not_in_creative_inventory=1, mesecon_needs_receiver = 1},
	drop = 'mesecons_button:pine_off',
	description = "Pine Button",
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.buttonlike_get
	}},
	on_timer = mesecon.button_turnoff,
	on_blast = mesecon.on_blastnode,
})

minetest.register_craft({
	output = "mesecons_button:pine_off 2",
	recipe = {
		{"group:mesecon_conductor_craftable","default:pine_wood"},
	}
})

-- Sandstone Button

mesecon.button_turnoff = function (pos)
	local node = minetest.get_node(pos)
	if node.name ~= "mesecons_button:sandstone_on" then -- has been dug
		return
	end
	minetest.swap_node(pos, {name = "mesecons_button:sandstone_off", param2 = node.param2})
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	local rules = mesecon.rules.buttonlike_get(node)
	mesecon.receptor_off(pos, rules)
end

minetest.register_node("mesecons_button:sandstone_off", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_sandstone_button.png",
	"mesecons_sandstone_button.png",
	"mesecons_sandstone_button.png",
	"mesecons_sandstone_button.png",
	"mesecons_sandstone_button.png"
	},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = mesecon.buttonlike_onrotate,
	sunlight_propagates = true,
	selection_box = {
	type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 13/32, 4/16, 2/16, 8/16 }	-- the button itself
	},
	groups = {dig_immediate=2, mesecon_needs_receiver = 1},
	description = "Sandstone Button",
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, {name = "mesecons_button:sandstone_on", param2=node.param2})
		mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
		minetest.sound_play("mesecons_button_push", {pos=pos})
		minetest.get_node_timer(pos):start(1)
	end,
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.buttonlike_get
	}},
	on_blast = mesecon.on_blastnode,
})

minetest.register_node("mesecons_button:sandstone_on", {
	drawtype = "nodebox",
	tiles = {
		"mesecons_sandstone_button.png",
		"mesecons_sandstone_button.png",
		"mesecons_sandstone_button.png",
		"mesecons_sandstone_button.png",
		"mesecons_sandstone_button.png",
		},
	paramtype2 = "facedir",
	is_ground_content = false,
	legacy_wallmounted = true,
	walkable = false,
	on_rotate = false,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
	},
	node_box = {
	type = "fixed",
	fixed = { -4/16, -2/16, 15/32, 4/16, 2/16, 8/16 }
    },
	groups = {dig_immediate=2, not_in_creative_inventory=1, mesecon_needs_receiver = 1},
	drop = 'mesecons_button:sandstone_off',
	description = "Sandstone Button",
	sounds = default.node_sound_stone_defaults(),
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.buttonlike_get
	}},
	on_timer = mesecon.button_turnoff,
	on_blast = mesecon.on_blastnode,
})

minetest.register_craft({
	output = "mesecons_button:sandstone_off 2",
	recipe = {
		{"group:mesecon_conductor_craftable","default:sandstone"},
	}
})
