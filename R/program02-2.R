  #===== Program 2.2（Box-Cox変換のパラメータ推定とAICの計算）=======
  # データファイルがcドライブのフォルダrwにあるとき
  setwd("C:/RW")
  # データを x に呼び込む
  x <- read.table("PDA-F.txt", header=T)
  # データ数を求め，データをベクトル y に保存
  N <- nrow(x); y <- x[,1]
  # y の分散の最尤推定と最大対数尤度を求める
  vy <- var(y)*(N-1)/N
  LL1 <- -N*(log(2 * pi * vy) + 1)/2
  # Box-Cox変換における lambda の対数尤度を計算する関数 -------------
  LogL <- function(theta, y, N) 
    {
     lambda <- theta
     if (lambda == 0)
       {
        z <- log(y)
       }
     else
       {
        z <- (y^lambda - 1) / lambda
       }
     vz <- var(z) * (N-1) / N
     LL <- -N * (log(2 * pi * vz) + 1)/2 + (lambda - 1) * sum(log(y))
     return(LL) 
    }
      
  # lambda について関数 LogL の最小化を行う -----------------------
  LLF <- optimize(LogL, lower=-1, upper=1, maximum=TRUE, y=y, N=N)
  lambda <- LLF$maximum
  LL2 <- LLF$objective
  # 原データと変換後のデータに関するモデルのAICの計算 ---------------
  AIC1 <- -2*LL1 + 2*2; AIC2 <- -2*LL2 + 2*3
  # 主要結果の出力
  print("Lambda ="); print(lambda)
  print("AIC1 ="); print(AIC1)
  print("AIC2 ="); print(AIC2)
  #==================================================================
