const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require("body-parser")

// Create Express app
const app = express();

// Connect to MongoDB Atlas
mongoose.connect('mongodb+srv://vikas:vikas@cluster0.07wtzrc.mongodb.net/db2?retryWrites=true&w=majority', {
  useNewUrlParser: true,
  useUnifiedTopology: true
})
  .then(() => console.log('Connected to MongoDB Atlas'))
  .catch(err => console.error('Failed to connect to MongoDB Atlas', err));

// Define a schema for your data
const exampleSchema = new mongoose.Schema({
  id : String , 
  name: String,
  email: String
});

// Create a model based on the schema
const ExampleModel = mongoose.model('Example', exampleSchema);

// Define a route for the GET request
app.get('/example', async (req, res) => {
  try {
    // Retrieve data from MongoDB
    const data = await ExampleModel.find();
    res.json(data);
  } catch (err) {
    console.error('Failed to retrieve data from MongoDB', err);
    res.status(500).json({ error: 'Failed to retrieve data' });
  }
});



// Start the server
const port = 8080;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});


app.post('/send', (req, res) => {
    const { id}= req.body.id;
    console.log(id)
    
    //const { id,name, email } = req.body;
  
    // Create a new data object
    const newData = new exampleSchema({ id,name, email });
   

    // Save the new data object to the database
    newData.save()
      .then(() => {
        res.status(201).json({ message: 'Data created successfully' });
      })
      .catch(err => {
        res.status(500).json({ error: err.message });
      });
  });



  app.post("/html", function(req, res) {
    var num1 = Number(req.body.num1);
    var num2 = Number(req.body.num2);
      
    var result = num1 + num2 ;
      
    res.send("Addition - " + result);
  });




  app.post('/post', (req, res) => {
    
      

  });
  
app.post('/books',(req,res)=>
{
    

})