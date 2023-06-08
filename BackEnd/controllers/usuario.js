'use stricts'

var client = require("../database/db");
var db = client.db("TiendaOnline");

var controller = {
    list: function (req, res) {
        console.log("-----------------------");
        console.log("ENTRANDO A LA FUNCION LISTAR");
        db.collection("usuarios").find().toArray(
            (error , dataUsuarios) => {
                if (error || !dataUsuarios){
                    return res.status(404).send({ 
                        message: " No se encontraron usuarios"
                    });
                } else {
                    return res.status(200).send({
                        status: "success",
                        usuarios: dataUsuarios
                    })
                }
            }
        );
    },
    find: function (req, res) {
        console.log("-----------------------");
        console.log("ENTRANDO A LA FUNCION BUSCAR");
        console.log("id:" + req.params.id);
        db.collection("usuarios").find({ idUsuario: parseInt(req.params.id) }).toArray(
            (error, dataUsuarios) => {
                if(error || !dataUsuarios){
                    return res.status(404).send({
                        message: "No se encontro el usuario"
                    });
                } else {
                    return res.status(200).send({
                        status: "success",
                        usuario : dataUsuarios[0] 
                    })
                }
            }
        )
    },
    save: function (req, res) {
        console.log("-----------------------");
        console.log("ENTRANDO A LA FUNCION GUARDAR");
        console.log(req.body);
        if (req.body.idUsuario == 0){
            console.log("ENTRANDO A NUEVO");
            db.collection("usuarios").count().then(
                countUsuarios => {
                    var usuario = {}
                    usuario.idUsuario = countUsuarios + 1;
                    usuario.nombre = req.body.nombre;
                    usuario.apellido = req.body.apellido;
                    usuario.correoElectrinico = req.body.correoElectrinico;
                    usuario.contraseña = req.body.contraseña;
                    db.collection('usuarios').insertOne(usuario,
                        (error, result) => {
                            if(error){
                                return res.status(404).send({
                                    message : "No se puudo registar el usuario"
                                });
                            } else {
                                return res.status(200).send({
                                    status: "success",
                                    usuario: result
                                });
                            }
                        }  
                    );
                }
            );
        } else {
            console.log('ENTRANDO A EDITAR');
            var usuario = {}
            usuario.idUsuario = parseInt(req.body.idUsuario);
            usuario.nombre = req.body.nombre;
            usuario.apellido = req.body.apellido;
            usuario.correoElectrinico = req.body.correoElectrinico;
            usuario.contraseña = req.body.contraseña;
            console.log(usuario);
            db.collection("usuarios").updateOne({ idUsuario: { $eq: parseInt(req.body.idUsuario)}},
                                                            {$set: usuario},
                (error, result) =>{
                    if(error){
                        return res.status(404).send({
                            message: "No se puede editar el usuario"
                        });
                        }else {
                            return res.status(200).send({
                                status: "success",
                                usuario:result
                        });
                    }
                }
            );
        }
    }
}
module.exports = controller;