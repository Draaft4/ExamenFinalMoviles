import 'package:examen_final/models/productos.dart';
import 'package:examen_final/services/productosFirebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class carritoCompras extends StatefulWidget {
  final List<Producto> carrito;
  const carritoCompras({Key? key, required this.carrito}) : super(key: key);

  @override
  State<carritoCompras> createState() => _carritoComprasState(carrito);
}

class _carritoComprasState extends State<carritoCompras> {
  final List<Producto> carrito;
  final servicios = productosFirebase();

  _carritoComprasState(this.carrito);
  @override
  Widget build(BuildContext context) {
    String mensaje = "";
    return Scaffold(
        appBar: AppBar(
          title: const Text("Carrito de Compras"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async => {
            mensaje = await servicios.actualizarLista(carrito),
            carrito.clear(),
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(mensaje),
            )),
            Navigator.pop(context)
          },
          child: const Icon(Icons.check),
        ),
        body: carrito.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: carrito.length,
                    itemBuilder: (context, index) => Card(
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                carrito[index].imagen,
                                width: 50,
                                height: 50,
                              ),
                              Text(carrito[index].nombre),
                              Row(children: <Widget>[
                                const Text("Cantidad"),
                                ElevatedButton(
                                  onPressed: () {
                                    aumentar(index);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Text(
                                    '+',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                Text("${carrito[index].cantidad}"),
                                ElevatedButton(
                                  onPressed: () {
                                    if (carrito[index].cantidad == 1) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            "No puede restar mas la cantidad, elimine el producto si desea."),
                                      ));
                                    } else {
                                      restar(index);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Text(
                                    '-',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50.0,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      eliminar(index);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                    child: const Text("Eliminar")),
                              ])
                            ],
                          ),
                        )),
              )
            : const Center(child: Text("Carrito vacio")));
  }

  void eliminar(index) {
    setState(() {
      carrito.removeAt(index);
    });
  }

  void aumentar(int index) {
    setState(() {
      carrito[index].aumentar();
    });
  }

  void restar(int index) {
    setState(() {
      carrito[index].restar();
    });
  }
}
