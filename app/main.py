import logging
from flask import Flask

logging.basicConfig(level=logging.INFO)
app = Flask(__name__)


@app.route("/")
def hello():
    return "<h1 style='color:blue'>Hello World from Flask & Gunicorn!</h1>"


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
