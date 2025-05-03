from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def home():
    return '''
        <form action="/hello" method="POST">
            <input name="name">
            <input type="submit">
        </form>
    '''

@app.route('/hello', methods=['POST'])
def hello():
    name = request.form['name']
    return f"Hello, {name}! update"

if __name__ == '__main__':
    app.run(debug=True)
#