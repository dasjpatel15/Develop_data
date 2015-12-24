---
title       : Health Measurements and Evaluation Report
subtitle    : Developing Data Products Project
author      : Jitendra Patel
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
#### Health Measurements Blood Pressure, BMI and A1C
The Blood pressure is measured using two numbers. Blood pressure is measured in millimeters of mercury (mmHg). The chart below shows normal, at-risk, and high blood pressure levels:

    + Blood Pressure [ < 120  / < 80 ]       : Normal
    + Blood Pressure [120-139 / 80-89]       : At Risk (prehypertension)
    + Blood Pressure [140 >= / 90 >= ]       : High
**What is BMI?**
The Body Mass Index (BMI) is a measure of body fat based on height and weight, the World Health Organization (WHO) proposes the following classification:

    + BMI <18.5     : Underweight + BMI [18.5-24.9] : Normal weight
    + BMI [25-29.9] : Overweight  + BMI >=30        : Obesity
 **What is A1C?**
The A1C test is a blood test also called blood sugar, over the past 3 months. The A1C test is sometimes called the hemoglobin A1c, HbA1c, or glycohemoglobin test. According to A1C levels: Diagnosis       A1C Level 
   
    * Normal        below 5.7%     * PreDiabetes   5.7 to 6.4% 
    * Diabetes      6.5% or above

--- 
#### It is calculated Based on functions and Formulas.
The Blood pressure compare with high and low limit and evaluate the pressure condition.
The function use for calculating the diagnostic is the following:


```r
diagnostic_f<-function(systolic, diastolic){
        sysVal <- systolic 
        diasVal <- diastolic
        diagvalue <- "Normal"
       ifelse( ( sysVal <= 120 &  diasVal <= 80),diagvalue <- "Normal", 
       ifelse( ( (sysVal > 120 & sysVal <= 139)  & ( diasVal > 80 & diasVal <=89) ), diagvalue <- "At Risk prehypertension",
       ifelse( ( sysVal >= 140 & diasVal >= 90), diagvalue <- "High",diagvalue <- "Abnormal" ) ) )
}
```

For our example (systolic = 126 mmHg and diastolic =  83 mmHg) the diagnostic would be:

```r
    diagnostic_f(126,83)
```

```
## [1] "At Risk prehypertension"
```

---
There is a formula for calculating the BMI measure. The formula is the following:
BMI = weight(kg) / height(metres)$^2$
Thus for the next example, the BMI will be:
### Diagnostic
The function use for calculating the diagnostic is the following:

```r
diagnostic_fn<-function(weight,height){
        BMI_value<-weight/(height^2)
        ifelse(BMI_value<18.5,"UnderWeight",ifelse(BMI_value<25,"Normal Weight",ifelse(BMI_value<30,"OverWeight","Obesity")))
}
```

For our example (weight=76 kg and height=1.70 m) the diagnostic would be:

```r
diagnostic_fn(76,1.7)
```

```
## [1] "OverWeight"
```

---
There is a formula for calculating the A1C level. The formula is the following:
A1C = (46.7 + estimated Average Glucose (eAG)) / 28.7
Thus for the next example, the A1C Value will be:
### Diagnostic
The function use for calculating the diagnostic is the following:

```r
diag_fn<- function(eAG) {
          A1CVal <- (46.7 +eAG) / 28.7
          ifelse(A1CVal < 5.7,"Normal - No Diabetes",
                    ifelse( ( A1CVal >= 5.7 & A1CVal < 6.4) ,"Prediabetes", 
                    ifelse( A1CVal >= 6.5, "Diabetes" ) ))
}
```

For our example (eAG=120 mg/dL) the diagnostic would be:

```r
diag_fn(120)
```

```
## [1] "Prediabetes"
```

---
## Conclusion
The Blood pressure, BMI, and A1C values are key measurements of your overall health evalution report. There would be many factors to these values like ethnicity, Origin, fitness, work habits, stress level, diets and exercises..
Contorlling BMI shall helps in lowering A1C and Blood pressure with proper exercise and diets habits.
