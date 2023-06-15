const express =require('express');
const mongoose=require('mongoose');
// const ChannelModel = require("./models/channel")
const app=express();
const PORT =8080;
const dbURL="mongodb+srv://vikas:vikas@cluster0.07wtzrc.mongodb.net/mynodejsdb?retryWrites=true&w=majority"
const connectionParam = {

    useNewUrlParser : true,
    useUnifiedTopology : true,
};
mongoose
        .connect(dbURL , connectionParam)
        .then( () => {
            console.log("Connected to DB");
        })
        .catch ( (e) => {
             console.log("Error : " ,e);
        })



app.listen(
    PORT ,
    () => console.log(`Server Running on ${PORT}`)
);


app.get('/buyers',(req,res)=>
{
     res.send("hi ");

      //res.send("Buyer details")
});
