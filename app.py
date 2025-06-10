from flask import Flask, request, send_from_directory
import os

app = Flask(__name__, static_folder='public')
TEXT_FILE = '/data/shared.txt'

@app.route('/')
def index():
    return send_from_directory('public', 'index.html')

@app.route('/text', methods=['GET'])
def get_text():
    try:
        with open(TEXT_FILE, 'r') as f:
            return f.read()
    except FileNotFoundError:
        return ''

@app.route('/send', methods=['POST'])
def send_text():
    text = request.form.get('text', '')
    with open(TEXT_FILE, 'w') as f:
        f.write(text)
    return '', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)