library(shiny) 
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Preliminary Health Measurements and Evaluation"),
                
                sidebarPanel(
                        numericInput('systolic', 'Enter your systolic in mmHg', 119) ,
                        numericInput('diastolic', 'Enter your diastolic in mmHg', 79),
	      numericInput('weight', 'Enter your weight in Kg', 70) ,
                        numericInput('height', 'Enter your height in meters', 1.70, min = 0.2, max = 3, step = 0.01),
	      numericInput('eAG','Enter your estimated average glucose', 100),
                        submitButton('Submit')
                ), 
                mainPanel(
                        p(' The Blood pressure is measured using two numbers. The first number, called systolic blood pressure, represents the pressure in your blood vessels when your heart beats. The second number, called diastolic blood pressure, represents the pressure in your blood vessels when your heart rests between beats.  Blood pressure is measured in millimeters of mercury (mmHg)'),
                        tags$div(
                                tags$ul(tags$li('The chart below shows normal, at-risk, and high blood pressure levels:'),
                                        tags$li(tags$b('Blood Pressure [ < 120  / < 80 ]        : Normal')),
                                        tags$li(tags$b('Blood Pressure [120-139 / 80-89]        : At Risk (prehypertension)')),
                                        tags$li(tags$b('Blood Pressure [140 >= / 90 >= ]        : High'))
                                       )
	         ),
	                    p(' The Body mass index (BMI) is a measure of body fat based on height and weight.'),
                        p(' Regarding the BMI measure, the World Health Organization (WHO) proposes the following classification:'),
                        tags$div(
                                tags$ul(
                                        tags$li(tags$b('BMI <18.5       : Underweight')),
                                        tags$li(tags$b('BMI [18.5-24.9] : Normal weight')),
                                        tags$li(tags$b('BMI [25-29.9]   : Overweight')),
                                        tags$li(tags$b('BMI >=30        : Obesity'))
                                )
	      ),
                        h4('Taking into account the values entered by you:'), 
                        p('systolic:'), verbatimTextOutput("inputsystolicvalue"),
                        p('diastolic:'), verbatimTextOutput("inputdiastolicvalue"),
	      p('weight:'), verbatimTextOutput("inputweightvalue"),
                        p('height:'), verbatimTextOutput("inputheightvalue"),
	      p('estimated Average Glucose (eAG):'), verbatimTextOutput("inputeAG"),
                        h4(' ******Your Preliminary Health Evaluation Report ****************************** '),
	      tags$style(type='text/css', '#diagnostic_w {background-color: rgba(255,255,0,0.40); color: green;}'), 
                        tags$style(type='text/css', '#evaluation {background-color: rgba(255,255,0,0.40); color: green;}'),
 	      tags$style(type='text/css', '#diagnostic {background-color: rgba(255,255,0,0.40); color: green;}'), 
                        tags$style(type='text/css', '#estimation {background-color: rgba(255,255,0,0.40); color: green;}'),
	      tags$style(type='text/css', '#diag_fn {background-color: rgba(255,255,0,0.40); color: green;}'),
	      p('It means that your blood pressure is :'),strong(verbatimTextOutput("diagnostic")),
	      p('Your Body Mass Index (BMI) is:'), verbatimTextOutput("estimation"),
                        p('Based on BMI value, you are:'),strong(verbatimTextOutput("diagnostic_w")),
                        p('Your average daily blood sugar may correlate to A1C levels :'), verbatimTextOutput("evaluation"),
	      p('Based on A1C value, you are:'), strong(verbatimTextOutput("diag_fn"))
                                          
                )
	      
        )   
        
)
