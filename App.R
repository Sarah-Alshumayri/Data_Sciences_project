# Import libraries
library(shiny)
library(data.table)
library(randomForest)

# Load the trained model
model <- readRDS("model_RF.rds")

#user interface

# Define the UI
ui <- fluidPage(
  titlePanel("Sleep Disorder Prediction"),
  sidebarLayout(
    sidebarPanel(
      # Add input fields for features used in your model
      numericInput("age", "Age:", value = 30),
      selectInput("gender", "Gender:", choices = c("Female", "Male")),
      numericInput("sleep_duration", "Sleep Duration (in hours):", value = 7),
      numericInput("quality_of_sleep", "Quality of Sleep (scale 1-10):", value = 4, min = 1, max = 10, step = 1),
      numericInput("stress_level", "Stress Level (scale 1-10):", value = 3, min = 1, max = 10, step = 1),
      numericInput("physical_activity_level", "Physical Activity Level (scale 30-90):", value = 30, min = 30, max = 90,),
      numericInput("bmi_levels", "BMI Levels:(1)Normal, (2) Overweight, (3) Obese", value = 1),
      numericInput("daily_steps", "Daily Steps:", value = 5000),
      numericInput("blood_pressure_1", "Blood Pressure 1:", value = 120),
      numericInput("blood_pressure_2", "Blood Pressure 2:", value = 80),
      
      actionButton("predict", "Predict")
    ),
    mainPanel(
      tags$label(h3("Prediction Output")),
      textOutput("contents"),
      tableOutput("tabledata")
    )
  )
)

# Define the server function
server <- function(input, output) {
  # Reactive function to perform prediction
  datasetInput <- reactive({
    Age <- input$age
    Gender <- input$gender
    Sleep.Duration <- input$sleep_duration
    Quality.of.Sleep <- input$quality_of_sleep
    Stress.Level <- input$stress_level
    Physical.Activity.Level <- input$physical_activity_level
    BMI.Levels <- input$bmi_levels
    Daily.Steps <- input$daily_steps
    Blood.Pressure.1 <- input$blood_pressure_1
    Blood.Pressure.2 <- input$blood_pressure_2
    
    # Create a data frame for prediction
    test <- data.frame(
      Age = Age,
      Gender = Gender,
      Sleep.Duration = Sleep.Duration,
      Quality.of.Sleep = Quality.of.Sleep,
      Stress.Level = Stress.Level,
      Physical.Activity.Level = Physical.Activity.Level,
      BMI.Levels = BMI.Levels,
      Daily.Steps = Daily.Steps,
      Blood.Pressure.1 = Blood.Pressure.1,
      Blood.Pressure.2 = Blood.Pressure.2
    )
    print(str(test))
    
    # Perform prediction
    Prediction <- predict(model, test)
    
    # Calculate probabilities
    Probability <- predict(model, test, type = "prob")
    
    # Create a data frame to display results
    Output <- data.frame(
      Prediction = Prediction,
      Probability = Probability * 100
    )
    print(Prediction)
    
    return(Output)
  })
  
  # Display a message when the prediction button is clicked
  output$contents <- renderPrint({
    if (input$predict > 0) {
      "Calculation Completed"
    } else {
      "Our model is ready to predict"
    }
  })
  
  # Display the prediction results in a table
  output$tabledata <- renderTable({
    if (input$predict > 0) {
      datasetInput()
    }
  })
}

# Create the shiny app
shinyApp(ui = ui, server = server)
