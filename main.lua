love.graphics.setDefaultFilter("nearest", "nearest")

_WINDOW_WIDTH = 1280
_WINDOW_HEIGHT = 980
--pads properties
local padOne = {}
padOne.x = 75
padOne.y = 80
padOne.width = 15
padOne.height = 60

-- settings speed
local paddleSpeed = 800



local padTwo = {}
padTwo.width = 15
padTwo.height = 60
padTwo.x = _WINDOW_WIDTH - (75 + padTwo.width)
padTwo.y = _WINDOW_HEIGHT - 65

--ball properties
local ball = {}
ball.radius = 10
ball.width = ball.radius*2
ball.height = ball.radius*2
ball.color = love.graphics.setColor(0, 1, 0, 1)
ball.x = _WINDOW_WIDTH/2 - ball.radius
ball.y = _WINDOW_HEIGHT/2 - ball.radius
ball.vx = 500
ball.vy = 500


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
  if padOne.y <= 90 then
    padOne.y = 90
  elseif padOne.y >= _WINDOW_HEIGHT - (padOne.height + 45) then
    padOne.y = _WINDOW_HEIGHT - (padOne.height + 45)
  else
    padOne.y = padOne.y
  end
  --playerTwo limits
  if padTwo.y <= 90 then
    padTwo.y = 90
  elseif padTwo.y >= _WINDOW_HEIGHT - (padOne.height + 45) then
    padTwo.y = _WINDOW_HEIGHT - (padOne.height + 45)
  else
    padTwo.y = padTwo.y
  end
--ball moves
ball.x = ball.x + ball.vx * dt
ball.y = ball.y + ball.vy * dt

if ball.y >= _WINDOW_HEIGHT - 65 then
  ball.y =  _WINDOW_HEIGHT - 65
  ball.vy = -ball.vy
end
if ball.y <= 80 then
  ball.y = 80
  ball.vy = -ball.vy
end

if CheckCollision(padTwo.x, padTwo.y, padTwo.width, padTwo.height, ball.x, ball.y, ball.width, ball.height) then
  ball.x = ball.x - ball.radius
  ball.vx = -ball.vx
  ball.vy = ball.vy
end

if CheckCollision(padOne.x, padOne.y, padOne.width, padOne.height, ball.x, ball.y, ball.width, ball.height) then
  ball.x = ball.x + ball.radius
  ball.vx = -ball.vx
  ball.vy = ball.vy
end

end


--Method to detect collision between two objects
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
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
  --set title
  love.graphics.printf("LÖVE Pong !",
    0,
    46,
    _WINDOW_WIDTH,
    'center')

  love.graphics.setFont(scoreFont)

  --display Score left
  love.graphics.print(tostring(score1), 25, 30)
  --display score right
  love.graphics.print(tostring(score2), _WINDOW_WIDTH - 63, 30)
  love.graphics.line(0, 85, _WINDOW_WIDTH,85)
  love.graphics.line(0, _WINDOW_HEIGHT -  45, _WINDOW_WIDTH,_WINDOW_HEIGHT - 45)


  --render first pad
  love.graphics.rectangle('fill', padOne.x, padOne.y, padOne.width, padOne.height)
  --render second pad
  love.graphics.rectangle('fill', padTwo.x, padTwo.y, padTwo.width, padTwo.height)
  -- render the ball
  love.graphics.circle('fill', ball.x, ball.y, ball.radius)





end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit(true)
  end

end
