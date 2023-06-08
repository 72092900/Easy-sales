import 'dart:convert';
import 'package:easy_sales/models/ropa.dart';

class RopaResponse {
    RopaResponse({
        required this.ropas,
    });

    List<Ropa> ropas;

    factory RopaResponse.fromJson(String str) => RopaResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RopaResponse.fromMap(Map<String, dynamic> json) => RopaResponse(
        ropas: List<Ropa>.from(json["ropas"].map((x) => Ropa.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "ropas": List<dynamic>.from(ropas.map((x) => x.toMap())),
    };
}