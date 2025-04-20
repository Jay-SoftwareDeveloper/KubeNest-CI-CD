from flask import Flask
app = Flask(__name__)

# Custom Flask route to verfy deployment
@app.route('/')
def hello():
    return 'Hi, this is Jayanths Flask microservice running on EKS'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)