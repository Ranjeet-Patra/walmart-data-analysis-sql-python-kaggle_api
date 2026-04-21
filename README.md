# walmart-data-analysis-sql-python-kaggle_api
End-to-end Walmart sales data analysis using Python and MySQL

## 📌 Project Overview
1. This project is an end-to-end data analysis solution built to extract actionable insights from Walmart sales data.
2. It leverages Python for data processing and MySQL for analytical querying.

## ⚙️ Tech Stack
1. Python (Pandas, NumPy, SQLAlchemy)
2. MySQL
3. Jupyter Notebook
4. VS Code

## 🧰 Tools & Data Source
1. Kaggle API (for dataset download)
2. Walmart Sales Dataset (via Kaggle)

## 🛠️ Environment Setup (VS Code)
1. Created a project folder and opened it in VS Code
2. Initialized a virtual environment:
   `python -m venv my_env1`
3. Activated environment:
   `source my_env1/Scripts/activate`
4. Installed required packages:
   `pip install pandas numpy sqlalchemy mysql-connector-python ipykernel`
5. Configured Jupyter Notebook using the virtual environment

## 🔐 Kaggle API Setup
1. Generated API token from Kaggle:
   `Profile → Settings → API → Create New Token`
2. Placed kaggle.json in:
   `C:\Users\YourUsername\.kaggle`
3. Installed Kaggle library:
   `pip install kaggle`

## 📥 Data Acquisition

1. Dataset downloaded using Kaggle API:

  `kaggle datasets download -d najir0123/walmart-10k-sales-datasets`

2. Unzipped dataset:

  `unzip walmart-10k-sales-datasets.zip`

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
1. Dataset is not included in this repository.
2. Please download it using Kaggle API.

## 🔮 Future Improvements
1. Integration with Power BI dashboard
2. Automated ETL pipeline
