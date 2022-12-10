mine_block = {
  [56] = true,        --diamond ore
  [4474] = true,      --copper ore
  [5192] = true      --tin ore
}

--look left
turtle.turnLeft()
checkAndMine(turtle.sense())




function checkAndMine(id)
  if (mine_block[id] == true) then
    turtle.dig()
  end
end
