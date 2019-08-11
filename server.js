/*
 * Primary Application - Core API
 * Starting Server End Point : server.js
 * 
 */

const express = require('express');
const app = express();
const port = 3201;

app.get('/', (req, res) => {
    res.send('Sabza Client Frontend Server ');
});

app.get('/hello', (req, res) => {
    res.send('World');
});

app.listen(port);
console.log('Sabza Core API Application Server started on port ' + port)
