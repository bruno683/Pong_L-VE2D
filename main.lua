

love.graphics.setDefaultFilter("nearest", "nearest")

_WINDOW_WIDTH = 1280
_WINDOW_HEIGHT = 980
--pads properties
local padWidth = 15
local padHeight = 40
--ball properties
local ball = {}
ball.radius = 10
ball.color = love.graphics.setColor(0, 1, 0, 1)
ball.x = _WINDOW_WIDTH/2 - ball.radius
ball.y = _WINDOW_HEIGHT/2 - ball.radius





function love.load()


  love.window.setMode(_WINDOW_WIDTH, _WINDOW_HEIGHT, {
      fullscreen = false,
      resizable = false,
      vsync = true
  })
end


function love.update(dt)

end



function love.draw()
  love.graphics.clear(0,0,0,1)


  --set color
  love.graphics.setColor(1, 1, 1, 1)
  --render first pad
  love.graphics.rectangle('fill', 15, 30, padWidth, padHeight)
  --render second pad
  love.graphics.rectangle('fill', _WINDOW_WIDTH - 30, _WINDOW_HEIGHT - 70, padWidth, padHeight)
  -- render the ball
  love.graphics.circle('fill', ball.x, ball.y, ball.radius, ball.color)


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
