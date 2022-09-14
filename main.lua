

love.graphics.setDefaultFilter("nearest", "nearest")

_WINDOW_WIDTH = 1920
_WINDOW_HEIGHT = 1080



function love.load()


  love.window.setMode(_WINDOW_WIDTH, _WINDOW_HEIGHT, {
    fullscreen = true,
    resizable = false,
    vsync = true
  })
end


function love.update(dt)

end



function love.draw()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.printf("Hello Pong !",
    0,
    _WINDOW_HEIGHT/2 - 6,
    _WINDOW_WIDTH,
    'center')
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit(true)
  end

end
