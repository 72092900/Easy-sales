'use strict'

// REQUIRES
var express = require('express');
var bodyParser = require('body-parser');

// EJECUTAR EXPRESS
var app = express();


// CARGAR ARCHIVOS DE RUTAS
var usuario_routes = require('./routes/usuario');
var ropa_routes = require('./routes/ropa');


// AGREGAR LOS MIDDLEWARES
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//CONFIGURAR CABESERAS Y CORS
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});


//REESCRIBIR RUTAS
app.use('/api',usuario_routes);
app.use('/api',ropa_routes);


//EXPORTAR MODULE
module.exports = app;