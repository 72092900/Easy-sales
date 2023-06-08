import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class rutaInicialScreen extends StatefulWidget {
  @override
  createState() => _rutaInicialScreen();
}

class _rutaInicialScreen extends State<rutaInicialScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 20, 20),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('assets/Logo2.png'),
              width: 300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Easy ",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 223, 157))),
              Text("Sales",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 160, 160))),
            ],
          ),
          Text("Compra facil y rapido desde tu hogar",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 143, 143, 143))),
          Container(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: RaisedButton(
              color: Color.fromARGB(255, 75, 75, 75),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person, color: Color.fromARGB(255, 0, 223, 157)),
                    Container(
                      width: 10,
                    ),
                    Text("Iniciar Sesión",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 0, 223, 157))),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'rutaInicioSesion');
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: RaisedButton(
              color: Color.fromARGB(255, 75, 75, 75),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person_add,
                        color: Color.fromARGB(255, 255, 160, 160)),
                    Container(
                      width: 10,
                    ),
                    Text("Registrarse",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 255, 160, 160))),
                  ],
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'registro');
              },
            ),
          ),
        ],
      ),
    );
  }
}
