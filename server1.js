const http = require('http');
const fs = require('fs');
const mysql = require('mysql');
const pug = require('pug');

// Reading Pug template files asynchronously
const templatePath = './views/New folder/index.pug';
fs.readFile(templatePath, 'utf8', (err, template) => {
    if (err) {
        console.error('Error reading template file:', err);
        return;
    }
    startServer(template);
});

function startServer(template) {
    const server = http.createServer((req, res) => {
        res.setHeader('Content-Type', 'text/html');

        // Render Pug template
        const html = pug.render(template);

        // Send to client
        res.end(html);
    });

    // MySQL connection setup
    const connection = mysql.createConnection({
        host: '127.0.0.1',
        user: 'root',
        password: '',
        database: 'weatherinformationsystem'
    });

    connection.connect((err) => {
        if (err) {
            console.error('Error connecting to database:', err);
            return;
        }
        console.log('Connected to database');
    });


    

    // Start HTTP server
    server.listen(3000, 'localhost', () => {
        console.log('Server listening on port 3000');
    });
}
