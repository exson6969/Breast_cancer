from flask import Flask,request, jsonify
from flask_cors import CORS
import pickle

app = Flask(__name__)
CORS(app)

model = pickle.load(open('Breast_cancer_model.sav', 'rb'))

cols = ['mean,radius','mean,texture','mean,perimeter','mean,area'
,'mean,smoothness','mean,compactness','mean,concavity'
,'mean,concave,points','mean,symmetry','mean,fractal,dimension'
,'radius,error','texture,error','perimeter,error','area,error'
,'smoothness,error','compactness,error','concavity,error'
,'concave,points,error','symmetry,error','fractal,dimension,error'
,'worst,radius','worst,texture','worst,perimeter','worst,area'
,'worst,smoothness','worst,compactness','worst,concavity'
,'worst,concave,points','worst,symmetry','worst,fractal,dimension']

@app.route('/predict_api',methods=['POST'])
def predict_api():
    data = request.json
    prediction = model.predict(data['data'])
    return jsonify({'output':str(prediction[0])})

if __name__ == '__main__':
    app.run()