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
  checkAndMine()
  
  --look right and scan
  turtle.turnRight()
  turtle.turnRight()
  checkAndMine(turtle.inspect())
  
  --return forward and scan up and down
  turtle.turnLeft()
  if mine_block[turtle.inspectUp()] == true
  checkAndMine(turtle.inspectDown())
end

function checkAndMineVein()
  success, data = turtle.inspect()
  if (mine_block[data] == true) then
    turtle.dig()
  end
end
  



