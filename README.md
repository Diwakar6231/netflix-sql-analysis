<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg" alt="Netflix Logo" width="250"/>
  <h1>Netflix Content Catalog Analysis</h1>
</div>

## 📖 Project Overview
This project performs a comprehensive, end-to-end SQL analysis on a Netflix Movies and TV Shows dataset. The objective is to demonstrate proficiency in data retrieval, cleaning, aggregation, and advanced analytics (CTEs and Window Functions) to uncover actionable business insights regarding content distribution, catalog growth, and audience targeting.

## 💡 Key Business Insights
Through structured SQL analysis, the following trends were identified:
1. **Content Mix:** Movies dominate the catalog, significantly outnumbering TV Shows.
2. **Global Reach:** The United States, India, and the UK are the top content-producing regions, highlighting Netflix's global acquisition strategy.
3. **Audience Targeting:** "TV-MA" is the most frequent rating, indicating a strategic focus on mature, premium original content.
4. **Content Pacing:** The average movie runtime sits around 90-120 minutes, with a distinct categorization of "Short", "Standard", and "Long" form content.

## 🛠️ Tech Stack & Tools
* **Database:** PostgreSQL (Syntax compatible with MySQL/SQL Server with minor adjustments)
* **Language:** SQL (Aggregations, String Manipulation, `CASE` logic, CTEs, Window Functions)
* **Dataset:** Adapted from the [Netflix Movies and TV Shows (Kaggle)](https://www.kaggle.com/datasets/shivamb/netflix-shows)

## 📂 Project Structure
* `schema.sql`: Creates the `netflix_catalog` table and populates it with robust sample data for immediate, error-free testing.
* `queries.sql`: A comprehensive, 5-level SQL masterclass progressing from basic `SELECT` statements to advanced `RANK()` and `ROW_NUMBER()` window functions.

## 🚀 How to Run This Project
1. Clone or download this repository.
2. Open your preferred SQL environment (e.g., pgAdmin, DBeaver, MySQL Workbench).
3. Execute `schema.sql` to build the table and load the sample dataset.
4. Execute `queries.sql` sequentially to walk through the 5 levels of data analysis.

---
<div align="center">
  <strong>Created by:</strong> [Diwakar] <br>
  <strong>Connect with me:</strong> 
  <a href="YOUR_LINKEDIN_URL">inkedin.com/in/diwakar2000</a> | 
</div>
