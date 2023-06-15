const express = require('express');
const mongoose = require('mongoose');
const cors = require("cors");


// Connect to MongoDB
mongoose.connect('mongodb+srv://vikas:vikas@cluster0.07wtzrc.mongodb.net/db2?retryWrites=true&w=majority', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Create a new schema and model
const BuyerSchema = new mongoose.Schema({
  name: String,
  email: String,
  phoneNumber : String,
  address:  String,
  dateofbirth : String,
});


// Create a new schema and model
const TruckSchema = new mongoose.Schema({
  TruckCompanyName: String,
  TruckDriverName: String,
  TruckDriverPhoneNumber : String,
  TruckNumber : String,
  TruckCapacity:  String,
  TruckLocation : String,
  TruckDestination : String,
  TruckPrice : String ,
  TruckImageURL : String ,

});

const ShipmentSchema = new mongoose.Schema({
  GoodsType   :  String,
  sourcecity  : String,
  supplieraddress  : String,
  destinationcity  :  String,
  destinationaddress  : String,
  loaddate : String ,
});



const SupplierSchema = new mongoose.Schema({
  companyname: String,
  companyemail: String,
  regid : String,
  address:  String,

  FoundingYear : String,
});


const TruckOwnerSchema = new mongoose.Schema({
  name: String,
  email: String,
  phoneNumber : String,
  address : String,
  nooftruck : String,
  yearofpurchase : String,

  truckcompanyname : String,
  dob : String,

});



const TransportationSchema = new mongoose.Schema({
  name: String,
  email: String,
  phoneNumber : String,
  address : String,
  dob : String,

});



const Buyer = mongoose.model('Buyer', BuyerSchema);
const Supplier = mongoose.model('Supplier',SupplierSchema);
const Truckowner = mongoose.model('TruckOwner',TruckOwnerSchema);
const Transportation = mongoose.model('Transportation',TransportationSchema);
const Shipment = mongoose.model('Shipment',ShipmentSchema);
const Truck = mongoose.model('Truck',TruckSchema);




// Create the Express app
const app = express();
app.use(express.json()); // Parse JSON request bodies
app.use(cors());
// Endpoint to get all users
app.get('/getallbuyers', async (req, res) => {
  const buyers = await Buyer.find();
  res.json(buyers);
});

// Endpoint to save a new user
app.post('/buyer', async (req, res) => {
  const { name, email,phoneNumber, address,dateofbirth } = req.body;
  const newBuyer= new Buyer({ name, email,phoneNumber, address,dateofbirth });
  await newBuyer.save();
  
  res.json(newBuyer);
});



app.post('/supplier', async (req, res) => {
  const { companyname, companyemail, regid, address, FoundingYear } = req.body;
  const newSupplier = new Supplier({ companyname, companyemail, regid, address, FoundingYear});
  await newSupplier.save();
  
  res.json(newSupplier);
});

app.get('/getallsuppliers', async (req, res) => {
  const suppliers = await Supplier.find();
  res.json(suppliers);
});



app.post('/truckowner', async (req, res) => {
  const { name, email, phoneNumber , address, nooftruck , yearofpurchase , truckcompanyname , dob  } = req.body;
  const newTruckowner = new Truckowner({ name, email, phoneNumber, address,nooftruck , yearofpurchase , truckcompanyname , dob });
  await newTruckowner.save();
  
  res.json(newTruckowner);
});





app.get('/getallTruckOwners', async (req, res) => {
  const transportation1 = await Truckowner.find();
  res.json(transportation1);
});




app.post('/transport', async (req, res) => {
  const { name, email, phoneNumber , address, dob  } = req.body;
  const newTransport= new Transportation({ name, email, phoneNumber, address, dob });
  await newTransport.save();
  
  res.json(newTransport);
});



app.get('/getallTransportation', async (req, res) => {
  const transport= await Transportation.find();
  res.json(transport);
});





app.post('/shipment', async (req, res) => {
  const {  GoodsType , sourcecity ,supplieraddress  , destinationcity  , destinationaddress ,loaddate  } = req.body;
  const newShipment= new Shipment({ GoodsType , sourcecity ,supplieraddress  , destinationcity  , destinationaddress ,loaddate  });
  await newShipment.save();
  
  res.json(newShipment);
});


app.get('/getallshipmentdetails', async (req, res) => {
  const shipment= await Shipment.find();
  res.json(shipment);
});



app.get('/getalltruckdetails', async (req, res) => {
  const trucks= await Truck.find();
  res.json(trucks);
});



/*
app.post('/trucks', async (req, res) => {
  const {  TruckCompanyName , TruckDriverName , TruckDriverPhoneNumber ,TruckNumber , TruckCapacity , TruckLocation , TruckDestination ,TruckPrice  , TruckImageURL   } = req.body;
  const newShipment= new Shipment({  {  TruckCompanyName , TruckDriverName , TruckDriverPhoneNumber ,TruckNumber , TruckCapacity , TruckLocation , TruckDestination ,TruckPrice  , TruckImageURL   }  });
  await newShipment.save();
  
  res.json(newShipment);
});

*/



// Start the server
app.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});
