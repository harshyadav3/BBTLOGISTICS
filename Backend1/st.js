// Importing the axios module
const axios = require('axios');
  
// Data to be sent
const data = {
    name: 'geeksforgeeks',
    job: 'Content Writer',
    topic: 'Node.js'
};
console.log("hi")

const addUser = async () => {
    try {
    console.log("hello")
        // Making post request 
        const res = await axios.post(
                'https://localhost:8080/answer', data);
  
        // Printing the response data   
        console.log('Body: ', res.data);
    } catch (err) {
  
        // Printing the error
        console.error(err.Message);
    }
};