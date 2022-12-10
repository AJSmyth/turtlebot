function sense()
  mine_block = {
    ["minecraft:diamond_ore"] = true,        --diamond ore
    ["minecraft:iron_ore"] = true,        --iron ore
    ["minecraft:gold_ore"] = true,        --gold ore
    ["minecraft:redstone_ore"] = true         --redstone ore
    ["ic2:resource"] = true,      --IC Ores
    ["thermalfoundation:ore"] = true       --Thermal Foundation Ores
  }

  --look left and scan
  turtle.turnLeft()
  checkAndMineVein()
  
  --look right and scan
  turtle.turnRight()
  turtle.turnRight()
  checkAndMineVein(turtle.inspect())
  
  --return forward and scan up and down
  turtle.turnLeft()
  if mine_block[turtle.inspectUp()] == true
  checkAndMineVein(turtle.inspectDown())
end

function checkAndMineVein()
  --check facing block for ore of interest
  move_queue = {}
  while (turtle.detect()) {
    success, data = turtle.inspect()
    if (mine_block[data] == true) then
      turtle.dig()
    end
    else
  }
  
  

end
  



