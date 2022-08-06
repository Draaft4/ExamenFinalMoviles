import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/productos.dart';

class productosFirebase {
  var db = FirebaseFirestore.instance;

  Future<List<Producto>> obtenerProductos() async {
    List<Producto> listaProductos = [];
    await db.collection("productos").get().then(
        (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((producto) {
              int codigo = producto["codigo"];
              String nombre = producto["nombre"];
              String descripcion = producto["descripcion"];
              double precio = producto["precio"];
              int stock = producto["stock"];
              String imagen = producto["imagen"];
              Producto nuevo = Producto(
                  id: producto.id,
                  codigo: codigo,
                  nombre: nombre,
                  descripcion: descripcion,
                  precio: precio,
                  stock: stock,
                  imagen: imagen,
                  cantidad: 0);
              listaProductos.add(nuevo);
            }));
    return listaProductos;
  }

  Future<String> actualizarLista(List<Producto> carrito) async {
    String mensaje = "";
    for (var producto in carrito) {
      int val = producto.stock-producto.cantidad;
      print("$val");
      print(producto.id);
      db.collection("productos").doc(producto.id).update({"stock":producto.stock-producto.cantidad}).then((value) => {
        mensaje = "Compra Realizada"
      }).catchError((error)=>{
        mensaje = "Error al momento de actualizar: $error"
      });
    }
    return mensaje;
  }
}
