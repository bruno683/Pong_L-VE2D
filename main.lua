

love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
  _WINDOW_WIDTH = 1024
  _WINDOW_HEIGHT = 720

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
  -- body...
end


function love.keypressed(key)
  -- body...
end
