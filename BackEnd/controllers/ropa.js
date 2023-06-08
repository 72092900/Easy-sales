'use stricts'

var client = require("../database/db");
var db = client.db("TiendaOnline");

var controller = {
    list: function (req, res) {
        console.log("-----------------------");
        console.log("ENTRANDO A LA FUNCION LISTAR");
        db.collection("ropas").find().toArray(
            (error , dataRopas) => {
                if (error || !dataRopas){
                    return res.status(404).send({ 
                        message: " No se encontraron ropas"
                    });
                } else {
                    return res.status(200).send({
                        status: "success",
                        ropas: dataRopas
                    })
                }
            }
        );
    },
    find: function (req, res) {
        console.log("-----------------------");
        console.log("ENTRANDO A LA FUNCION BUSCAR");
        console.log("id:" + req.params.id);
        db.collection("ropas").find({ idRopa: parseInt(req.params.id) }).toArray(
            (error, dataRopas) => {
                if(error || !dataRopas){
                    return res.status(404).send({
                        message: "No se encontro la ropa"
                    });
                } else {
                    return res.status(200).send({
                        status: "success",
                        ropa : dataRopas[0] 
                    })
                }
            }
        )
    },
    save: function (req, res) {
        console.log("-----------------------");
        console.log("ENTRANDO A LA FUNCION GUARDAR");
        console.log(req.body);
        if (req.body.idRopa == 0){
            console.log("ENTRANDO A NUEVO");
            db.collection("ropas").count().then(
                countRopas => {
                    var ropa = {}
                    ropa.idRopa = countRopas + 1;
                    ropa.producto = req.body.producto;
                    ropa.imagenProducto = req.body.imagenProducto;
                    ropa.descripcion = req.body.descripcion;
                    ropa.talla = req.body.talla;
                    ropa.categoria = req.body.categoria;
                    ropa.precio = req.body.precio;
                    ropa.numeroVentas = req.body.numeroVentas;
                    db.collection('ropas').insertOne(ropa,
                        (error, result) => {
                            if(error){
                                return res.status(404).send({
                                    message : "No se puudo registar la ropa"
                                });
                            } else {
                                return res.status(200).send({
                                    status: "success",
                                    ropa: result
                                });
                            }
                        }  
                    );
                }
            );
        } else {
            console.log('ENTRANDO A EDITAR');
            var ropa = {}
            ropa.idRopa = parseInt(req.body.idRopa);
            ropa.producto = req.body.producto;
            ropa.imagenProducto = req.body.imagenProducto;
            ropa.descripcion = req.body.descripcion;
            ropa.talla = req.body.talla;
            ropa.categoria = req.body.categoria;
            ropa.precio = req.body.precio;
            ropa.numeroVentas = req.body.numeroVentas;
            console.log(ropa);
            db.collection("ropas").updateOne({ idRopa: { $eq: parseInt(req.body.idRopa)}},
                                                            {$set: ropa},
                (error, result) =>{
                    if(error){
                        return res.status(404).send({
                            message: "No se puede editar la ropa"
                        });
                        }else {
                            return res.status(200).send({
                                status: "success",
                                ropa:result
                        });
                    }
                }
            );
        }
    }
}
module.exports = controller;