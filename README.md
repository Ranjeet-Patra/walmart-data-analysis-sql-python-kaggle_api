# walmart-data-analysis-sql-python-kaggle_api
End-to-end Walmart sales data analysis using Python and MySQL

## 📌 Project Overview
This project is an end-to-end data analysis solution built to extract actionable insights from Walmart sales data.
It leverages Python for data processing and MySQL for analytical querying.

## ⚙️ Tech Stack
Python (Pandas, NumPy, SQLAlchemy)
MySQL
Jupyter Notebook
VS Code

## 🧰 Tools & Data Source
Kaggle API (for dataset download)
Walmart Sales Dataset (via Kaggle)

## 🛠️ Environment Setup (VS Code)
Created a project folder and opened it in VS Code
Initialized a virtual environment:
python -m venv my_env1
Activated environment:
source my_env1/Scripts/activate
Installed required packages:
pip install pandas numpy sqlalchemy mysql-connector-python ipykernel
Configured Jupyter Notebook using the virtual environment

## 🔐 Kaggle API Setup
Generated API token from Kaggle:
Profile → Settings → API → Create New Token
Placed kaggle.json in:
C:\Users\YourUsername\.kaggle
Installed Kaggle library:
pip install kaggle

## 📥 Data Acquisition

Dataset downloaded using Kaggle API:

kaggle datasets download -d najir0123/walmart-10k-sales-datasets

Unzipped dataset:

unzip walmart-10k-sales-datasets.zip

## 🔄 Project Workflow
1. Data loaded using Pandas
2. Data cleaned and preprocessed
3. Feature engineering applied
4. Data exported to MySQL
5. SQL queries executed to generate insights
   
## 📂 Project Structure
|-- notebooks/     # Python analysis
|-- sql/           # SQL queries
|-- README.md

## 📊 Key Insights
1. Identified top-performing branches
2. Found best-selling product categories
3. Analyzed customer payment behavior
4. Identified peak sales hours
   
## ⚠️ Dataset
Dataset is not included in this repository.
Please download it using Kaggle API.

## 🔮 Future Improvements
Integration with Power BI dashboard
Automated ETL pipeline
