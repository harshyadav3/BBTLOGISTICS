const express = require('express');
const mongoose = require('mongoose');

// Connect to MongoDB
mongoose.connect('mongodb://localhost/flutter_db', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Create a new schema and model
const userSchema = new mongoose.Schema({
  name: String,
  email: String,
});

const User = mongoose.model('User', userSchema);

// Create the Express app
const app = express();
app.use(express.json()); // Parse JSON request bodies

// Endpoint to get all users
app.get('/users', async (req, res) => {
  const users = await User.find();
  res.json(users);
});

// Endpoint to save a new user
app.post('/users', async (req, res) => {
  const { name, email } = req.body;
  const newUser = new User({ name, email });
  await newUser.save();
  res.json(newUser);
});

// Start the server
app.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});
