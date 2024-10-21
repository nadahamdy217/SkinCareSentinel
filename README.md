# DEPI-Graduation-Project
### Data Engineering ALX1_AIS4_S1e

# Skincare Product Sentiment Analysis System 🧴✨

### Team Members:
- Nada Hamdy Fatehy Abedelsalam
- Toqa Mohsen
- Shahd Ammar
- Omar Salah
- Yousef Magdy

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)](https://github.com/nadahamdy217/DEPI-Graduation-Project/tree/main) 
[![Python Version](https://img.shields.io/badge/python-3.12%2B-blue)](https://www.python.org/downloads/release/python-3120/)


## Project Overview

This project is a collaborative effort aimed at analyzing customer feedback for skincare products and predicting the sentiment (positive or negative) for each review using an **unsupervised model**. The system includes a **web application** where users can input reviews and get real-time sentiment predictions based on a **pre-trained unsupervised model** for sentiment analysis.

### Key Features
- 📊 **Sentiment analysis** for skincare product reviews using an unsupervised model.
- 🌐 **Web application** for real-time sentiment predictions.
- ⚡ **ETL pipeline** built using **Azure Data Factory**, **Azure Databricks**, and **Azure Synapse Analytics**.
- 🚀 **Optimized for large-scale data processing** with Azure services.

## Tech Stack

- **Azure Data Factory** for ETL orchestration
- **Azure Databricks** for data processing
- **Azure Synapse Analytics** for data storage and analysis
- **Unsupervised model** for sentiment analysis
- **Flask** for the web application

## Table of Contents
1. [Setup](#setup)
2. [ETL Pipeline](#etl-pipeline)
3. [Model Details](#model-details)
4. [Website](#website)
5. [Power BI Dashboard](#power-bi-dashboard)
6. [Contributing](#contributing)
7. [License](#license)

## Setup

### Prerequisites

- Python 3.12 or higher
- Azure Subscription (can be student subscription)
- Access to Azure Data Factory, Databricks, and Synapse Analytics
- Flask for running the web app


## Repository Access
   - Ensure all team members have access to the shared repository.
   - Collaborate using branches for feature development.
   
## ETL Pipeline

The ETL pipeline is designed to handle large volumes of customer feedback data:

- **Azure Data Factory**: Ingests raw review data from various sources.

![Azure Data Factory](https://github.com/user-attachments/assets/6e6c7f1d-ce0f-4f19-9f39-666fc11f2c92)

- **Azure Databricks**: Processes and cleans the data using predefined transformations.

![Databricks](https://github.com/user-attachments/assets/270773ab-4691-48cf-a456-a7fdab72cfe1)

- **Azure Synapse Analytics**: Stores processed data for analysis and visualization in **Power BI**.

![Synapse](https://github.com/user-attachments/assets/7d0568b5-3bc2-4e7a-8b35-597a84e697db)


## Model Details

This project leverages a **pre-trained unsupervised sentiment analysis model** to classify product reviews as **positive** or **negative**. The model is used in the web app for internal real-time predictions but is not designed for API usage or external requests.

## Website

The web application allows users to submit product reviews and instantly receive sentiment predictions based on the unsupervised model.

![image](https://github.com/user-attachments/assets/3c64e3d7-794f-44ea-bd72-844f6de2af3d)


### Key Features:
- Simple and intuitive interface for entering product reviews.
- Displays the predicted sentiment of the review.
- Deployed using **Flask**.

## Power BI Dashboard

A **Power BI dashboard** is used for advanced data visualization and analysis, allowing users to explore trends in review data:

- **Sentiment distribution** for skincare products.
- **Top-rated products** based on customer feedback.
- **Time-based analysis** of reviews.

- ### Dashboard Preview

![Dashboard](https://github.com/user-attachments/assets/85689f57-60cc-4cfd-8fd6-d44d09f32805)

## Documentation

- All the details are recorded here [Google Docs](https://docs.google.com/document/d/1le43WPQ_EMTB1sGkLuMi0PLx4spRrAn3YTNdpiX-V2o/edit?usp=sharing)

## Technologies Used

- *Python*: Backend logic and machine learning model.
- *Flask*: Web framework for building the backend API.
- *HTML/CSS/JavaScript*: Frontend interface.
- *Azure*: Azure Blob Storage and Azure App Service for deployment.

## Contributing

This is a collaborative project. To contribute:

1. Work on your feature or bug fix in a separate branch.
2. Ensure your changes are tested and reviewed by another team member.
3. Submit a pull request when your work is ready for review.
