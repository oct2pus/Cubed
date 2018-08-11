pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function _init()
	player = {}
		player.x = 0
		player.y = 0
		player.x_speed = 0
		player.y_speed = 0
		player.x_velocity = 0
		player.y_velocity = 0
		player.motion = true
		player.floor = false
		player.aligned = false
		player.sprite = 1
		player.sprite_max = 7
		player.sprite_min = 4
	counter = 0
	screen = {}
		screen.x = 128
		screen.y = 128
	floor = {}
		floor.y = 90
		
	aligned = 25
end

function _update ()
end



function _draw()
	counter += 1
	cls()
	draw_player()
	draw_floor()
	draw_background()
end

function draw_player()

	// figure out the players frame
	if player.motion and counter % 5 == 0 then
		player.sprite += 1
		if player.sprite > player.sprite_max then
			player.sprite = player.sprite_min
		end
	end
	
	// gravity
	if player.y < floor.y-8 and counter % 2 == 0 then
		player.y_velocity += 1
	else 
		player.y_velocity = 0
		player.y_speed = 0
		player.floor = true
	end
	
	// align player with 'middle'
	if player.floor == true then
		if player.x != aligned then
			if player.x > aligned then
				player.x_speed = -1
			else
		 	player.x_speed = 1
			end	
		else
			player.x_speed = 0
			player.aligned = true	
		end
	end
	
	// move player
	player.y_speed += player.y_velocity
	player.y += player.y_speed
	player.x += player.x_speed
	
		// literally draw the player
	spr(player.sprite, player.x, player.y)
end

function draw_floor()
	// literally draw the floor
	line(0, floor.y, screen.x, floor.y)
end

