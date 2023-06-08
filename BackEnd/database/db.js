const { MongoClient } = require("mongodb");
const client =  new MongoClient("mongodb+srv://angelrh3:miguelangel456mrhK@cluster0.pyr5m.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");

client.connect().then(
    (response) =>{
        console.log('La conexion a la bd es correcta - url:'+ response.url);
    },
    (error) => {
        console.error('error:' + error);
    }
    
)

module.exports = client;