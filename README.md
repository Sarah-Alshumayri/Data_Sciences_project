# README for Sleep Health and Lifestyle Analysis Project


**Project Title:**
Sleep Disorder Analysis: Unveiling the Interplay Between Lifestyle, Health, and Sleep Quality

**Authors:**
- Sarah Alshumayri 
- Reema Abdallah 
- Yehya Asseri 
**Date:**
Fall 2023

##Overview
This project aims to explore and understand the intricate relationships between lifestyle choices, overall health, and the quality of sleep. Utilizing data analysis and predictive modeling, the project offers insights into how these factors interact and affect sleep disorders.


##Components of the Project
1. Sleep_health_and_lifestyle_dataset.csv
This dataset forms the backbone of the analysis and model training. It contains data related to individual's sleep patterns, lifestyle choices, and health parameters.

- Person ID: A unique identifier for each individual.
- Gender: The gender of the individual.
- Age: The age of the individual.
- Occupation: The occupation of the individual.
- Sleep Duration: The average duration of sleep per night (in hours).
- Quality of Sleep: A numerical rating of the quality of sleep.
- Physical Activity Level: A numerical measure of the individual's physical activity level.
-  Level: A numerical rating of the individual's stress level.
- BMI Category: Body Mass Index category (e.g., Overweight, Normal, Obese).
- Blood Pressure 1 & 2: Two different measures of blood pressure.
- Heart Rate: The individual's heart rate.
- Daily Steps: The average number of steps taken per day.
- Sleep Disorder: The type of sleep disorder, if any, diagnosed in the individual.
- BMI Levels: A numerical level associated with the BMI category.

2. Project.Rmd
An R Markdown document that details the analytical process, findings, and discussions around sleep health and lifestyle data. It includes comprehensive data analysis, visualizations, and interpretations.
3. App.R
A Shiny application developed in R for predicting sleep disorders. The app uses a trained model and allows users to input features such as age, gender, and sleep duration to predict the likelihood of sleep disorders.

##Requirements
- R Programming Language
- R Libraries: shiny, data.table, randomForest, and others as required in the scripts.
- RStudio (recommended for running Rmd and Shiny app)

##How to Use
1. Running the Analysis (Project.Rmd)

- Open Project.Rmd in RStudio.
- Install the required libraries.
- Run the Rmd file to view the analysis, or knit to PDF/HTML/Word to generate a report.
2. Using the Shiny App (App.R)

- Open App.R in RStudio.
- Ensure all required libraries and the trained model file (model_RF.rds) are available.
- Run the app to start the server, and interact with the UI to predict sleep disorders.

##Contact
For any queries or further information, please contact Samalshumayri`@effat`.edu.sa
