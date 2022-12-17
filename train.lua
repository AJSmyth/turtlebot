stops = {}
stops1 = {}
distances = {}
clrs = {}
stopNum = 1

monitor = peripheral.wrap("bottom")
term.redirect(monitor)

for i = 1,10 do 
  stops[i] = ""
  stops1[i] = ""
  distances[i] = 0
  clrs[i] = colors.white
end

term.clear()
term.setCursorBlink(false)
term.setBackgroundColor(colors.black)

function addStop(name, line2, distance, color)
  stops[stopNum] = name
  stops1[stopNum] = line2
  distances[stopNum] = distance
  clrs[stopNum] = color
  stopNum = stopNum + 1
end

function drawStops()
  stopNum = stopNum - 1
  x, y = term.getSize()
  for i = 1, stopNum do 
      R = i * x/stopNum
      L = R - x/stopNum
      paintutils.drawFilledBox(L,1,R,y,clrs[i])
      term.setCursorPos(L+1,1)
      term.setTextColor(clrs[i])
      term.write(stops[i])
      term.setCursorPos(L+1,2)
      term.write(stops1[i])
      term.setCursorPos(L+1,3)
      term.write(tostring(distances[i]) .. " m")
   end
end
      
addStop("Blaze Farm",300,colors.orange)
addStop("Cherry",1000,colors.red)
drawStops()

while true do
  os.sleep(10)
end
