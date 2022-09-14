

love.graphics.setDefaultFilter("nearest", "nearest")
local push = require "push"
_WINDOW_WIDTH = 1920
_WINDOW_HEIGHT = 1080


VIRTUAL_WIDTH = 960
VIRTUAL_HEIGHT = 540


function love.load()


  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, _WINDOW_WIDTH, _WINDOW_HEIGHT,{
    fullscreen = false,
    resizable = false,
    vsync = true
  })
end


function love.update(dt)

end



function love.draw()
  love.graphics.clear(0,0,0,1)
  love.graphics.rectangle('fill', 10, 60, 5, 20)



  --love.graphics.printf("Hello Pong !",
    --0,
    --_WINDOW_HEIGHT/2 - 6,
    ---_WINDOW_WIDTH,
    --'center')
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit(true)
  end

end
