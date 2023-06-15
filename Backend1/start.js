// Importing https module
const https = require('https');

// Converting data in JSON format
const data = JSON.stringify({
	name: 'geeksforgeeks',
	job: 'Content Writer',
	topic:'Node.js'
});

// Setting the configuration for
// the request
const options = {
	hostname: 'reqres.in',
	path: '/api/users',
	method: 'POST'
};

// Sending the request
const req = https.request(options, (res) => {
	let data = '';

	res.on('data', (chunk) => {
		data += chunk;
	});

	// Ending the response
	res.on('end', () => {
		console.log('Body:', JSON.parse(data));
	});
	
}).on("error", (err) => {
	console.log("Error: ", err.message);
});

// Write data to request body
req.write(data);
req.end();
