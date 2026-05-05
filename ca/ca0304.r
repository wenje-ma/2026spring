# 参数 t
t <- seq(0, 2 * pi, length.out = 1000)

# 计算实部和虚部
re <- sqrt(2) * (2 * cos(t)^3 - 3 * cos(t) * sin(t)^2)
im <- 6 * cos(t)^2 * sin(t) - sin(t)^3

# 绘制曲线
plot(re, im, type = "l")
