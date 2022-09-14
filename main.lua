

love.graphics.setDefaultFilter("nearest", "nearest")

_WINDOW_WIDTH = 1280
_WINDOW_HEIGHT = 980
--pads properties
local padOne = {}
padOne.x = 15
padOne.y = 60
padOne.width = 15
padOne.height = 40


local paddleSpeed = 600

local padTwo = {}
padTwo.x = _WINDOW_WIDTH - 30
padTwo.y = _WINDOW_HEIGHT - 70
padTwo.width = 15
padTwo.height = 40
--ball properties
local ball = {}
ball.radius = 10
ball.color = love.graphics.setColor(0, 1, 0, 1)
ball.x = _WINDOW_WIDTH/2 - ball.radius
ball.y = _WINDOW_HEIGHT/2 - ball.radius


local wordFont = love.graphics.newFont('/Fonts/RetroGaming.ttf', 16)
local scoreFont = love.graphics.newFont('/Fonts/RetroGaming.ttf', 48)
local score1 = "0"
local score2 = "0"

function love.load()


  love.window.setMode(_WINDOW_WIDTH, _WINDOW_HEIGHT, {
      fullscreen = false,
      resizable = false,
      vsync = true
  })
end


function love.update(dt)
  --playerone moves
  if love.keyboard.isDown('s') then
    padOne.y = padOne.y + paddleSpeed * dt
  end

  if love.keyboard.isDown('z') then
    padOne.y = padOne.y - paddleSpeed * dt
  end
  --playerTwo moves
  if love.keyboard.isDown('down') then
    padTwo.y = padTwo.y + paddleSpeed * dt
  end
  if love.keyboard.isDown('up') then
    padTwo.y = padTwo.y - paddleSpeed * dt
  end
  --playerOne limits
  if padOne.y <= 60 then
    padOne.y = 60
  elseif padOne.y >= _WINDOW_HEIGHT - padOne.height then
    padOne.y = _WINDOW_HEIGHT - padOne.height
  else
    padOne.y = padOne.y
  end
  --
  if padTwo.y <= 60 then
    padTwo.y = 60
  elseif padTwo.y >= _WINDOW_HEIGHT - padTwo.height then
    padTwo.y = _WINDOW_HEIGHT - padTwo.height
  else
    padTwo.y = padTwo.y
  end


end



function love.draw()
  love.graphics.clear(0,0,0,1)
  --display title
  love.graphics.setFont(wordFont)

  love.graphics.printf("LÖVE Pong !",
    0,
    30,
    _WINDOW_WIDTH,
    'center')
  --display Score left
  love.graphics.setFont(scoreFont)

  love.graphics.printf(score1, 0, 5, _WINDOW_WIDTH, 'left')
  love.graphics.printf(score2, 0, 5, _WINDOW_WIDTH, 'right')


  --set color
  love.graphics.setColor(1, 1, 1, 1)
  --render first pad
  love.graphics.rectangle('fill', padOne.x, padOne.y, padOne.width, padOne.height)
  --render second pad
  love.graphics.rectangle('fill', padTwo.x, padTwo.y, padTwo.width, padTwo.height)
  -- render the ball
  love.graphics.circle('fill', ball.x, ball.y, ball.radius, ball.color)





end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit(true)
  end

end
