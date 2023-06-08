'use strict'

var express = require('express');
var RopaController = require('../controllers/ropa');

var router = express.Router();

//RUTAS PARA ROPAS
router.get('/ropas', RopaController.list);
router.get('/ropas/:id', RopaController.find);
router.post('/ropas/save', RopaController.save);

module.exports = router;