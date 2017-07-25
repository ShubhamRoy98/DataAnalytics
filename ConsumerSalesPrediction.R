
R version 3.4.0 (2017-04-21) -- "You Stupid Darkness"
Copyright (C) 2017 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from ~/.RData]

> setwd("C:/Users/WIN8/Desktop/Data Science/Data Sets")
> elantra=read.csv("elantra.csv",header=TRUE)
> View(elantra)
> train=subset(elantra,subset=elantra$Year<=2012)
> test=subset(elantra,subset=elantra$Year>2012)
> View(train)
> View(test)
> 
  > 
  > monthlysales=lm(ElantraSales~Unemployment+Queries+CPI_energy+CPI_all, data=train)
> summary(monthlysales)

Call:
  lm(formula = ElantraSales ~ Unemployment + Queries + CPI_energy + 
       CPI_all, data = train)

Residuals:
  Min      1Q  Median      3Q     Max 
-6785.2 -2101.8  -562.5  2901.7  7021.0 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
(Intercept)   95385.36  170663.81   0.559    0.580
Unemployment  -3179.90    3610.26  -0.881    0.385
Queries          19.03      11.26   1.690    0.101
CPI_energy       38.51     109.60   0.351    0.728
CPI_all        -297.65     704.84  -0.422    0.676

Residual standard error: 3295 on 31 degrees of freedom
Multiple R-squared:  0.4282,	Adjusted R-squared:  0.3544 
F-statistic: 5.803 on 4 and 31 DF,  p-value: 0.00132

> #Modelling Seasonality#
  > monthlysales=lm(ElantraSales~Month+Unemployment+Queries+CPI_energy+CPI_all, data=train)
> summary(monthlysales)

Call:
  lm(formula = ElantraSales ~ Month + Unemployment + Queries + 
       CPI_energy + CPI_all, data = train)

Residuals:
  Min      1Q  Median      3Q     Max 
-6416.6 -2068.7  -597.1  2616.3  7183.2 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)  
(Intercept)  148330.49  195373.51   0.759   0.4536  
Month           110.69     191.66   0.578   0.5679  
Unemployment  -4137.28    4008.56  -1.032   0.3103  
Queries          21.19      11.98   1.769   0.0871 .
CPI_energy       54.18     114.08   0.475   0.6382  
CPI_all        -517.99     808.26  -0.641   0.5265  
---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 3331 on 30 degrees of freedom
Multiple R-squared:  0.4344,	Adjusted R-squared:  0.3402 
F-statistic: 4.609 on 5 and 30 DF,  p-value: 0.003078

> monthlysales=lm(ElantraSales~as.factor(Month)+Unemployment+Queries+CPI_energy+CPI_all, data=train)
> summary(monthlysales)

Call:
  lm(formula = ElantraSales ~ as.factor(Month) + Unemployment + 
       Queries + CPI_energy + CPI_all, data = train)

Residuals:
  Min      1Q  Median      3Q     Max 
-3865.1 -1211.7   -77.1  1207.5  3562.2 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)        312509.280 144061.867   2.169 0.042288 *  
  as.factor(Month)2    2254.998   1943.249   1.160 0.259540    
as.factor(Month)3    6696.557   1991.635   3.362 0.003099 ** 
  as.factor(Month)4    7556.607   2038.022   3.708 0.001392 ** 
  as.factor(Month)5    7420.249   1950.139   3.805 0.001110 ** 
  as.factor(Month)6    9215.833   1995.230   4.619 0.000166 ***
  as.factor(Month)7    9929.464   2238.800   4.435 0.000254 ***
  as.factor(Month)8    7939.447   2064.629   3.845 0.001010 ** 
  as.factor(Month)9    5013.287   2010.745   2.493 0.021542 *  
  as.factor(Month)10   2500.184   2084.057   1.200 0.244286    
as.factor(Month)11   3238.932   2397.231   1.351 0.191747    
as.factor(Month)12   5293.911   2228.310   2.376 0.027621 *  
  Unemployment        -7739.381   2968.747  -2.607 0.016871 *  
  Queries                -4.764     12.938  -0.368 0.716598    
CPI_energy            288.631     97.974   2.946 0.007988 ** 
  CPI_all             -1343.307    592.919  -2.266 0.034732 *  
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 2306 on 20 degrees of freedom
Multiple R-squared:  0.8193,	Adjusted R-squared:  0.6837 
F-statistic: 6.044 on 15 and 20 DF,  p-value: 0.0001469

