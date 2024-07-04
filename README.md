# Formula 1 Historical Data Analysis

## About

This project involves cleaning and analyzing a dataset of historical Formula 1 races using SQL. The dataset includes various attributes related to Formula 1 races, such as race dates, locations, winning drivers, vehicle manufacturers, and more. The primary objective is to clean the data, standardize formats, and perform analyses to gain insights into the performance trends in Formula 1 history.

## Purpose of the Project

The major aim of this project is to clean and analyze the Formula 1 historical data to understand trends in race performance, identify key factors affecting race outcomes, and provide insights for stakeholders in the Formula 1 industry.

## About the Data

The dataset used for this project includes the following columns:

| Column                  | Description                             | Data Type      |
| :---------------------- | :-------------------------------------- | :------------- |
| GRAND_PRIX            | Name of the Grand Prix            | VARCHAR(100)   |
| DATE                  | Date of the race         | DATE    |
| WINNER                    | Name of the winning drive              | VARCHAR(100)    |
| CAR           | Vehicle manufacturer              | VARCHAR(100)    |
| LAPS                  | Number of laps in a race  | INT  |
| TIME            | Total time of winning race      | VARCHAR(10)   |


## Analysis List

## Standardize Date Format

## Convert the race date to a standardized date format.
Performance Analysis

## Calculate average winning times over the decades.
## Determine the average number of races per year.
## Identify drivers and their win counts for specific manufacturers in given decades.
## Geographical Analysis

## Analyze the distribution of wins across different locations.
## Duplicate Removal

## Identify and remove duplicate records from the dataset if any.
## Approach Used

## Data Cleaning:
Standardize Date Formats: Ensure consistency in date formats.
Convert Time Values: Convert race times to a numeric format for analysis.
Duplicate Removal: Identify and remove duplicate records using Common Table Expressions (CTE).
Drop Unused Columns: Streamline the dataset by removing unnecessary columns.

## Analysis:
Average Winning Time: Calculate average winning times over the decades.
Races Per Year: Determine the average number of races held per year.
Wins by Manufacturer and Decade: Analyze wins for top manufacturers by decade.
Driver Performance: Identify drivers and their win counts for specific manufacturers in given decades.
Geographical Trends: Analyze the distribution of wins across different locations.
Conclusion

## This project involves cleaning and analyzing the historical Formula 1 dataset to provide insights into race performance trends. By standardizing data formats, converting race times, and analyzing various performance metrics, the dataset is prepared for detailed analysis to identify trends and patterns in Formula 1 races.

For more details, you can view the full SQL script file [HERE](https://github.com/Dilan-GitHub/F1_Analysis/blob/main/F1.sql)
