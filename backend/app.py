from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/submit', methods=['POST'])
def submit():
    data = request.json
    # Just print for testing in logs
    print(f"Received data: {data}")
    return jsonify({
        "success": True,
        "message": "Form submitted successfully",
        "received_data": data
    })
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

