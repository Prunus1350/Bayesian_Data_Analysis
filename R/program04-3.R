  #===== Program 4.3（採択棄却法による半円形分布の乱数発生）=========
  setwd("C:/RW")
  N <- 1000                          # 乱数列の長さ
  a <- 2 * sqrt(2/pi); g <- 2 * sqrt(2/pi); c <- sqrt(pi/8)
  No <- 0; M <- 0; X <- numeric(N)
  # 乱数を生成し，X に保存 ------------------------------------------
  while (No < N)
    {
     M <- M + 1; u <- runif(1)
     x <- a * runif(1); f <- sqrt(a * x - x^2)
     if (u <= f / (c * g)) 
       {
        No <- No + 1; X[No] <- x
       }
    }
  # X のヒストグラムを描く ------------------------------------------
  nclass <- ceiling(1 + log2(N))
  cwidth <- diff(range(X) / nclass) 
  breaks <- min(X) + cwidth * 0:nclass
  h.default <- hist(X, xlim=c(0, a), ylim=c(0, 0.9), freq = FALSE, 
                    xlab = "x", ylab = "frequency", main=" ")
  # 半円形分布の密度曲線 --------------------------------------------
  r1 <- numeric(100); z1 <- numeric(100)
  for (i in 1:100)
    {r1[i] <- (i-1) * a / 99
     z1[i] <- sqrt(a*r1[i] - r1[i]^2)
    }
  lines(r1, z1, lwd=2)
  #==================================================================
