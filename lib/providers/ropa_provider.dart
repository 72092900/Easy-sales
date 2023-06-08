import 'package:easy_sales/models/ropa.dart';
import 'package:easy_sales/models/ropa_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RopaProvider extends ChangeNotifier {
  String _baseUrl = 'easy-sales-a.herokuapp.com';

  List<Ropa> listaRopas = [];
  RopaProvider() {
    print('Ingresando a RopaProvider');
    this.getOnRopaList();
  }
  getOnRopaList() async {
    var url = Uri.http(_baseUrl, '/api/ropas', {});
    final response = await http.get(url);
    print(response.body);
    final ropaResponse = RopaResponse.fromJson(response.body);
    listaRopas = ropaResponse.ropas;
    notifyListeners();
  }
}