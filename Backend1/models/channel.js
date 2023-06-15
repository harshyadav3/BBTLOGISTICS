const mongoose = require("mongoose");


const channelSchema = new mongoose.Schema ({
      name :{
        type : String ,
        required : true,
        trim : true,
      },
      type:{
        type: String ,
        required : true,
        trim : true,
      },
})

const ChannelModel =mongoose.model("channel", channelSchema)
mongoose.model.exports = ChannelModel;