-- WALL LEVER
-- Basically a switch that can be attached to a wall
-- Powers the block 2 nodes behind (using a receiver)

local lever = {
	{"cobble",       "Cobble"},
    {"stone",        "Stone"},
    {"desertstone",  "Desertstone"},
    {"sandstone",    "Sandstone"},

}


for _, lever in pairs(lever) do

mesecon.register_node("mesecons_walllever:" .. lever[1] .. "_wall_lever", {
	description= lever[2] .. " Lever",
	drawtype = "mesh",
	inventory_image = lever[1] .. "_wall_lever.png",
	wield_image = lever[1] .. "_wall_lever.png",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -3/16, -4/16, 2/16, 3/16, 4/16, 8/16 },
	},
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function (pos, node)
		if(mesecon.flipstate(pos, node) == "on") then
			mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
		else
			mesecon.receptor_off(pos, mesecon.rules.buttonlike_get(node))
		end
		minetest.sound_play("mesecons_lever", {pos=pos})
	end
},{
	tiles = {
		lever[1] .. "_lever_on.png",
	},
	mesh="jeija_wall_lever_off.obj",
	on_rotate = mesecon.buttonlike_onrotate,
	mesecons = {receptor = {
		rules = mesecon.rules.buttonlike_get,
		state = mesecon.state.off
	}},
	groups = {dig_immediate = 2, mesecon_needs_receiver = 1}
},{
	tiles = {
		lever[1] .. "_lever_on.png",
	},
	mesh="jeija_wall_lever_on.obj",
	on_rotate = false,
	mesecons = {receptor = {
		rules = mesecon.rules.buttonlike_get,
		state = mesecon.state.on
	}},
	groups = {dig_immediate = 2, mesecon_needs_receiver = 1, not_in_creative_inventory = 1}
})

minetest.register_craft({
	output = "mesecons_walllever:cobble_wall_lever_off 2",
	recipe = {
	    {"group:mesecon_conductor_craftable"},
		{"default:cobble"},
		{"default:stick"},
	}
})
end
minetest.register_craft({
	output = "mesecons_walllever:stone_wall_lever_off 2",
	recipe = {
	    {"group:mesecon_conductor_craftable"},
		{"default:stone"},
		{"default:stick"},
	}
})

minetest.register_craft({
	output = "mesecons_walllever:sandstone_wall_lever_off 2",
	recipe = {
	    {"group:mesecon_conductor_craftable"},
		{"default:sandstone"},
		{"default:stick"},
	}
})

minetest.register_craft({
	output = "mesecons_walllever:desertstone_wall_lever_off 2",
	recipe = {
	    {"group:mesecon_conductor_craftable"},
		{"default:desert_stone"},
		{"default:stick"},
	}
})
