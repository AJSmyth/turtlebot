mine_block = {
	["minecraft:diamond_ore"] = true,        --diamond ore
	["minecraft:iron_ore"] = true,           --iron ore
	["minecraft:gold_ore"] = true,           --gold ore
	["minecraft:redstone_ore"] = true, 	 --redstone ore
	["ic2:resource"] = true,      		 --IC Ores
	["thermalfoundation:ore"] = true,        --Thermal Foundation Ores
}

function sense()
	dir = {N = 0, E = 1, S = 2, W = 3}
	turn = {L = 0, R = 1}

	if wantBlock() then
		queue = {dir.E}
		queueLast = 0
		facing = dir.E
		turtle.dig()
		turtle.forward()
		
		while (true) do
			for i = 0,3,1 do
				--decide which direction to turn
				turnDir = turn.R
				if i == 0 then turnDir = turn.L end
				
				--turn that way and see if we want to mine
				facing = turnTo(turnDir, facing)
				if wantBlock() then
					queueLast = queueLast + 1
					queue[queueLast] = invertDir(facing)
					turtle.dig()
					turtle.forward()
					break
				end
				
				--if facing where we came from all blocks are exhausted, start going back
				if facing == queue[queueLast] then
					turtle.forward()
					queueLast = queueLast - 1
					break
				end
			end
			if (queueLast == 0) then 
				while (not facing = queue[queueLast]) do
					facing = turnTo(turn.R, facing)
				end
				break 
			end
		end
		--mined vein and returned
		print("done")
	end
end

function turnTo(turnDir, curDir)
	ret = curDir
	if turnDir == turn.L then
		turtle.turnLeft()
		if (curDir == dir.N) then ret = dir.W
		else ret = curDir - 1 end
	end 
	if turnDir == turn.R then
		turtle.turnRight()
		if (curDir == dir.W) then ret = dir.N
		else ret = curDir + 1 end
	end
	return ret
end

function invertDir(dir)
	newDir = dir - 2
	if newDir < 0 then 
		newDir = newDir + 4 
	end
	return newDir
end

--returns true if the block we're looking at is something we want
function wantBlock()
	success, data = turtle.inspect()
	return success and mine_block[data.name]
end

sense()
