

love.graphics.setDefaultFilter("nearest", "nearest")

_WINDOW_WIDTH = 1280
_WINDOW_HEIGHT = 980
--pads properties
local padOne = {}
padOne.x = 75
padOne.y = 80
padOne.width = 15
padOne.height = 40


local paddleSpeed = 600

local padTwo = {}
padTwo.width = 15
padTwo.height = 40
padTwo.x = _WINDOW_WIDTH - (75 + padTwo.width)
padTwo.y = _WINDOW_HEIGHT - 65

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
    padOne.y = padOne.y + -paddleSpeed * dt
  end
  --playerTwo moves
  if love.keyboard.isDown('down') then
    padTwo.y = padTwo.y + paddleSpeed * dt
  end
  if love.keyboard.isDown('up') then
    padTwo.y = padTwo.y + -paddleSpeed * dt
  end
  --playerOne limits
  if padOne.y <= 80 then
    padOne.y = 80
  elseif padOne.y >= _WINDOW_HEIGHT - (padOne.height + 25) then
    padOne.y = _WINDOW_HEIGHT - (padOne.height + 25)
  else
    padOne.y = padOne.y
  end
  --playerTwo limits
  if padTwo.y <= 80 then
    padTwo.y = 80
  elseif padTwo.y >= _WINDOW_HEIGHT - (padOne.height + 25) then
    padTwo.y = _WINDOW_HEIGHT - (padOne.height + 25)
  else
    padTwo.y = padTwo.y
  end



end



function love.draw()

  love.graphics.clear(1,1,1,1)

  --background
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.rectangle('fill', 25, 25, _WINDOW_WIDTH - 50, _WINDOW_HEIGHT -50, 25, 25)
  --display title
  love.graphics.setFont(wordFont)
  --set color
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf("LÖVE Pong !",
    0,
    46,
    _WINDOW_WIDTH,
    'center')

  love.graphics.setFont(scoreFont)

  --display Score left
  love.graphics.printf(score1, 25, 30, _WINDOW_WIDTH, 'left')
  --display score right
  love.graphics.print(score2, _WINDOW_WIDTH - 78, 30)



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
