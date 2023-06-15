// Import required modules
const express = require('express');
const mongoose = require('mongoose');

// Create an instance of the express application
const app = express();

// Set up the MongoDB connection
const mongoURI = 'mongodb+srv://vikas:vikas@cluster0.07wtzrc.mongodb.net/db?retryWrites=true&w=majority';
mongoose.connect(mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to MongoDB Atlas');
  })
  .catch((error) => {
    console.log('Error connecting to MongoDB Atlas:', error);
  });

// Create a schema for your data
const dataSchema = new mongoose.Schema({
  name: String,
  age: Number,
});

// Create a model based on the schema
const Data = mongoose.model('Data', dataSchema);

// Define a route to handle POST requests to add data
app.post('/data', (req, res) => {
  // Extract the data from the request body
  const { name, age } = req.body;

  // Create a new instance of the Data model
  const newData = new Data({ name, age });

  // Save the new data to the database
  newData.save()
    .then(() => {
      res.status(201).json({ message: 'Data inserted successfully' });
    })
    .catch((error) => {
      res.status(500).json({ error: 'Failed to insert data' });
    });
});

// Start the server
app.listen(8080, () => {
  console.log('Server started on port 3000');
});
