from flask import Flask, request, jsonify, render_template
import joblib
import pandas as pd
from textblob import TextBlob
import numpy as np

# Initialize Flask app
app = Flask(__name__)

# Load your models and vectorizer
model = joblib.load(r'C:\Users\DELL\Downloads\flask_app\decision_tree_model2.pkl')  # Replace with your model filename
tfidf_vectorizer = joblib.load(r'C:\Users\DELL\Downloads\flask_app\tfidf_vectorizer2.pkl')  # Replace with your vectorizer filename

# Load your CSV data into a DataFrame
df = pd.read_csv("https://sephorastorageaccount.blob.core.windows.net/combineddata/combined_data.csv?sp=racwdymeop&st=2024-10-17T03:52:28Z&se=2024-10-25T11:52:28Z&sv=2022-11-02&sr=b&sig=KAsxUadbjHpS88Boj5BKz1iv6ZFmJLuR%2B4k1KdxmoVk%3D")

# Function to calculate sentiment scores using TextBlob
def calculate_sentiment(text):
    blob = TextBlob(text)
    return blob.sentiment.polarity

@app.route('/')
def index():
    return render_template('main.html')

@app.route('/comment-analysis.html')
def comment_analysis():
    return render_template('comment-analysis.html')

@app.route('/search.html')
def search():
    return render_template('search.html')

@app.route('/predict', methods=['POST'])
def predict():
    review = request.form['review']
    
    # Calculate sentiment score
    sentiment_score = calculate_sentiment(review)
    
    # Vectorize the review using the fitted TF-IDF Vectorizer
    review_tfidf = tfidf_vectorizer.transform([review])
    
    # Predict rating
    pred_rating = model.predict(review_tfidf)
    
    # Adjust prediction based on sentiment
    pred_rating_adjusted = pred_rating + (pred_rating * sentiment_score)
    
    # Clip the prediction to ensure it's within the valid range of 0 to 10
    pred_rating_clipped = np.clip(pred_rating_adjusted, 0, 10)
    
    # Round the adjusted prediction
    pred_rating_rounded = np.round(pred_rating_clipped)
    
    return render_template('comment-analysis.html', sentiment=f'Predicted Rating: {pred_rating_rounded[0]}')

@app.route('/search', methods=['POST'])
def search_product():
    try:
        data = request.json
        product_name = data.get('product_name')

        # Filter the DataFrame based on the product name
        results = df[df['product_name_data1'].str.contains(product_name, case=False, na=False)]

        # Group by brand_name_data1 to get unique brands and their first occurrence of ratings
        unique_brands = results.groupby('brand_name_data1').first().reset_index()

        # Select only the necessary fields for the response
        response_data = unique_brands[['product_name_data1', 'brand_name_data1', 'price_usd_data1', 'rating']].to_dict(orient='records')

        return jsonify(response_data)
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == "__main__":
    app.run(debug=True)  # Set to False for production
