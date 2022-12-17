stops = {}
distances = {}
colors = {}
stopNum = 1

term.clear()
term.setCursorBlink(false)
term.setBackgroundColor(colors.black)

function addStop(name, distance, color)
  stops[stopNum] = name
  distances[stopNum] = distance
  colors[stopNum] = color
  stopNum++
end

function drawStops()
  x, y = term.getSize()
  for L = 0,x,math.floor(x/stopNum) do 
      R = L + math.floor(x/stopNum)
      paintUtils.drawFilledBox(L,0,R,y,colors[stopNum])
      term.setCursorPos(L+1,0)
      term.setTextColor(colors[stopNum])
      term.write(stops[stopNum])
      term.setCursorPos(L+1,1)
      term.write(tostring(distances) .. " m")
   end
end
      
