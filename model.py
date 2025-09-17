import pandas as pd
import pickle
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score


# load data (ensure CSV file is in same folder or provide path)
sonardata = pd.read_csv('E:/abisub/Copy of sonar data.csv')


X = sonardata.drop(columns='R', axis=1)
y = sonardata['R']


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=2)


# instantiate model (solver chosen for small dataset)
model = LogisticRegression(max_iter=1000, solver='liblinear')
model.fit(X_train, y_train)


# evaluate
preds = model.predict(X_test)
acc = accuracy_score(y_test, preds)
print(f"Test accuracy: {acc:.4f}")


# save model
with open('model.pkl', 'wb') as f:
    pickle.dump(model, f)



print('Model saved to model.pkl')