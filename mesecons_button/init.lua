-- WALL BUTTON
-- A button that when pressed emits power for 1 second
-- and then turns off again

local button = {
	{"acacia",       "Acacia"},
    {"aspen",        "Aspen"},
    {"jungle",       "Jungle"},
    {"pine",         "Pine"},
    {"wood",         "Wood"},
    {"diamond",      "Diamond"},
    {"gold",         "Gold"},
    {"stone",        "Stone"},
    {"sandstone",    "Sandstone"},
    {"iron",         "Iron"},
    {"desert_stone", "Desert_stone"},

}


for _, button in pairs(button) do

mesecon.button_turnoff = function (pos)
	local node = minetest.get_node(pos)
	if node.name ~= "mesecons_button:" .. button[1] .. "_on" then -- has been dug
		return
	end
	minetest.swap_node(pos, {name = "mesecons_button:" .. button[1] .. "_off", param2 = node.param2})
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	local rules = mesecon.rules.buttonlike_get(node)
	mesecon.receptor_off(pos, rules)
end

minetest.register_node("mesecons_button:" .. button[1] .. "_off", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_" .. button[1] .. "_button.png",
	"mesecons_" .. button[1] .. "_button.png",
	"mesecons_" .. button[1] .. "_button.png",
	"mesecons_" .. button[1] .. "_button.png",
	"mesecons_" .. button[1] .. "_button.png"
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
	description = button [2].. " Button",
	on_rightclick = function (pos, node)
		minetest.swap_node(pos, {name = "mesecons_button:" .. button[1] .. "_on", param2=node.param2})
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

minetest.register_node("mesecons_button:" .. button[1] .. "_on", {
	drawtype = "nodebox",
	tiles = {
	"mesecons_" .. button[1] .. "_button.png",
	"mesecons_" .. button[1] .. "_button.png",
	"mesecons_" .. button[1] .. "_button.png",
	"mesecons_" .. button[1] .. "_button.png",
	"mesecons_" .. button[1] .. "_button.png"
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
	drop = "mesecons_button:" .. button[1] .. "_off",
	description = button[2] .. " Button",
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
			{"group:mesecon_conductor_craftable", "default:acacia_wood"},
		}
	})
	
	minetest.register_craft({
		output = "mesecons_button:aspen_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "default:aspen_wood"},
		}
	})
	
	minetest.register_craft({
		output = "mesecons_button:jungle_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "default:junglewood"},
		}
	})
	
	minetest.register_craft({
		output = "mesecons_button:pine_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "default:pine_wood"},
		}
	})
	
	minetest.register_craft({
		output = "mesecons_button:wood_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "default:wood"},
		}
	})
	
	minetest.register_craft({
		output = "mesecons_button:diamond_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "default:diamond"},
		}
	})
	
	minetest.register_craft({
		output = "mesecons_button:gold_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "default:gold_ingot"},
		}
	})
	
	minetest.register_craft({
		output = "mesecons_button:stone_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "default:stone"},
		}
	})
	
    minetest.register_craft({
		output = "mesecons_button:sandstone_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "default:sandstone"},
		}
	})
	
	minetest.register_craft({
		output = "mesecons_button:iron_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "technic:wrought_iron_ingot"},
		}
	})
	
	minetest.register_craft({
		output = "mesecons_button:desert_stone_off 2",
		recipe = {
			{"group:mesecon_conductor_craftable", "default:desert_sandstone"},
		}
	})
end
