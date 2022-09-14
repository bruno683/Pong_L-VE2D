

love.graphics.setDefaultFilter("nearest", "nearest")

_WINDOW_WIDTH = 1024
_WINDOW_HEIGHT = 720

function love.load()


  love.window.setMode(_WINDOW_WIDTH, _WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = false,
    vsync = true
  })
end


function love.update(dt)
  -- body...
end



function love.draw()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf("Hello Pong !",0, _WINDOW_HEIGHT/2 - 6, _WINDOW_WIDTH, 'center')
  -- body...
end


function love.keypressed(key)
  -- body...
end