function draw_background()
end
__gfx__
00000000000550000000550000055000005500000005500000005500000550000000000000000000000000000000000000000000000000000000000000000000
00000000000555000000555000055500005550000005550000005550000555000000000000000000000000000000000000000000000000000000000000000000
00700700000770000000770000077000007700000007700000007700000770000000000000000000000000000000000000000000000000000000000000000000
00077000000550000005550000055000005550000005500000055500000550000000000000000000000000000000000000000000000000000000000000000000
00077000000550000005500000055000000550700005500000055000000550000000000000000000000000000000000000000000000000000000000000000000
00700700000660000006600007666000000666700006600007666000000660000000000000000000000000000000000000000000000000000000000000000000
00000000000660000760600007000670000600000760067007006000076006700000000000000000000000000000000000000000000000000000000000000000
00000000000777000070770000000700000770000070070000007700007007000000000000000000000000000000000000000000000000000000000000000000
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888eeeeee888888888888888888888888888888888888888888888888888888888888888888888888ff8ff8888228822888222822888888822888888228888
8888ee888ee88888888888888888888888888888888888888888888888888888888888888888888888ff888ff888222222888222822888882282888888222888
888eee8e8ee88888e88888888888888888888888888888888888888888888888888888888888888888ff888ff888282282888222888888228882888888288888
888eee8e8ee8888eee8888888888888888888888888888888888888888888888888888888888888888ff888ff888222222888888222888228882888822288888
888eee8e8ee88888e88888888888888888888888888888888888888888888888888888888888888888ff888ff888822228888228222888882282888222288888
888eee888ee888888888888888888888888888888888888888888888888888888888888888888888888ff8ff8888828828888228222888888822888222888888
888eeeeeeee888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
5555555556565655565656565655565655555666565655655565565656565555577755555c555c5c5c555c555c55555555555555555555555555555555555555
5555555556665655566656665665566555555656565655655565565656565555555555555cc55ccc5c555ccc5cc5555555555555555555555555555555555555
5555555556555655565655565655565655555656565655655565565656565555577755555c555c5c5c55555c5c55555555555555555555555555555555555555
5555555556555666565656665666565655755656566555655666566556565555555555555c555c5c5ccc5cc55ccc555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5555555556665655566656565666566655555566566656665666566656665555555555555cc55555555555555555555555555555555555555555555555555555
55555555565656555656565656555656555556555656565655655565565555555777555555c55555555555555555555555555555555555555555555555555555
55555555566656555666566656655665555556665666566555655565566555555555555555c55555555555555555555555555555555555555555555555555555
55555555565556555656555656555656555555565655565655655565565555555777555555c55555555555555555555555555555555555555555555555555555
5555555556555666565656665666565655755665565556565666556556665555555555555ccc5555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555558888855555555555555555555555555555555555
55555555566656555666565656665666555555665666566656665666566655555666566656565555555555558888855555555555555555555555555555555555
55555555565656555656565656555656555556555656565655655565565555555666565656565555577755558888855555555555555555555555555555555555
55555555566656555666566656655665555556665666566555655565566555555656566655655555555555558888855555555555555555555555555555555555
55555555565556555656555656555656555555565655565655655565565555555656565656565555577755558888855555555555555555555555555555555555
55555555565556665656566656665656557556655655565656665565566656665656565656565555555555558888855555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5ee55ee555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5ee55e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5e5e5eee55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5e5e5ee555ee5eee5eee55ee5ee5555555555656566656655666566656665575557555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555555555656565656565656556556555755555755555555555555555555555555555555555555555555555555555555
5ee55e5e5e5e5e5555e555e55e5e5e5e555555555656566656565666556556655755555755555555555555555555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555555555656565556565656556556555755555755555555555555555555555555555555555555555555555555555555
5e5555ee5e5e55ee55e55eee5ee55e5e555556665566565556665656556556665575557555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5ee55ee555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5ee55e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5e5e5eee55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5e5e5ee555ee5eee5eee55ee5ee5555555555665566656665656557555755555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555555555656565656565656575555575555555555555555555555555555555555555555555555555555555555555555
5ee55e5e5e5e5e5555e555e55e5e5e5e555555555656566556665656575555575555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555555555656565656565666575555575555555555555555555555555555555555555555555555555555555555555555
5e5555ee5e5e55ee55e55eee5ee55e5e555556665666565656565666557555755555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
555555bb5b5555bb5575557555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555b555b555b555755555755555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555b555b555bbb5755555755555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555b555b55555b5755555755555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
555555bb5bbb5bb55575557555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555665566656665656555556665655566656565666566655755575555555555555555555555555555555555555555555555555555555555555555555555555
55555656565656565656555556565655565656565655515657555557555555555555555555555555555555555555555555555555555555555555555555555555
55555656566556665656555556665655566656665665171557555557555555555555555555555555555555555555555555555555555555555555555555555555
55555656565656565666555556555655565655565655177157555557555555555555555555555555555555555555555555555555555555555555555555555555
55555666565656565666566656555666565656665666177715755575555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555177771555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5ee55ee555555555555555555555555555555555177115555555555555555555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e55555555555555555555555555555555511715555555555555555555555555555555555555555555555555555555555555555555555555555555
5ee55e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5e555e5e5e5e55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5e5e5eee55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
5eee5e5e5ee555ee5eee5eee55ee5ee5555556655666566656565555566656555666565656665666557555755555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555556565656565656565555565656555656565656555656575555575555555555555555555555555555555555555555
5ee55e5e5e5e5e5555e555e55e5e5e5e555556565665566656565555566656555666566656655665575555575555555555555555555555555555555555555555
5e555e5e5e5e5e5555e555e55e5e5e5e555556565656565656665555565556555656555656555656575555575555555555555555555555555555555555555555
5e5555ee5e5e55ee55e55eee5ee55e5e555556665656565656665666565556665656566656665656557555755555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
555555bb5bbb5bbb5575566656555666565656665666555555665666566656665666566655555555566656555666565656665666555556565555555556665655
55555b555b5b5b5b5755565656555656565656555656555556555656565655655565565555555555565656555656565656555656555556565555555556565655
55555bbb5bbb5bb55755566656555666566656655665555556665666566555655565566555555555566656555666566656655665555555655555555556665655
5555555b5b555b5b5755565556555656555656555656555555565655565655655565565555755555565556555656555656555656555556565575555556555655
55555bb55b555b5b5575565556665656566656665656557556655655565656665565566657555555565556665656566656665656557556565755555556555666
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555eee5eee55555666565556665656566656665555566655665666566655665665555555555555555555555555555555555555555555555555555555555555
555555e55e5555555656565556565656565556565555566656565565556556565656555555555555555555555555555555555555555555555555555555555555
555555e55ee555555666565556665666566556655555565656565565556556565656555555555555555555555555555555555555555555555555555555555555
555555e55e5555555655565556565556565556565555565656565565556556565656555555555555555555555555555555555555555555555555555555555555
55555eee5e5555555655566656565666566656565575565656655565566656655656555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
555555555eee5eee5555566656555666565656665666555555665666566656665666566655555555555555555555555555555555555555555555555555555555
5555555555e55e555555565656555656565656555656555556555656565655655565565555555555555555555555555555555555555555555555555555555555
5555555555e55ee55555566656555666566656655665555556665666566555655565566555555555555555555555555555555555555555555555555555555555
5555555555e55e555555565556555656555656555656555555565655565655655565565555555555555555555555555555555555555555555555555555555555
555555555eee5e555555565556665656566656665656557556655655565656665565566655555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
82888222822882228888822288828222822288888888888888888888888888888888888888888888888888888888828882228882822282288222822288866688
82888828828282888888828288288882828288888888888888888888888888888888888888888888888888888888828882828828828288288282888288888888
82888828828282288888822288288222822288888888888888888888888888888888888888888888888888888888822282828828822288288222822288822288
82888828828282888888888288288288828288888888888888888888888888888888888888888888888888888888828282828828828288288882828888888888
82228222828282228888888282888222822288888888888888888888888888888888888888888888888888888888822282228288822282228882822288822288
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

