import 'dart:convert';

class Usuario {
    Usuario({
        required this.id,
        required this.idUsuario,
        required this.nombre,
        required this.apellido,
        required this.correoElectrinico,
        required this.contrasea,
    });

    String id;
    int idUsuario;
    String nombre;
    String apellido;
    String correoElectrinico;
    String contrasea;

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        idUsuario: json["idUsuario"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correoElectrinico: json["correoElectrinico"],
        contrasea: json["contraseña"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "idUsuario": idUsuario,
        "nombre": nombre,
        "apellido": apellido,
        "correoElectrinico": correoElectrinico,
        "contraseña": contrasea,
    };
}
