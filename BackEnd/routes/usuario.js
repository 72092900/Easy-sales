'use strict'

var express = require('express');
var UsuarioController = require('../controllers/usuario');

var router = express.Router();

//RUTAS PARA USUARIOS
router.get('/usuarios', UsuarioController.list);
router.get('/usuarios/:id', UsuarioController.find);
router.post('/usuarios/save', UsuarioController.save);


module.exports = router;