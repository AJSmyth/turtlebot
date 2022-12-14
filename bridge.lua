while (true) do
  if turtle.getItemCount(turtle.getSelectedSlot()) == 0 then
      turtle.select(turtle.getSelectedSlot())
  end
  turtle.forward()
  turtle.placeDown()
end
