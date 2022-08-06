import 'package:examen_final/models/productos.dart';
import 'package:examen_final/services/productosFirebase.dart';
import 'package:examen_final/views/carritoCompras.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List<Producto> listaProductos = [];

  List<Producto> carrito= [];

  final firebase = productosFirebase();

  @override
  Widget build(BuildContext context) {
    actualizarLista();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Productos"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>carritoCompras(carrito: carrito)));
                  },
                  icon: const Icon(Icons.shopping_cart)),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            actualizarLista();
          },
          child: const Icon(Icons.refresh),
        ),
        body: listaWidget());
  }

  Center listaWidget() {
    return Center(
        child: listaProductos.isNotEmpty
            ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: listaProductos.length,
                  itemBuilder: (context, index) => Card(
                      child: Row(
                    children: <Widget>[
                      Image.network(
                        listaProductos[index].imagen,
                        width: 150,
                        height: 150,
                      ),
                      Column(
                        children: <Widget>[
                          Text("Producto: ${listaProductos[index].nombre}",),
                          Text("Descripcion: ${listaProductos[index].descripcion}"),
                          Text("Precio: \$${listaProductos[index].precio}"),
                          listaProductos[index].stock>0?Text("Stock: ${listaProductos[index].stock}"):const Text("Producto Agotado",style: TextStyle(color: Colors.red),),
                          Row(
                            children: [
                              ElevatedButton(onPressed: listaProductos[index].stock>0?()=>agregarCarrito(listaProductos[index]):null, child: const Text("Agregar al Carrito")),
                            ],
                          )
                        ],
                      )
                    ],
                  )),
                ),
            )
            : const CircularProgressIndicator(),
      );
  }

  void agregarCarrito(Producto producto){
    producto.aumentar();
    carrito.add(producto);
  }

  void actualizarLista() async {
    listaProductos = await firebase.obtenerProductos();
    setState(() {});
  }
}