> #Multicolinearity#
  > cor(train)
Month       Year ElantraSales Unemployment    Queries CPI_energy    CPI_all
Month         1.0000000  0.0000000    0.1097945   -0.2036029  0.0158443  0.1760198  0.2667883
Year          0.0000000  1.0000000    0.5872737   -0.9587459  0.7265310  0.8316052  0.9485847
ElantraSales  0.1097945  0.5872737    1.0000000   -0.5671458  0.6100645  0.5916491  0.5936217
Unemployment -0.2036029 -0.9587459   -0.5671458    1.0000000 -0.6411093 -0.8007188 -0.9562123
Queries       0.0158443  0.7265310    0.6100645   -0.6411093  1.0000000  0.8328381  0.7536732
CPI_energy    0.1760198  0.8316052    0.5916491   -0.8007188  0.8328381  1.0000000  0.9132259
CPI_all       0.2667883  0.9485847    0.5936217   -0.9562123  0.7536732  0.9132259  1.0000000
> 
  > 
  > 
  > #A Reduced Model#
  > monthlysales=lm(ElantraSales~as.factor(Month)+Unemployment+CPI_energy+CPI_all, data=train)
> summary(monthlysales)

Call:
  lm(formula = ElantraSales ~ as.factor(Month) + Unemployment + 
       CPI_energy + CPI_all, data = train)

Residuals:
  Min      1Q  Median      3Q     Max 
-3866.0 -1283.3  -107.2  1098.3  3650.1 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)        325709.15  136627.85   2.384 0.026644 *  
  as.factor(Month)2    2410.91    1857.10   1.298 0.208292    
as.factor(Month)3    6880.09    1888.15   3.644 0.001517 ** 
  as.factor(Month)4    7697.36    1960.21   3.927 0.000774 ***
  as.factor(Month)5    7444.64    1908.48   3.901 0.000823 ***
  as.factor(Month)6    9223.13    1953.64   4.721 0.000116 ***
  as.factor(Month)7    9602.72    2012.66   4.771 0.000103 ***
  as.factor(Month)8    7919.50    2020.99   3.919 0.000789 ***
  as.factor(Month)9    5074.29    1962.23   2.586 0.017237 *  
  as.factor(Month)10   2724.24    1951.78   1.396 0.177366    
as.factor(Month)11   3665.08    2055.66   1.783 0.089062 .  
as.factor(Month)12   5643.19    1974.36   2.858 0.009413 ** 
  Unemployment        -7971.34    2840.79  -2.806 0.010586 *  
  CPI_energy            268.03      78.75   3.403 0.002676 ** 
  CPI_all             -1377.58     573.39  -2.403 0.025610 *  
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 2258 on 21 degrees of freedom
Multiple R-squared:  0.818,	Adjusted R-squared:  0.6967 
F-statistic: 6.744 on 14 and 21 DF,  p-value: 5.73e-05

> 
  > 
  > 
  > #Test Set Predictions#
> predict_sales=predict(monthlysales, test)
> summary(predict_sales)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
9085   15892   17698   17249   19771   21713 
> predict_sales
4         5         9        10        14        18        22        26        30        34        38 
9085.341 15816.428 14031.447 16787.215 18661.512 18447.778 18186.692 20141.335 21712.946 20307.072 17208.765 
42        46        50 
14217.469 16119.202 20757.995 
> 
  > 
  > 
  > SSE=sum((predict_sales-test)^2)
> SSE
[1] 24768125546
> SSE=sum((predict_sales-test$ElantraSales)^2)
> SSE
[1] 190757747
> SST=sum(test$ElantraSales-mean(train$ElantraSales)^2)
> SST
[1] -2927913820
> SST=sum((test$ElantraSales-mean(train$ElantraSales))^2)
> SST
[1] 701375142
> 
  > 
  > 
  > #baseline#
  > baseline=mean(train$ElantraSales)
> baseline
[1] 14462.25
> 
  > 
  > 
  > #Test-Set R Squared#
  > 1-SSE/SST
[1] 0.7280232
> 
  > 
  > 
  > #Errors#
  > max(abs(predict_sales-test$ElantraSales))
[1] 7491.488
> which.max(abs(predict_sales-test$ElantraSales))
14 
5 
> test[5,1:2]
Month Year
14 
  