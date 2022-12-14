while (true) do
  while turtle.getItemCount(turtle.getSelectedSlot()) == 0 then
    if (turtle.getSelectedSlot() == 16) then turtle.select(1) end
    else then turtle.select(turtle.getSelectedSlot()) end
  end
  turtle.forward()
  turtle.placeDown()
end
