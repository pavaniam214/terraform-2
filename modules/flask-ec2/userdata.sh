#!/bin/bash

yum update -y

yum install python3 -y

python3 -m pip install flask

mkdir -p /home/ec2-user/flask-app

cd /home/ec2-user/flask-app

cat <<EOF > app.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def login():
    return '''
    <h1>Cloud Institution Login - Flask Backend</h1>

    <form>
      Username:<br>
      <input type="text"><br><br>

      Password:<br>
      <input type="password"><br><br>

      <button>Login</button>
    </form>
    '''
    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

nohup python3 app.py > flask.log 2>&1 &