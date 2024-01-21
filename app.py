from flask import Flask, jsonify
from flask_cors import CORS


import datetime
import requests
import socket
import os

app = Flask(__name__)

CORS(app) 


WEATHER_API_KEY = os.getenv('WEATHER_API_KEY')

print(WEATHER_API_KEY)


# Hello endpoint
@app.route('/api/hello')
def hello():
    print("Request received for /api/hello")
    hostname = socket.gethostname()
    current_datetime = datetime.datetime.now().strftime("%y%m%d%H%M")
    version = "1.0"

    # print(WEATHER_API_KEY)
    # Get weather data for Dhaka from OpenWeatherMap (replace with your API key)
    weather_response = requests.get('http://api.openweathermap.org/data/2.5/weather', params={'q': 'Dhaka', 'appid': WEATHER_API_KEY})
    
    print("Weather API response:", weather_response.text)
    
    weather_data = weather_response.json()
    
    temperature = float(weather_data['main']['temp']) - 273.15

    
    response = {
        "hostname": hostname,
        "datetime": current_datetime,
        "version": version,
        "weather": {
            "dhaka": {
                "temperature": temperature,
                "temp_unit": "c"
            }
        }
    }
    
    return jsonify(response)


@app.route('/health')
def health_check():
    return "OK"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')