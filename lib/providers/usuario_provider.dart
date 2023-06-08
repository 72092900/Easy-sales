import 'package:easy_sales/models/usuario.dart';
import 'package:easy_sales/models/usuario_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider extends ChangeNotifier {
  String _baseUrl = 'easy-sales-a.herokuapp.com';

  List<Usuario> listaUsuarios = [];
  UsuarioProvider() {
    print('Ingresando a UsuarioProvider');
    this.getOnUsuarioList();
  }
  getOnUsuarioList() async {
    var url = Uri.http(_baseUrl, '/api/usuarios', {});
    final response = await http.get(url);
    print(response.body);
    final usuarioResponse = UsuarioResponse.fromJson(response.body);
    listaUsuarios = usuarioResponse.usuarios;
    notifyListeners();
  }
}
