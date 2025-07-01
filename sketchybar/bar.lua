local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  topmost = "window",
  height = 38,
  color = colors.with_alpha(colors.bar.bg, 0.40),
  padding_right = 5,
  padding_left = 5,
  blur_radius = 35,
  shadow = false,
  y_offset = 0,
  margin = 0,
  corner_radius = 0,
})
