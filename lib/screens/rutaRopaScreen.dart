import 'package:easy_sales/models/ropa.dart';
import 'package:easy_sales/providers/ropa_provider.dart';
import 'package:easy_sales/widgets/menu_lateral.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class rutaRopaScreen extends StatefulWidget {
  @override
  createState() => _rutaRopaScreenState();
}

class _rutaRopaScreenState extends State<rutaRopaScreen> {
  @override
  Widget build(BuildContext context) {
    final ropaProvider = Provider.of<RopaProvider>(context);
    final List<Ropa> listaRopas = ropaProvider.listaRopas;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Ropa',
        ),
      ),
      drawer: const MenuLateral(),
      backgroundColor: Color.fromARGB(255, 35, 35, 35),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              childAspectRatio: 0.55,
              crossAxisCount: 2,
              children: List.generate(listaRopas.length, (index) {
                return GridTile(
                  child: Card(
                    color: Color.fromARGB(255, 60, 60, 60),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                padding: EdgeInsets.all(10),
                                color: Color.fromARGB(255, 60, 60, 60),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(listaRopas[index].producto,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 0, 223, 157))),
                                    Container(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          height: 180,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/fondo1.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Container(
                                            height: 200,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    listaRopas[index]
                                                        .imagenProducto),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 180,
                                          child: Text(
                                            listaRopas[index].descripcion,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    200, 0, 223, 156)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            'S/. ${listaRopas[index].precio}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 255, 160, 160)),
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Text(
                                            'Tallas: ${listaRopas[index].talla}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 255, 160, 160)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 15,
                                    ),
                                    //boton comprar
                                    RaisedButton(
                                      color: Color.fromARGB(255, 0, 223, 157),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.shopping_cart,
                                            color:
                                                Color.fromARGB(255, 20, 20, 20),
                                          ),
                                          Container(
                                            width: 10,
                                          ),
                                          Text(
                                            'Comprar',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 20, 20, 20)),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        print("Comprar: " +
                                            listaRopas[index].producto);
                                      },
                                    ),
                                  ],
                                )));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              listaRopas[index].producto,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 223, 157),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            height: 210,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/fondo1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      listaRopas[index].imagenProducto),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "S/." + listaRopas[index].precio.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 160, 160),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text("Tallas: " + listaRopas[index].talla,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(195, 255, 160, 160),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Container(
                                height: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Text("text")
        ],
      ),
    );
  }
}

