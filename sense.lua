function sense()
  mine_block = {
    [56] = true,        --diamond ore
    [4474] = true,      --copper ore
    [5192] = true      --tin ore
  }

  --look left and scan
  turtle.turnLeft()
  checkAndMine(turtle.inspect())
  
  --look right and scan
  turtle.turnRight()
  turtle.turnRight()
  checkAndMine(turtle.inspect())
  
  --return forward and scan up and down
  turtle.turnLeft()
  checkAndMine(turtle.inspectUp())
  checkAndMine(turtle.inspectDown())
end

function checkAndMine(id)
  if (mine_block[id] == true) then
    turtle.dig()
  end
end
