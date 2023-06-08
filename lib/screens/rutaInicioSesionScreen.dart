import 'package:easy_sales/screens/rutaRopaScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class rutaInicioSesionScreen extends StatefulWidget {
  @override
  createState() => _rutaInicioSesionScreen();
}

class _rutaInicioSesionScreen extends State<rutaInicioSesionScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final txtUser = TextEditingController();
    final txtPass = TextEditingController();

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fondo1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Iniciar ",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 223, 157))),
                  Text("Sesión",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 160, 160))),
                ],
              ),
              Container(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person, color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              width: 0,
                              color: Colors.red,
                            ),
                          ),
                          fillColor: Color.fromARGB(35, 255, 254, 254),
                          filled: true,
                          hintText: 'Coloque su usuario',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 164, 164, 164),
                          ),
                          labelText: 'Usuario',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 196, 196, 196),
                          ),
                        ),
                        controller: txtUser,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese el usuario';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        autocorrect: false,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.lock, color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              width: 0,
                              color: Colors.red,
                            ),
                          ),
                          fillColor: Color.fromARGB(35, 255, 254, 254),
                          filled: true,
                          hintText: 'Coloque su contraseña',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 164, 164, 164),
                          ),
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 196, 196, 196),
                          ),
                        ),
                        controller: txtPass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ingrese la contraseña';
                          }
                          return null;
                        },
                      ),
                    ),
                    Text("¿Olvidaste tu contraseña?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 190, 190, 190),
                        )),
                    Container(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: RaisedButton(
                        color: Color.fromARGB(255, 0, 223, 157),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                'Validando',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Color.fromARGB(255, 0, 223, 157),
                            ));
                            if (txtUser.text == 'user' &&
                                txtPass.text == 'pass') {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => rutaRopaScreen()),
                                  (Route<dynamic> route) => false);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  'Credencias incorrectas',
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Color.fromARGB(255, 255, 0, 0),
                              ));
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
