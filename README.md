# TimeSeriesAnalysis
Scripts for time series analysis

Sample output from `xsim_varma_fit_var.r`, which uses the R [MTS](https://cran.r-project.org/web/packages/MTS/index.html) package to simulate a VARMA(1,1) process and fit VAR (vector autoregression) models of successively higher orders, is below. The BIC and HQ criteria choose a VAR with 3 lags, fewer than the AIC, which chooses 4.

```
Simulated process coefficients:
AR Coefficients (phi):
     [,1] [,2]
[1,]  0.2  0.3
[2,] -0.6  1.1
MA Coefficients (theta):
     [,1] [,2]
[1,] -0.5  0.0
[2,]  0.0 -0.6
Covariance Matrix (sigma):
     [,1] [,2]
[1,]  4.0  0.8
[2,]  0.8  1.0

dim(zt): 1000 2 

Autocorrelations of series 'zt', by lag

, , Series 1

 Series 1   Series 2  
 1.000 ( 0) 0.528 ( 0)
 0.674 ( 1) 0.254 (-1)
 0.284 ( 2) 0.043 (-2)

, , Series 2

 Series 1   Series 2  
 0.528 ( 0) 1.000 ( 0)
 0.627 ( 1) 0.936 ( 1)
 0.601 ( 2) 0.812 ( 2)


lag.ar = 1 
Constant term: 
Estimates:  -0.1044549 -0.03062638 
Std.Error:  0.06916922 0.0362292 
AR coefficient matrix 
AR( 1 )-matrix 
       [,1]  [,2]
[1,]  0.475 0.223
[2,] -0.564 1.114
standard error 
       [,1]    [,2]
[1,] 0.0249 0.01476
[2,] 0.0130 0.00773
  
Residuals cov-mtx: 
          [,1]      [,2]
[1,] 4.6827073 0.9880773
[2,] 0.9880773 1.2846616
  
det(SSE) =  5.039397 
AIC =  1.625287 
BIC =  1.644918 
HQ  =  1.632748 

lag.ar = 2 
Constant term: 
Estimates:  -0.08525757 -0.009309301 
Std.Error:  0.06679199 0.03348674 
AR coefficient matrix 
AR( 1 )-matrix 
       [,1]  [,2]
[1,]  0.655 0.233
[2,] -0.597 1.512
standard error 
       [,1]   [,2]
[1,] 0.0334 0.0637
[2,] 0.0167 0.0319
AR( 2 )-matrix 
       [,1]    [,2]
[1,] -0.226 -0.0342
[2,]  0.231 -0.4516
standard error 
       [,1]   [,2]
[1,] 0.0508 0.0697
[2,] 0.0254 0.0350
  
Residuals cov-mtx: 
          [,1]      [,2]
[1,] 4.3414079 0.9168607
[2,] 0.9168607 1.0912584
  
det(SSE) =  3.896964 
AIC =  1.376198 
BIC =  1.41546 
HQ  =  1.39112 

lag.ar = 3 
Constant term: 
Estimates:  -0.0910338 -0.02056322 
Std.Error:  0.06622381 0.0326565 
AR coefficient matrix 
AR( 1 )-matrix 
       [,1]  [,2]
[1,]  0.699 0.217
[2,] -0.601 1.603
standard error 
       [,1]   [,2]
[1,] 0.0346 0.0691
[2,] 0.0171 0.0341
AR( 2 )-matrix 
       [,1]    [,2]
[1,] -0.363  0.0088
[2,]  0.285 -0.7722
standard error 
       [,1]   [,2]
[1,] 0.0640 0.1193
[2,] 0.0316 0.0588
AR( 3 )-matrix 
       [,1]    [,2]
[1,]  0.154 -0.0262
[2,] -0.105  0.2513
standard error 
       [,1]   [,2]
[1,] 0.0543 0.0756
[2,] 0.0268 0.0373
  
Residuals cov-mtx: 
          [,1]      [,2]
[1,] 4.2461172 0.8878123
[2,] 0.8878123 1.0325305
  
det(SSE) =  3.596035 
AIC =  1.303832 
BIC =  1.362725 
HQ  =  1.326215 

lag.ar = 4 
Constant term: 
Estimates:  -0.08472878 -0.01682396 
Std.Error:  0.06614913 0.03262521 
AR coefficient matrix 
AR( 1 )-matrix 
       [,1]  [,2]
[1,]  0.708 0.238
[2,] -0.604 1.627
standard error 
       [,1]  [,2]
[1,] 0.0350 0.071
[2,] 0.0173 0.035
AR( 2 )-matrix 
       [,1]    [,2]
[1,] -0.377 -0.0431
[2,]  0.305 -0.8450
standard error 
       [,1]   [,2]
[1,] 0.0671 0.1304
[2,] 0.0331 0.0643
AR( 3 )-matrix 
       [,1]   [,2]
[1,]  0.204 0.0533
[2,] -0.140 0.3950
standard error 
       [,1]   [,2]
[1,] 0.0698 0.1311
[2,] 0.0344 0.0646
AR( 4 )-matrix 
        [,1]    [,2]
[1,] -0.0456 -0.0588
[2,]  0.0517 -0.1043
standard error 
       [,1]   [,2]
[1,] 0.0552 0.0775
[2,] 0.0272 0.0382
  
Residuals cov-mtx: 
          [,1]      [,2]
[1,] 4.2140872 0.8794244
[2,] 0.8794244 1.0250894
  
det(SSE) =  3.546429 
AIC =  1.297941 
BIC =  1.376465 
HQ  =  1.327786 

lag.ar = 5 
Constant term: 
Estimates:  -0.08584221 -0.02093731 
Std.Error:  0.06632399 0.03263429 
AR coefficient matrix 
AR( 1 )-matrix 
       [,1]  [,2]
[1,]  0.708 0.236
[2,] -0.603 1.630
standard error 
       [,1]   [,2]
[1,] 0.0352 0.0713
[2,] 0.0173 0.0351
AR( 2 )-matrix 
       [,1]    [,2]
[1,] -0.381 -0.0339
[2,]  0.307 -0.8658
standard error 
       [,1]   [,2]
[1,] 0.0679 0.1332
[2,] 0.0334 0.0656
AR( 3 )-matrix 
       [,1]   [,2]
[1,]  0.211 0.0351
[2,] -0.149 0.4420
standard error 
       [,1]   [,2]
[1,] 0.0735 0.1436
[2,] 0.0362 0.0706
AR( 4 )-matrix 
        [,1]    [,2]
[1,] -0.0612 -0.0205
[2,]  0.0620 -0.1857
standard error 
       [,1]  [,2]
[1,] 0.0714 0.134
[2,] 0.0351 0.066
AR( 5 )-matrix 
        [,1]    [,2]
[1,]  0.0220 -0.0287
[2,] -0.0164  0.0572
standard error 
       [,1]   [,2]
[1,] 0.0555 0.0779
[2,] 0.0273 0.0383
  
Residuals cov-mtx: 
          [,1]      [,2]
[1,] 4.2150939 0.8790021
[2,] 0.8790021 1.0205030
  
det(SSE) =  3.528871 
AIC =  1.300978 
BIC =  1.399133 
HQ  =  1.338284 

Results:
 Lag      AIC      BIC       HQ
   1 1.625287 1.644918 1.632748
   2 1.376198 1.415460 1.391120
   3 1.303832 1.362725 1.326215
   4 1.297941 1.376465 1.327786
   5 1.300978 1.399133 1.338284

Best lag according to AIC: 4 
Best lag according to BIC: 3 
Best lag according to  HQ: 3
```
