# Thyroid Disease Data Analysis

This repository includes SQL queries for analyzing and manipulating a thyroid disease dataset (thyroid_diff) with the goal of examining trends and connections within the data, with a particular emphasis on variables such as age, gender, smoking status, thyroid function, risk, recurrence, and pathology types.

## Objective

This project's goal is to:

- Improve clarity, clean up the data and change its names and types.
- Examine thyroid disease trends, such as the condition's prevalence in various age groups and genders.
- Examine any relationships that may exist between risk factors like thyroid function, smoking history, and disease recurrence.
- Determine and display the recurrence rates according to focality, thyroid function, and pathology.

## Database Structure

The thyroid_diff table contains the dataset utilized in this analysis. This table's important columns include:

- Age: The patient's age
- Gender: The patient's gender
- Smoking: Whether or not the patient smokes
- Hist_smoking: Smoking history
- Pathology Thyroid illness type
- Focality: The disease's focal point
- Thy_function: Status of thyroid function
- Risk: The patient's level of risk
- Recurred: Did the illness return following therapy?

## Source
The dataset used in this project is sourced from Kaggle: Thyroid Disease Dataset 

Source Link: https://www.kaggle.com/datasets/jainaru/thyroid-disease-data/data

Please check the Kaggle page for more details about the dataset, including data descriptions and licensing information.

## SQL Queries
Various SQL queries are arranged into sections within the repository:

### 1. Data Cleaning and Transformation
- Modifying the data types of columns.
- Columns are being renamed for clarity.

### 2. Descriptive Analysis
- Gender-based analysis: percentage of cases by gender.
- Age-based analysis: frequency of diagnoses by age group.
- Pathology-based analysis: most common pathologies, their average age, and percentage of the total dataset based on respective pathology.

### 3. Risk Factor Analysis
- Observing whethere there is a correlation between smoking habits and risk levels.
- Risk percentages based on smoking history (active smokers vs. non-smokers).
- Recurrence rates based on smoking status (active vs. have had a history of smoking).

### 4. Thyroid Function and Recurrence
- Analysis of recurrence rates based on thyroid function.
- Recurrence based on pathology and focality.
