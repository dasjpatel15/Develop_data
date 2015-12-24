library(shiny) 

diagnostic_f<-function(systolic, diastolic){
        sysVal <- systolic 
        diasVal <- diastolic
        diagvalue <- "Normal"
       ifelse( ( sysVal <= 120 &  diasVal <= 80),diagvalue <- "Normal", 
                  ifelse( ( (sysVal > 120 & sysVal <= 139)  & ( diasVal > 80 & diasVal <=89) ), diagvalue <- "At Risk prehypertension",
                  ifelse( ( sysVal >= 140 & diasVal >= 90), diagvalue <- "High",
                          diagvalue <- "Abnormal" ) ) )
}

BMI<-function(weight,height) {weight/(height^2)}

diagnostic_fn<-function(weight,height){
        BMI_value<-weight/(height^2)
        ifelse(BMI_value<18.5,"UnderWeight",ifelse(BMI_value<25,"Normal Weight",ifelse(BMI_value<30,"OverWeight","Obesity")))
}
A1CTest <- function(eAG) { (46.7 +eAG) / 28.7 }
diag_fn<- function(eAG) {
          A1CVal <- (46.7 +eAG) / 28.7
          ifelse(A1CVal < 5.7,"Normal - No Diabetes",
                    ifelse( ( A1CVal >= 5.7 & A1CVal < 6.4) ,"Prediabetes", 
                    ifelse( A1CVal >= 6.5, "Diabetes" ) ))
}
shinyServer(
        function(input, output) {
                
                output$inputsystolicvalue <- renderPrint({input$systolic})
                output$inputdiastolicvalue <- renderPrint({input$diastolic})
                output$diagnostic <- renderPrint({diagnostic_f(input$systolic,input$diastolic)})
                      
                output$inputweightvalue <- renderPrint({input$weight})
                output$inputheightvalue <- renderPrint({input$height})
                output$estimation <- renderPrint({BMI(input$weight,input$height)})
                output$diagnostic_w <- renderPrint({diagnostic_fn(input$weight,input$height)})
               
                output$inputeAG <- renderPrint({input$eAG})
                output$evaluation <- renderPrint({A1CTest(input$eAG)})
                output$diag_fn <- renderPrint({diag_fn(input$eAG)})
        } 
)