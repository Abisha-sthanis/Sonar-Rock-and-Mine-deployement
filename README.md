# 🎯 Sonar Rock vs Mine Prediction – ML Deployment

This project trains a **Logistic Regression** model on the Sonar dataset to classify whether an object is a **Rock (R)** or a **Mine (M)**.  
The trained model is saved using **Pickle** and deployed with a **Flask backend** and simple **HTML frontend**.

---

## 📂 Project Structure
sonar_flask_project/
├── train_model.py # trains and saves model.pkl
├── app.py # Flask app (backend)
├── model.pkl # saved trained model
├── Copy of sonar data.csv # dataset (required)
└── templates/ # HTML pages
├── welcome.html # Page 1 – user info
├── input.html # Page 2 – enter sonar features
└── result.html # Page 3 – show prediction

yaml
Copy code

---

## ⚙️ Requirements
- Python 3.8+
- Flask
- Scikit-learn
- Pandas
- Numpy

Install dependencies:

```bash
pip install flask scikit-learn pandas numpy
🚀 How to Run
Clone the project / copy files into a folder.

Place the dataset file:

kotlin
Copy code
Copy of sonar data.csv
in the project root.

Train and save the model:

bash
Copy code
python train_model.py
This will create model.pkl.

Run the Flask app:

bash
Copy code
python app.py
Open browser and go to:

cpp
Copy code
http://127.0.0.1:5000/
🌐 App Pages
Welcome Page (welcome.html)
Collects simple user info (name, email) → button to proceed.

Input Page (input.html)
Enter 60 comma-separated features (Sonar dataset sample).
Example input (auto-filled in form):

Copy code
0.02,0.0371,0.0428,0.0207,0.0954,0.0986,0.1539,0.1601,0.3109,0.2111,...
Result Page (result.html)
Displays prediction result:

R → Rock

M → Mine

📊 Dataset Info
Source: Sonar dataset (UCI ML repository).

Features: 60 numeric sonar signal values.

Target:

R = Rock

M = Mine

🔮 Future Improvements
Add Bootstrap for better UI design.

Support CSV upload for batch predictions.

Deploy with Docker + Gunicorn for production.

Add model versioning and scaler saving.

