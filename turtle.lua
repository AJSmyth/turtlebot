while(true) do
  while(turtle.getFuelLevel()<10000) do
    turtle.refuel()
    end
  while(not(turtle.detect)) do
    turtle.forward()
    end
  while(turtle.detect) do
    for i=0,5,1 do
      turtle.dig()
      turtle.forward()
      end
    turtle.turnRight()
    for i=0,11,1 do
      turtle.dig()
      turtle.forward()
      end
    turtle.turnRight()
    turtle.turnRight()
    for i=0,11,1 do
      turtle.forward()
      end
    for i=0,11,1 do
      turtle.dig()
      turtle.forward()
      end
    turtle.turnRight()
    turtle.turnRight()
    for i=0,11,1 do
      turtle.forward()
      end
    turtle.turnLeft()
  end
end
