  #===== Program 4.1（逆変換法による三角分布の乱数発生）=============
  setwd("C:/RW")
  # 一様分布にしたがう乱数を N 個生成し，x に保存 -------------------
  N <- 1000                           # 乱数列の長さ
  x <- runif(N)                       # U(0,1) の一様乱数 N 個発生
  y <- numeric(N)
  # 三角分布にしたがう乱数を N 個生成し，y に保存 -----------------------
  for (i in 1:N)
    {
     if (x[i] > 0.5) 
       {y[i] <- 1 - sqrt(0.5 * (1 - x[i]))}
     else
       {y[i] <- sqrt(0.5 * x[i])}
    }
  # 乱数 y のヒストグラムを描く -------------------------------------
  nclass <- ceiling(1 + log2(N))
  cwidth <- diff(range(y) / nclass) 
  breaks <- min(y) + cwidth * 0:nclass
  h.default <- hist(y, xlim=c(0,1), ylim=c(0,2), freq = FALSE, 
                    xlab = "y", ylab = "frequency", main=" ")
  # 三角分布の密度曲線を描く ----------------------------------------
  y1 <- numeric(101); x1 <- numeric(101)
  for (i in 1:51)
    {y1[i] <- 0.01 * (i-1)
     x1[i] <- 4 * y1[i]}
  for (i in 52:101)
    {y1[i] <- 0.01 * (i-1)
     x1[i] <- -4 * y1[i] + 4}
  lines(y1, x1, lwd=2)                # 三角分布の密度曲線
  #==================================================================
