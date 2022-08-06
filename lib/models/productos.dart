class Producto{
  String id;
  int codigo;
  String nombre;
  String descripcion;
  double precio;
  int stock;
  String imagen;
  int cantidad;

  Producto({
    required this.id,
    required this.codigo,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
    required this.imagen,
    required this.cantidad
  });

  void aumentar(){
    cantidad++;
  }

  void restar(){
    cantidad--;
  }

}