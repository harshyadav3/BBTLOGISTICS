const express =require('express');
const mongoose=require('mongoose');
const ChannelModel = require("./models/channel")
const app=express();
const PORT =8080;
const dbURL="mongodb+srv://vikas:vikas@cluster0.07wtzrc.mongodb.net/?retryWrites=true&w=majority"
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
     var channelModel1 =new ChannelModel()
     channelModel1.name="harsh"
     channelModel1.type="Type1"

     channelModel1.save((err,data)=>
     {
        if(err)
        {
             console.error(err)
        }
        else{
            res.status(200).send({"msg" : "Inserted to DB"})
        }
     })

      //res.send("Buyer details")
});
