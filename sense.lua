mine_block = {
	["minecraft:diamond_ore"] = true,        --diamond ore
	["minecraft:iron_ore"] = true,           --iron ore
	["minecraft:gold_ore"] = true,           --gold ore
	["minecraft:redstone_ore"] = true, 	 --redstone ore
	["ic2:resource"] = true,      		 --IC Ores
	["thermalfoundation:ore"] = true,        --Thermal Foundation Ores
}

sense()

function sense()
	dir = {N = 0, E = 1, S = 2, W = 3}
	turn = {L = 0, R = 1}

	if wantBlock() then
		queue = {dir.E}
		queueLast = 0
		facing = dir.E

		while (true) do
			for i = 0,2,1 do
				--decide which direction to turn
				turnDir = turn.L
				if not i == 0 then turnDir = turn.R end

				--turn that way and see if we want to mine
				facing = turn(turnDir, facing)
				if wantBlock() then
					queueLast = queueLast + 1
					queue[queueLast] = invertDir(facing)
					turtle.dig()
					turtle.forward()
					break
				end

				--if facing where we came from all blocks are exhausted, start going back
				if facing = queue[queueLast] then
					turtle.forward()
					queueLast = queueLast - 1
					break
				end
			end
			if (queueLast == -1) then break end
		end
		--mined vein and returned
	end
end

function turn(turnDir, curDir)
	if turnDir == turn.L do
		turtle.turnLeft()
		if (curDir == dir.N) then return dir.W end
		return curDir = curDir - 1
	end 
	if turnDir == turn.R do
		turtle.turnRight()
		if (curDir == dir.W) then return dir.N end
		return curDir = curDir + 1
	end
end

function invertDir(dir)
	newDir = dir - 2
	if newDir < 0 do 
		newDir = newDir + 4 
	end
	return newDir
end

--returns true if the block we're looking at is something we want
function wantBlock() {
	success, data = turtle.inspect()
	return success and mine_block[data]
}
