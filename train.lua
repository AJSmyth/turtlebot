stops = {}
distances = {}
colors = {}
stopNum = 1

for i = 0,10 do a[i] = 0 end

term.clear()
term.setCursorBlink(false)
term.setBackgroundColor(32768)

function addStop(name, distance, color)
  stops[stopNum] = name
  distances[stopNum] = distance
  colors[stopNum] = color
  stopNum = stopNum + 1
end

function drawStops()
  x, y = term.getSize()
  for i = 1,stopNum do 
      R = i * math.floor(x/stopNum)
      L = R - math.floor(x/stopNum)
      paintUtils.drawFilledBox(L,0,R,y,colors[i])
      term.setCursorPos(L+1,0)
      term.setTextColor(colors[i])
      term.write(stops[i])
      term.setCursorPos(L+1,1)
      term.write(tostring(distances[i]) .. " m")
   end
end
      
addStop("Blaze Farm",300,colors.orange)
addStop("Cherry",1000,colors.red)
drawStops()

while true do
  os.sleep(10)
end
