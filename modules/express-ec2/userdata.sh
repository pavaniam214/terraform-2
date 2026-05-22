#!/bin/bash

yum update -y

curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -

yum install nodejs -y

mkdir -p /home/ec2-user/express-app

cd /home/ec2-user/express-app

npm init -y

npm install express

cat <<EOF > server.js
const express = require('express')

const app = express()

app.get('/', (req, res) => {

    res.send(`
        <h1>Cloud Institution Login - Express Frontend</h1>

        <form>
            Username:<br>
            <input type="text"><br><br>

            Password:<br>
            <input type="password"><br><br>

            <button>Login</button>
        </form>
    `)
})

app.listen(3000, '0.0.0.0', () => {
    console.log('Server running on port 3000')
})
EOF

nohup node server.js > express.log 2>&1 &