const https = require('https');
const apiKey = '86c5dbaa2d572ca7e1bca2b3c848aca4';
const latitude = -6.776012; // Replace with your latitude
const longitude = 39.178326; // Replace with your longitude

const url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}`;


// Declare temperature as a global variable
let temperature;

https.get(url, (response) => {
  let data = '';

  response.on('data', (chunk) => {
    data += chunk;
  });

  response.on('end', () => {
    try {
      const parsedData = JSON.parse(data);
      temperature = parsedData.main.temp; // Assign value to the global variable

      console.log('Temperature:', temperature);
    } catch (error) {
      console.error('Error fetching weather data:', error);
    }
  });

}).on('error', (error) => {
  console.error('Error:', error);
});

