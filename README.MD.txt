# 🚦 Road Accident Data Analysis using SQL

## 📊 Project Overview

This project focuses on analyzing Road Accident data using SQL. The goal is to extract meaningful insights, identify accident patterns, and recommend safety improvements using SQL queries, including aggregation, date functions, window functions, and CASE statements.

---

## 🗂 Dataset Description

The project uses two tables:

### 1️⃣ ROAD_ACCIDENTS

| Column Name    | Description                          |
|----------------|---------------------------------------|
| Accident_ID    | Unique Accident ID                   |
| Accident_Date  | Date of Accident                     |
| Location       | Accident Location                    |
| Severity       | Accident Severity (Minor, Severe, Fatal) |
| Casualties     | Number of Casualties                 |
| Vehicle_Count  | Number of Vehicles Involved          |
| Weather        | Weather Condition                    |
| Reason         | Cause of Accident                    |

### 2️⃣ VEHICLE_INFO

| Column Name    | Description                          |
|----------------|---------------------------------------|
| Vehicle_ID     | Unique Vehicle ID                    |
| Accident_ID    | Linked Accident ID                   |
| Vehicle_Type   | Type of Vehicle                      |
| Driver_Age     | Age of Driver                        |
| Driver_Alcohol | Alcohol Involvement (Yes/No)         |

---

## 🔧 SQL Techniques Used

- Aggregate Functions (COUNT, SUM, AVG)
- GROUP BY and HAVING clauses
- Date Functions (EXTRACT, TO_CHAR)
- CASE Statements (Severity Classification)
- Window Functions (ROW_NUMBER, COUNT OVER)

---

## 🔎 Problem Statements Solved

1️⃣ Find total number of fatal accidents  
2️⃣ Count accidents happened in year 2024  
3️⃣ Severity-wise summary of total accidents, casualties, and vehicles involved  
4️⃣ Calculate percentage of accidents by severity  
5️⃣ Weekday on which most accidents occurred  
6️⃣ Severity classification using CASE statements (Risk Levels)  
7️⃣ Running total of accidents using Window Function  
8️⃣ Reason-wise accident count with HAVING clause

---Conclusion Slide Text
Through this SQL-based Road Accident Data Analysis, we successfully extracted meaningful insights from the dataset using:

*Sunday recorded the highest number of accidents, indicating possible weekend risk factors such as increased travel and leisure driving.

*Foggy weather was identified as a major environmental factor contributing to accidents, highlighting the role of poor visibility in accident occurrence.
