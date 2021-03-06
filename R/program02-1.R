  #===== Program 2.1（正規分布の密度関数曲線作成）========================
  N <- 100                             # 各系列の長さ
  mean <- 0; sd <- 1                   # 分布のパラメータ
  z1 <- qnorm(ppoints(N), mean, sd)    # 正規分布の百分位点
  y1 <- dnorm(z1, mean, sd)            # 百分位点に対応する密度関数値
  mean <- 0; sd <- 0.5
  z2 <- qnorm(ppoints(N), mean, sd)
  y2 <- dnorm(z2, mean, sd)
  mean <- 1; sd <- 0.8
  z3 <- qnorm(ppoints(N), mean, sd)
  y3 <- dnorm(z3, mean, sd)
  # 座標およびN(0, 1)の密度曲線
  plot(z1, y1, xlim=range(z1), ylim=range(y2), type="l", 
       xlab="y", ylab="density", lwd=1) 
  lines(z2, y2, lwd=2)                # N(0, 0.25)の密度曲線
  lines(z3, y3, lwd=3)                # N(1, 0.64)の密度曲線
  # 凡例の指定，グラフ上の場所はマウスで指定
  legend(locator(1), c("N(0, 1)", "N(0, 0.25)","N(1, 0.64)"), lwd=1:3)  
  #====================================================================
