import 'package:easy_sales/screens/rutaInicialScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 35, 35, 35),
      child: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Image(image: AssetImage('assets/Logo2.png'), width: 180),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Easy ",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 223, 157))),
                      Text("Sales",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 160, 160))),
                    ],
                  ),
                ],
              )),
          Container(
            height: 20,
          ),
          Container(
            color: Color.fromARGB(255, 35, 35, 35),
            child: ListTile(
              trailing:
                  Icon(Icons.home, color: Color.fromARGB(255, 0, 223, 157)),
              style: ListTileStyle.drawer,
              title: const Text('Principal',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              onTap: () {
                Navigator.pushNamed(context, 'ruta_principal');
              },
            ),
          ),
          //productos
          Container(
            color: Color.fromARGB(255, 35, 35, 35),
            child: ListTile(
              trailing: Icon(Icons.shopping_cart,
                  color: Color.fromARGB(255, 0, 223, 157)),
              style: ListTileStyle.drawer,
              title: const Text('Productos',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              onTap: () {
                Navigator.pushNamed(context, 'ruta_productos');
              },
            ),
          ),
          Container(
            color: Color.fromARGB(255, 35, 35, 35),
            child: ListTile(
              trailing: Icon(Icons.add_shopping_cart,
                  color: Color.fromARGB(255, 0, 223, 157)),
              style: ListTileStyle.drawer,
              title: const Text('Carrito de compras',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              onTap: () {
                Navigator.pushNamed(context, 'ruta_carrito');
              },
            ),
          ),
          Container(
            color: Color.fromARGB(255, 35, 35, 35),
            child: ListTile(
              trailing: Icon(Icons.shopping_basket,
                  color: Color.fromARGB(255, 0, 223, 157)),
              style: ListTileStyle.drawer,
              title: const Text('Mis pedidos',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              onTap: () {
                Navigator.pushNamed(context, 'ruta_pedidos');
              },
            ),
          ),
          Container(
            color: Color.fromARGB(255, 35, 35, 35),
            child: ListTile(
              trailing:
                  Icon(Icons.history, color: Color.fromARGB(255, 0, 223, 157)),
              style: ListTileStyle.drawer,
              title: const Text('Historial',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              onTap: () {
                Navigator.pushNamed(context, 'ruta_historial');
              },
            ),
          ),
          Container(
            color: Color.fromARGB(255, 35, 35, 35),
            child: ListTile(
              trailing: Icon(Icons.account_circle,
                  color: Color.fromARGB(255, 0, 223, 157)),
              style: ListTileStyle.drawer,
              title: const Text('Perfil',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              onTap: () {
                Navigator.pushNamed(context, 'ruta_perfil');
              },
            ),
          ),
          Container(
            color: Color.fromARGB(255, 35, 35, 35),
            child: ListTile(
              trailing:
                  Icon(Icons.settings, color: Color.fromARGB(255, 0, 223, 157)),
              style: ListTileStyle.drawer,
              title: const Text('Configuracion',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              onTap: () {
                Navigator.pushNamed(context, 'ruta_configuracion');
              },
            ),
          ),
          Container(
            color: Color.fromARGB(255, 35, 35, 35),
            child: ListTile(
              trailing: Icon(Icons.exit_to_app,
                  color: Color.fromARGB(255, 0, 223, 157)),
              style: ListTileStyle.drawer,
              title: const Text('Salir',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
              onTap: () {
                //show alert
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 35, 35, 35),
                      title: Text('¿Seguro que desea cerrar sesion?',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          textAlign: TextAlign.center),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FlatButton(
                              child: Text('Cancelar',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text('Aceptar',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              onPressed: () {
                                 Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => rutaInicialScreen()),
                                  (Route<dynamic> route) => false);
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
