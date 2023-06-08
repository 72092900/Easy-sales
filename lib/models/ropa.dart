import 'dart:convert';

class Ropa {
    Ropa({
        required this.id,
        required this.idRopa,
        required this.producto,
        required this.imagenProducto,
        required this.descripcion,
        required this.talla,
        required this.categoria,
        required this.precio,
        required this.numeroVentas,
    });

    String id;
    int idRopa;
    String producto;
    String imagenProducto;
    String descripcion;
    String talla;
    String categoria;
    double precio;
    int numeroVentas;

    factory Ropa.fromJson(String str) => Ropa.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ropa.fromMap(Map<String, dynamic> json) => Ropa(
        id: json["_id"],
        idRopa: json["idRopa"],
        producto: json["producto"],
        imagenProducto: json["imagenProducto"],
        descripcion: json["descripcion"],
        talla: json["talla"],
        categoria: json["categoria"],
        precio: json["precio"].toDouble(),
        numeroVentas: json["numeroVentas"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "idRopa": idRopa,
        "producto": producto,
        "imagenProducto": imagenProducto,
        "descripcion": descripcion,
        "talla": talla,
        "categoria": categoria,
        "precio": precio,
        "numeroVentas": numeroVentas,
    };
}
