# Basic information about data

Results from first 19 subjects are in results.first19 -- these were done before Roger had implemented recording of the results codes auto-generated in Ibex which allowed cross-tabulation of self-reported language & demographic information with experimental data.  At least 18 of these participants are self-reported native English speakers, but these are results are nevertheless not included in this analysis.

Lucky Eagle 5-16 were run starting just after 11am Eastern on Friday, August 5, 2016.  For this batch, use the following commands to generate results to be analyzed:

    egrep hiddenCompletionCode results > completionCodes
    egrep -v hiddenCompletionCode results > results-by-trial
    
# Results


```
## Loading required package: Matrix
```

```
## Loading required package: methods
```

```
## Warning: package 'ggplot2' was built under R version 3.2.4
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:data.table':
## 
##     between, last
```

```
## The following object is masked from 'package:stats':
## 
##     filter
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

Here is a plot of by-subjects means and standard error bars for the SHARED MORPHEME condition:


```r
f("Shared Morpheme")
```

![plot of chunk shared-morpheme-results](figure/shared-morpheme-results-1.png)

and here is a similar plot for the NO SHARED MORPHEME condition:


```r
f("No Shared Morpheme")
```

![plot of chunk no-shared-morpheme-results](figure/no-shared-morpheme-results-1.png)

## ANOVA analysis


### Shared morpheme data

No trace of an interaction for the shared-morpheme data:


```r
summary(aov(Response~PotentialError*Context + Error(Subject/(PotentialError*Context)),subset(subj.means,SharedMorpheme=="Shared Morpheme")))
```

```
## 
## Error: Subject
##            Df Sum Sq Mean Sq F value Pr(>F)
## Residuals 105  7.622 0.07259               
## 
## Error: Subject:PotentialError
##                 Df Sum Sq Mean Sq F value Pr(>F)    
## PotentialError   1 11.351  11.351   156.2 <2e-16 ***
## Residuals      105  7.629   0.073                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Subject:Context
##            Df Sum Sq  Mean Sq F value Pr(>F)
## Context     1  0.000 0.000037   0.002  0.967
## Residuals 105  2.309 0.021986               
## 
## Error: Subject:PotentialError:Context
##                         Df Sum Sq  Mean Sq F value Pr(>F)
## PotentialError:Context   1 0.0003 0.000332   0.019  0.892
## Residuals              105 1.8708 0.017817
```

```r
summary(aov(Response~PotentialError*Context + Error(Item/(PotentialError*Context)),subset(item.means,SharedMorpheme=="Shared Morpheme")))
```

```
## 
## Error: Item
##           Df Sum Sq Mean Sq F value Pr(>F)
## Residuals 31  1.238 0.03994               
## 
## Error: Item:PotentialError
##                Df Sum Sq Mean Sq F value   Pr(>F)    
## PotentialError  1  3.265   3.265   141.2 4.46e-13 ***
## Residuals      31  0.717   0.023                     
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Item:Context
##           Df  Sum Sq  Mean Sq F value Pr(>F)
## Context    1 0.00004 0.000042   0.005  0.942
## Residuals 31 0.24177 0.007799               
## 
## Error: Item:PotentialError:Context
##                        Df  Sum Sq  Mean Sq F value Pr(>F)
## PotentialError:Context  1 0.00019 0.000187   0.023   0.88
## Residuals              31 0.24792 0.007998
```


### No shared morpheme data

And little trace of an interaction for the no-shared-morpheme data:


```r
summary(aov(Response~PotentialError*Context + Error(Subject/(PotentialError*Context)),subset(subj.means,SharedMorpheme=="No Shared Morpheme")))
```

```
## 
## Error: Subject
##            Df Sum Sq Mean Sq F value Pr(>F)
## Residuals 105  7.457 0.07102               
## 
## Error: Subject:PotentialError
##                 Df Sum Sq Mean Sq F value Pr(>F)    
## PotentialError   1  5.293   5.293   155.7 <2e-16 ***
## Residuals      105  3.570   0.034                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Subject:Context
##            Df Sum Sq Mean Sq F value Pr(>F)
## Context     1  0.031 0.03099   1.776  0.186
## Residuals 105  1.832 0.01745               
## 
## Error: Subject:PotentialError:Context
##                         Df Sum Sq Mean Sq F value Pr(>F)
## PotentialError:Context   1 0.0133 0.01330   0.544  0.463
## Residuals              105 2.5687 0.02446
```

```r
summary(aov(Response~PotentialError*Context + Error(Item/(PotentialError*Context)),subset(item.means,SharedMorpheme=="No Shared Morpheme")))
```

```
## 
## Error: Item
##           Df Sum Sq Mean Sq F value Pr(>F)
## Residuals 31  1.174 0.03787               
## 
## Error: Item:PotentialError
##                Df Sum Sq Mean Sq F value   Pr(>F)    
## PotentialError  1 1.6268  1.6268    51.7 4.38e-08 ***
## Residuals      31 0.9754  0.0315                     
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Item:Context
##           Df  Sum Sq  Mean Sq F value Pr(>F)
## Context    1 0.01141 0.011413    1.28  0.266
## Residuals 31 0.27631 0.008913               
## 
## Error: Item:PotentialError:Context
##                        Df  Sum Sq  Mean Sq F value Pr(>F)
## PotentialError:Context  1 0.00258 0.002576   0.305  0.585
## Residuals              31 0.26182 0.008446
```

### Three-way interaction?

The three-way interaction is not close to significant by either subjects or items:


```r
summary(aov(Response~PotentialError*Context*SharedMorpheme + Error(Subject/(PotentialError*Context*SharedMorpheme)),subj.means))
```

```
## 
## Error: Subject
##            Df Sum Sq Mean Sq F value Pr(>F)
## Residuals 105  12.98  0.1237               
## 
## Error: Subject:PotentialError
##                 Df Sum Sq Mean Sq F value Pr(>F)    
## PotentialError   1 16.074  16.074   187.4 <2e-16 ***
## Residuals      105  9.008   0.086                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Subject:Context
##            Df Sum Sq Mean Sq F value Pr(>F)
## Context     1 0.0166 0.01658   0.812   0.37
## Residuals 105 2.1436 0.02041               
## 
## Error: Subject:SharedMorpheme
##                 Df Sum Sq Mean Sq F value   Pr(>F)    
## SharedMorpheme   1  0.520  0.5200   26.09 1.47e-06 ***
## Residuals      105  2.093  0.0199                     
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Subject:PotentialError:Context
##                         Df Sum Sq  Mean Sq F value Pr(>F)
## PotentialError:Context   1 0.0089 0.008918   0.422  0.518
## Residuals              105 2.2216 0.021158               
## 
## Error: Subject:PotentialError:SharedMorpheme
##                                Df Sum Sq Mean Sq F value  Pr(>F)    
## PotentialError:SharedMorpheme   1 0.5708  0.5708   27.35 8.7e-07 ***
## Residuals                     105 2.1910  0.0209                    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Subject:Context:SharedMorpheme
##                         Df Sum Sq Mean Sq F value Pr(>F)
## Context:SharedMorpheme   1 0.0144 0.01445   0.759  0.385
## Residuals              105 1.9973 0.01902               
## 
## Error: Subject:PotentialError:Context:SharedMorpheme
##                                        Df Sum Sq  Mean Sq F value Pr(>F)
## PotentialError:Context:SharedMorpheme   1 0.0047 0.004717   0.223  0.638
## Residuals                             105 2.2179 0.021123
```

```r
summary(aov(Response~PotentialError*Context*SharedMorpheme + Error(Item/(PotentialError*Context)),item.means))
```

```
## 
## Error: Item
##                Df Sum Sq Mean Sq F value Pr(>F)  
## SharedMorpheme  1 0.1326  0.1326   3.407 0.0697 .
## Residuals      62 2.4121  0.0389                 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Item:PotentialError
##                               Df Sum Sq Mean Sq F value Pr(>F)    
## PotentialError                 1  4.751   4.751 174.074 <2e-16 ***
## PotentialError:SharedMorpheme  1  0.141   0.141   5.176 0.0264 *  
## Residuals                     62  1.692   0.027                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Item:Context
##                        Df Sum Sq  Mean Sq F value Pr(>F)
## Context                 1 0.0064 0.006416   0.768  0.384
## Context:SharedMorpheme  1 0.0050 0.005038   0.603  0.440
## Residuals              62 0.5181 0.008356               
## 
## Error: Item:PotentialError:Context
##                                       Df Sum Sq  Mean Sq F value Pr(>F)
## PotentialError:Context                 1 0.0021 0.002075   0.252  0.617
## PotentialError:Context:SharedMorpheme  1 0.0007 0.000688   0.084  0.773
## Residuals                             62 0.5097 0.008222
```


## Mixed model analysis

### Shared morpheme data


```r
dat$poterr <- ifelse(dat$PotentialError=="Potential error",1,ifelse(dat$PotentialError=="Not a potential error",-1,NA))
dat$ctxt <- ifelse(dat$Context=="Distractor",1,ifelse(dat$Context=="Non-distractor",-1,NA))
system.time(m <- glmer(Response ~ poterr*ctxt + (poterr*ctxt || ParticipantID) + (poterr*ctxt || Item),subset(dat,SharedMorpheme=="Shared Morpheme"),family="binomial"))
```

```
## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl =
## control$checkConv, : Model failed to converge with max|grad| = 0.00777978
## (tol = 0.001, component 1)
```

```
##    user  system elapsed 
## 183.538   1.664 192.040
```

```r
system.time(m0 <- glmer(Response ~ poterr+ctxt + (poterr*ctxt || ParticipantID) + (poterr*ctxt || Item),subset(dat,SharedMorpheme=="Shared Morpheme"),family="binomial"))
```

```
## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl =
## control$checkConv, : Model failed to converge with max|grad| = 0.0205726
## (tol = 0.001, component 1)
```

```
##    user  system elapsed 
## 231.482   1.184 235.131
```


```r
summary(m)
```

```
## Generalized linear mixed model fit by maximum likelihood (Laplace
##   Approximation) [glmerMod]
##  Family: binomial  ( logit )
## Formula: Response ~ poterr * ctxt + (poterr * ctxt || ParticipantID) +  
##     (poterr * ctxt || Item)
##    Data: subset(dat, SharedMorpheme == "Shared Morpheme")
## 
##      AIC      BIC   logLik deviance df.resid 
##   3373.8   3447.3  -1674.9   3349.8     3380 
## 
## Scaled residuals: 
##     Min      1Q  Median      3Q     Max 
## -4.1200 -0.5444  0.2783  0.5224  2.4178 
## 
## Random effects:
##  Groups          Name        Variance  Std.Dev. 
##  ParticipantID   (Intercept) 5.913e-01 0.7689902
##  ParticipantID.1 poterr      5.090e-01 0.7134399
##  ParticipantID.2 ctxt        2.221e-02 0.1490346
##  ParticipantID.3 poterr:ctxt 7.432e-07 0.0008621
##  Item            (Intercept) 3.493e-01 0.5909926
##  Item.1          poterr      1.259e-01 0.3548839
##  Item.2          ctxt        2.145e-08 0.0001464
##  Item.3          poterr:ctxt 1.547e-02 0.1243782
## Number of obs: 3392, groups:  ParticipantID, 106; Item, 32
## 
## Fixed effects:
##              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  1.268074   0.139669   9.079   <2e-16 ***
## poterr      -1.068521   0.108003  -9.893   <2e-16 ***
## ctxt        -0.006747   0.048928  -0.138    0.890    
## poterr:ctxt  0.010820   0.051690   0.209    0.834    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Correlation of Fixed Effects:
##             (Intr) poterr ctxt  
## poterr      -0.088              
## ctxt        -0.004  0.003       
## poterr:ctxt  0.003 -0.005 -0.251
## convergence code: 0
## Model failed to converge with max|grad| = 0.00777978 (tol = 0.001, component 1)
```

```r
anova(m0,m)
```

```
## Data: subset(dat, SharedMorpheme == "Shared Morpheme")
## Models:
## m0: Response ~ poterr + ctxt + (poterr * ctxt || ParticipantID) + 
## m0:     (poterr * ctxt || Item)
## m: Response ~ poterr * ctxt + (poterr * ctxt || ParticipantID) + 
## m:     (poterr * ctxt || Item)
##    Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
## m0 11 3371.8 3439.2 -1674.9   3349.8                         
## m  12 3373.8 3447.3 -1674.9   3349.8 0.0425      1     0.8367
```


### No shared morpheme data


```r
dat$poterr <- ifelse(dat$PotentialError=="Potential error",1,ifelse(dat$PotentialError=="Not a potential error",-1,NA))
dat$ctxt <- ifelse(dat$Context=="Distractor",1,ifelse(dat$Context=="Non-distractor",-1,NA))
system.time(m <- glmer(Response ~ poterr*ctxt + (poterr*ctxt || ParticipantID) + (poterr*ctxt || Item),subset(dat,SharedMorpheme=="No Shared Morpheme"),family="binomial"))
```

```
## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl =
## control$checkConv, : Model failed to converge with max|grad| = 0.0079576
## (tol = 0.001, component 1)
```

```
##    user  system elapsed 
## 140.764   0.595 142.349
```

```r
system.time(m0 <- glmer(Response ~ poterr+ctxt + (poterr*ctxt || ParticipantID) + (poterr*ctxt || Item),subset(dat,SharedMorpheme=="No Shared Morpheme"),family="binomial"))
```

```
## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl =
## control$checkConv, : Model failed to converge with max|grad| = 0.039809
## (tol = 0.001, component 1)
```

```
##    user  system elapsed 
## 119.570   0.608 121.234
```


```r
summary(m)
```

```
## Generalized linear mixed model fit by maximum likelihood (Laplace
##   Approximation) [glmerMod]
##  Family: binomial  ( logit )
## Formula: Response ~ poterr * ctxt + (poterr * ctxt || ParticipantID) +  
##     (poterr * ctxt || Item)
##    Data: subset(dat, SharedMorpheme == "No Shared Morpheme")
## 
##      AIC      BIC   logLik deviance df.resid 
##   3330.9   3404.5  -1653.5   3306.9     3380 
## 
## Scaled residuals: 
##     Min      1Q  Median      3Q     Max 
## -4.2721 -0.3096  0.3214  0.5256  2.8474 
## 
## Random effects:
##  Groups          Name        Variance  Std.Dev. 
##  ParticipantID   (Intercept) 5.907e-01 7.686e-01
##  ParticipantID.1 poterr      1.524e-01 3.903e-01
##  ParticipantID.2 ctxt        6.205e-09 7.877e-05
##  ParticipantID.3 poterr:ctxt 1.328e-02 1.153e-01
##  Item            (Intercept) 3.087e-01 5.556e-01
##  Item.1          poterr      2.072e-01 4.552e-01
##  Item.2          ctxt        1.299e-02 1.140e-01
##  Item.3          poterr:ctxt 2.323e-02 1.524e-01
## Number of obs: 3392, groups:  ParticipantID, 106; Item, 32
## 
## Fixed effects:
##             Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  1.46340    0.13527  10.818  < 2e-16 ***
## poterr      -0.75772    0.10247  -7.394 1.42e-13 ***
## ctxt        -0.08535    0.05100  -1.673   0.0942 .  
## poterr:ctxt  0.05779    0.05517   1.047   0.2949    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Correlation of Fixed Effects:
##             (Intr) poterr ctxt  
## poterr      -0.077              
## ctxt        -0.026  0.030       
## poterr:ctxt  0.021 -0.023 -0.205
## convergence code: 0
## Model failed to converge with max|grad| = 0.0079576 (tol = 0.001, component 1)
```

```r
anova(m0,m)
```

```
## Data: subset(dat, SharedMorpheme == "No Shared Morpheme")
## Models:
## m0: Response ~ poterr + ctxt + (poterr * ctxt || ParticipantID) + 
## m0:     (poterr * ctxt || Item)
## m: Response ~ poterr * ctxt + (poterr * ctxt || ParticipantID) + 
## m:     (poterr * ctxt || Item)
##    Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
## m0 11 3330.0 3397.4 -1654.0   3308.0                         
## m  12 3330.9 3404.5 -1653.5   3306.9 1.0592      1     0.3034
```

### Three-way interaction

High-level point in this section: none of these models converged, but if one considers the graphs and ANOVA results it's fairly clear that there's no evidence for an interaction.

Models with a random intercept and all random slopes fail to converge even with no random correlation parameters, but there is no clear sign of an interaction:


```r
dat$poterr <- ifelse(dat$PotentialError=="Potential error",1,ifelse(dat$PotentialError=="Not a potential error",-1,NA))
dat$ctxt <- ifelse(dat$Context=="Distractor",1,ifelse(dat$Context=="Non-distractor",-1,NA))
dat$shmorph <- ifelse(dat$SharedMorpheme=="Shared Morpheme",1,ifelse(dat$SharedMorpheme=="No Shared Morpheme",-1,NA))
system.time(m <- glmer(Response ~ poterr*ctxt*shmorph + (poterr*ctxt*shmorph || ParticipantID) + (poterr*ctxt || Item),subset(dat,! Filler),family="binomial"))
```

```
## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl =
## control$checkConv, : Model failed to converge with max|grad| = 0.206978
## (tol = 0.001, component 1)
```

```
##     user   system  elapsed 
## 2052.505    3.656 2059.858
```

```r
system.time(m0 <- glmer(Response ~ poterr*ctxt*shmorph - poterr:ctxt:shmorph + (poterr*ctxt*shmorph || ParticipantID) + (poterr*ctxt || Item),subset(dat,! Filler),family="binomial"))
```

```
## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl =
## control$checkConv, : Model failed to converge with max|grad| = 0.231831
## (tol = 0.001, component 1)
```

```
##     user   system  elapsed 
## 2117.790    4.618 8799.831
```


```r
summary(m)
```

```
## Generalized linear mixed model fit by maximum likelihood (Laplace
##   Approximation) [glmerMod]
##  Family: binomial  ( logit )
## Formula: Response ~ poterr * ctxt * shmorph + (poterr * ctxt * shmorph ||  
##     ParticipantID) + (poterr * ctxt || Item)
##    Data: subset(dat, !Filler)
## 
##      AIC      BIC   logLik deviance df.resid 
##   6566.3   6702.8  -3263.2   6526.3     6764 
## 
## Scaled residuals: 
##     Min      1Q  Median      3Q     Max 
## -5.3303 -0.5138  0.2879  0.5302  2.7607 
## 
## Random effects:
##  Groups          Name                Variance  Std.Dev.
##  ParticipantID   (Intercept)         6.581e-01 0.811238
##  ParticipantID.1 poterr              3.645e-01 0.603706
##  ParticipantID.2 ctxt                3.375e-03 0.058098
##  ParticipantID.3 shmorph             1.028e-04 0.010140
##  ParticipantID.4 poterr:ctxt         1.048e-02 0.102368
##  ParticipantID.5 poterr:shmorph      9.601e-06 0.003098
##  ParticipantID.6 ctxt:shmorph        2.325e-04 0.015249
##  ParticipantID.7 poterr:ctxt:shmorph 4.921e-05 0.007015
##  Item            (Intercept)         3.398e-01 0.582929
##  Item.1          poterr              1.709e-01 0.413356
##  Item.2          ctxt                2.014e-05 0.004487
##  Item.3          poterr:ctxt         1.579e-02 0.125676
## Number of obs: 6784, groups:  ParticipantID, 106; Item, 64
## 
## Fixed effects:
##                     Estimate Std. Error z value Pr(>|z|)    
## (Intercept)          1.39696    0.11474  12.175   <2e-16 ***
## poterr              -0.92089    0.08720 -10.561   <2e-16 ***
## ctxt                -0.04586    0.03386  -1.355   0.1755    
## shmorph             -0.11776    0.08039  -1.465   0.1430    
## poterr:ctxt          0.03699    0.03822   0.968   0.3332    
## poterr:shmorph      -0.12578    0.06180  -2.035   0.0418 *  
## ctxt:shmorph         0.03799    0.03318   1.145   0.2523    
## poterr:ctxt:shmorph -0.02462    0.03670  -0.671   0.5024    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Correlation of Fixed Effects:
##             (Intr) poterr ctxt   shmrph ptrr:c ptrr:s ctxt:s
## poterr      -0.070                                          
## ctxt        -0.014  0.018                                   
## shmorph     -0.003 -0.002  0.008                            
## poterr:ctxt  0.012 -0.014 -0.251 -0.009                     
## ptrr:shmrph -0.005 -0.001 -0.012 -0.070  0.009              
## ctxt:shmrph  0.008 -0.012 -0.014 -0.011 -0.010  0.015       
## ptrr:ctxt:s -0.007  0.008 -0.012  0.011 -0.009 -0.013 -0.254
## convergence code: 0
## Model failed to converge with max|grad| = 0.206978 (tol = 0.001, component 1)
```

```r
anova(m0,m)
```

```
## Data: subset(dat, !Filler)
## Models:
## m0: Response ~ poterr * ctxt * shmorph - poterr:ctxt:shmorph + (poterr * 
## m0:     ctxt * shmorph || ParticipantID) + (poterr * ctxt || Item)
## m: Response ~ poterr * ctxt * shmorph + (poterr * ctxt * shmorph || 
## m:     ParticipantID) + (poterr * ctxt || Item)
##    Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
## m0 19 6564.8 6694.4 -3263.4   6526.8                         
## m  20 6566.3 6702.8 -3263.2   6526.3 0.4537      1     0.5006
```


Even models with only the random intercept and the critical random slopes fail to converge.  At any rate there is still no clear sign of an interaction:


```r
dat$poterr <- ifelse(dat$PotentialError=="Potential error",1,ifelse(dat$PotentialError=="Not a potential error",-1,NA))
dat$ctxt <- ifelse(dat$Context=="Distractor",1,ifelse(dat$Context=="Non-distractor",-1,NA))
dat$shmorph <- ifelse(dat$SharedMorpheme=="Shared Morpheme",1,ifelse(dat$SharedMorpheme=="No Shared Morpheme",-1,NA))
system.time(m.simpleranef <- glmer(Response ~ poterr*ctxt*shmorph + (poterr:ctxt:shmorph || ParticipantID) + (poterr:ctxt || Item),subset(dat,! Filler),family="binomial"))
```

```
## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl =
## control$checkConv, : Model failed to converge with max|grad| = 0.0147244
## (tol = 0.001, component 1)
```

```
##    user  system elapsed 
## 141.906   0.365 142.610
```

```r
system.time(m0.simpleranef <- glmer(Response ~ poterr*ctxt*shmorph - poterr:ctxt:shmorph + (poterr:ctxt:shmorph || ParticipantID) + (poterr:ctxt || Item),subset(dat,! Filler),family="binomial"))
```

```
## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl =
## control$checkConv, : Model failed to converge with max|grad| = 0.00116057
## (tol = 0.001, component 1)
```

```
##    user  system elapsed 
##  79.147   0.326  79.809
```


```r
summary(m.simpleranef)
```

```
## Generalized linear mixed model fit by maximum likelihood (Laplace
##   Approximation) [glmerMod]
##  Family: binomial  ( logit )
## Formula: Response ~ poterr * ctxt * shmorph + (poterr:ctxt:shmorph ||  
##     ParticipantID) + (poterr:ctxt || Item)
##    Data: subset(dat, !Filler)
## 
##      AIC      BIC   logLik deviance df.resid 
##   6767.5   6849.4  -3371.8   6743.5     6772 
## 
## Scaled residuals: 
##     Min      1Q  Median      3Q     Max 
## -6.6777 -0.6276  0.3301  0.5638  3.2196 
## 
## Random effects:
##  Groups          Name                Variance  Std.Dev. 
##  ParticipantID   (Intercept)         5.910e-01 0.7687783
##  ParticipantID.1 poterr:ctxt:shmorph 8.019e-07 0.0008955
##  Item            (Intercept)         3.345e-01 0.5783775
##  Item.1          poterr:ctxt         1.853e-02 0.1361117
## Number of obs: 6784, groups:  ParticipantID, 106; Item, 64
## 
## Fixed effects:
##                     Estimate Std. Error z value Pr(>|z|)    
## (Intercept)          1.28795    0.10986  11.723  < 2e-16 ***
## poterr              -0.84731    0.03345 -25.327  < 2e-16 ***
## ctxt                -0.04336    0.03244  -1.337 0.181383    
## shmorph             -0.11190    0.07944  -1.409 0.158946    
## poterr:ctxt          0.03530    0.03669   0.962 0.335973    
## poterr:shmorph      -0.12273    0.03263  -3.761 0.000169 ***
## ctxt:shmorph         0.03831    0.03244   1.181 0.237698    
## poterr:ctxt:shmorph -0.02731    0.03669  -0.744 0.456784    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Correlation of Fixed Effects:
##             (Intr) poterr ctxt   shmrph ptrr:c ptrr:s ctxt:s
## poterr      -0.119                                          
## ctxt        -0.011  0.035                                   
## shmorph     -0.002 -0.005  0.010                            
## poterr:ctxt  0.010 -0.028 -0.276 -0.009                     
## ptrr:shmrph -0.010  0.005 -0.026 -0.131  0.021              
## ctxt:shmrph  0.009 -0.028 -0.008 -0.012 -0.012  0.031       
## ptrr:ctxt:s -0.007  0.021 -0.012  0.011 -0.006 -0.025 -0.275
## convergence code: 0
## Model failed to converge with max|grad| = 0.0147244 (tol = 0.001, component 1)
```

```r
anova(m0.simpleranef,m.simpleranef)
```

```
## Data: subset(dat, !Filler)
## Models:
## m0.simpleranef: Response ~ poterr * ctxt * shmorph - poterr:ctxt:shmorph + (poterr:ctxt:shmorph || 
## m0.simpleranef:     ParticipantID) + (poterr:ctxt || Item)
## m.simpleranef: Response ~ poterr * ctxt * shmorph + (poterr:ctxt:shmorph || 
## m.simpleranef:     ParticipantID) + (poterr:ctxt || Item)
##                Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)
## m0.simpleranef 11 6766.1 6841.1 -3372.0   6744.1                         
## m.simpleranef  12 6767.5 6849.4 -3371.8   6743.5 0.5525      1     0.4573
```


## Miscellaneous sanity checks

Some basic information -- we have good coverage of each item-condition combination:


```r
# check response rates
with(dat,tapply(Item,list(Item,Type),length))
```

```
##     control.error control.target distractor.error distractor.target
## 1              25             29               22                30
## 2              30             25               29                22
## 3              22             30               25                29
## 4              29             22               30                25
## 5              25             29               22                30
## 6              30             25               29                22
## 7              22             30               25                29
## 8              29             22               30                25
## 9              25             29               22                30
## 10             30             25               29                22
## 11             22             30               25                29
## 12             29             22               30                25
## 13             25             29               22                30
## 14             30             25               29                22
## 15             22             30               25                29
## 16             29             22               30                25
## 17             25             29               22                30
## 18             30             25               29                22
## 19             22             30               25                29
## 20             29             22               30                25
## 21             25             29               22                30
## 22             30             25               29                22
## 23             22             30               25                29
## 24             29             22               30                25
## 25             25             29               22                30
## 26             30             25               29                22
## 27             22             30               25                29
## 28             29             22               30                25
## 29             25             29               22                30
## 30             30             25               29                22
## 31             22             30               25                29
## 32             29             22               30                25
## 33             25             29               22                30
## 34             30             25               29                22
## 35             22             30               25                29
## 36             29             22               30                25
## 37             25             29               22                30
## 38             30             25               29                22
## 39             22             30               25                29
## 40             29             22               30                25
## 41             25             29               22                30
## 42             30             25               29                22
## 43             22             30               25                29
## 44             29             22               30                25
## 45             25             29               22                30
## 46             30             25               29                22
## 47             22             30               25                29
## 48             29             22               30                25
## 49             25             29               22                30
## 50             30             25               29                22
## 51             22             30               25                29
## 52             29             22               30                25
## 53             25             29               22                30
## 54             30             25               29                22
## 55             22             30               25                29
## 56             29             22               30                25
## 57             25             29               22                30
## 58             30             25               29                22
## 59             22             30               25                29
## 60             29             22               30                25
## 61             25             29               22                30
## 62             30             25               29                22
## 63             22             30               25                29
## 64             29             22               30                25
## 100            NA             NA               NA                NA
## 101            NA             NA               NA                NA
## 102            NA             NA               NA                NA
## 103            NA             NA               NA                NA
##     fillers intro
## 1        NA    NA
## 2        NA    NA
## 3        NA    NA
## 4        NA    NA
## 5        NA    NA
## 6        NA    NA
## 7        NA    NA
## 8        NA    NA
## 9        NA    NA
## 10       NA    NA
## 11       NA    NA
## 12       NA    NA
## 13       NA    NA
## 14       NA    NA
## 15       NA    NA
## 16       NA    NA
## 17       NA    NA
## 18       NA    NA
## 19       NA    NA
## 20       NA    NA
## 21       NA    NA
## 22       NA    NA
## 23       NA    NA
## 24       NA    NA
## 25       NA    NA
## 26       NA    NA
## 27       NA    NA
## 28       NA    NA
## 29       NA    NA
## 30       NA    NA
## 31       NA    NA
## 32       NA    NA
## 33       NA    NA
## 34       NA    NA
## 35       NA    NA
## 36       NA    NA
## 37       NA    NA
## 38       NA    NA
## 39       NA    NA
## 40       NA    NA
## 41       NA    NA
## 42       NA    NA
## 43       NA    NA
## 44       NA    NA
## 45       NA    NA
## 46       NA    NA
## 47       NA    NA
## 48       NA    NA
## 49       NA    NA
## 50       NA    NA
## 51       NA    NA
## 52       NA    NA
## 53       NA    NA
## 54       NA    NA
## 55       NA    NA
## 56       NA    NA
## 57       NA    NA
## 58       NA    NA
## 59       NA    NA
## 60       NA    NA
## 61       NA    NA
## 62       NA    NA
## 63       NA    NA
## 64       NA    NA
## 100      NA   106
## 101     106    NA
## 102     106    NA
## 103     106    NA
```

...and response rates for the four fillers (all of which have obvious errors) are reasonably low:


```r
# check filler behavior
with(subset(dat,Type %in% c("fillers","intro")),tapply(Response,Item,mean))
```

```
##       100       101       102       103 
## 0.4811321 0.1792453 0.1981132 0.3584906
```
