while (true) do
  if turtle.getItemCount(turtle.getSelectedSlot()) == 0 then
    if (turtle.getSelectedSlot() == 16) then turtle.select(1)
    else turtle.select(turtle.getSelectedSlot() + 1) end
  else
    turtle.dig()
    turtle.forward()
    turtle.digDown()
    turtle.placeDown()
  end
end
