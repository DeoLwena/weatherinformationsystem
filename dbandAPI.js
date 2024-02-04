// Import the temperature variable from weather.js
const temperature = require('./owm');
const mysql = require('mysql');




connection.query('SELECT region, Latitude, Longitude FROM destinatinon', (error, results) => {
    if (error) {
      console.error('Error querying database:', error);
      return;
    }

    for (let i = 0; i < results.length; i++) {
        const columnValue = results[i].your_column;
        if (columnValue == mkoa){
            const Lat = results[i].Latitude;
            const Lon = results[i].Longitude;
        }
      }
    });

