✈️ Travel Recommendation Expert System

A Prolog + Python + Gradio Based AI Travel Suggestion App

🌍 Overview

This project is an AI-powered travel recommendation system built using:

Prolog (Knowledge Base & Scoring Logic)

Python (pyswip) (Connecting Python ↔ Prolog)

Gradio UI (Clean, interactive web interface)

Users can choose:

Budget

Season

Trip Type

Number of Days

Preferred Activities

The system compares user preferences with 10 destinations and calculates a matching score for each place.
The TOP destinations are displayed based on the highest score.

🎯 Features

✔ Knowledge-Based AI using Prolog
✔ Real-time Travel Recommendations
✔ Easy-to-use UI (Gradio)
✔ Score-based ranking
✔ Multi-parameter filtering (budget, season, type, activities, days)
✔ Fully customizable knowledge base

🧠 How it Works

The travel logic is stored in travel_kb.pl, which contains:

Destinations

Attributes

Matching rules

Scoring system

Python (pyswip) sends user inputs into Prolog and receives the best travel destinations.
📁 Project Structure
travel-recommendation-app/
│
├── app.py               # Main application (Gradio UI + Prolog connection)
├── travel_kb.pl         # Prolog knowledge base
└── requirements.txt     # Python dependencies
🚀 Running the Project (Google Colab Recommended)
1. Clone the GitHub Repo
!git clone https://github.com/ankush9911/travel-recommendation-app.git

2. Install Dependencies
!apt-get install -y swi-prolog
!pip install gradio pyswip

3. Run the App
%cd travel-recommendation-app
!python app.py


You’ll get a link like:

Running on public URL: https://xxxxxx.gradio.live


Click it → Your Travel App opens!

🖥️ Running Locally (Windows/Mac/Linux)
1. Install SWI-Prolog

Download from:
👉 https://www.swi-prolog.org/download/stable

2. Clone the repo
git clone https://github.com/ankush9911/travel-recommendation-app.git
cd travel-recommendation-app

3. Install dependencies
pip install -r requirements.txt

4. Run
python app.py


📝 Technologies Used

Python 3

Gradio

SWI-Prolog

pyswip (Python–Prolog bridge)







