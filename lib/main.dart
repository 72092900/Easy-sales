import 'package:easy_sales/providers/ropa_provider.dart';
import 'package:easy_sales/providers/usuario_provider.dart';
import 'package:easy_sales/screens/rutaInicialScreen.dart';
import 'package:easy_sales/screens/rutaInicioSesionScreen.dart';
import 'package:easy_sales/screens/rutaRopaScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MyApp()
  );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider(),lazy: false),
        ChangeNotifierProvider(create: (_) => RopaProvider(),lazy: false),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Easy Sales',
        initialRoute: 'rutaInicial',
        routes: {
          'rutaInicial': (_) => rutaInicialScreen(),
          'rutaInicioSesion': (_) => rutaInicioSesionScreen(),
          //'rutaRegistro': (_) => rutaRegistroScreen(),
          'rutaRopa': (_) => rutaRopaScreen(),
        },
      ),
    );
  }
}
