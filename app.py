from flask import Flask, jsonify
import os

app = Flask(__name__)

INSTANCE_ID = os.getenv("INSTANCE_ID", "unknown")

@app.route('/health', methods=['GET'])
def health():
    return jsonify({
        "status": "healthy",
        "instance_id": INSTANCE_ID
    })

@app.route('/process', methods=['GET'])
def process():
    return jsonify({
        "message": "Запрос в обработке",
        "instance_id": INSTANCE_ID
    })

if __name__ == '__main__':
    port = int(os.getenv("PORT", 5001))
    app.run(host="0.0.0.0", port=port)
