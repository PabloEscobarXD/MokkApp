import 'Receta.dart';

class ProductoRelacionado {
  String nombre;
  String descripcion;
  double precio;
  String proveedor;

  ProductoRelacionado({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.proveedor,
  });

  static List<ProductoRelacionado> generarProductosRelacionados(Receta receta) {
  List<ProductoRelacionado> productos = [];
  List<String> proveedores = ['Proveedor A', 'Proveedor B', 'Proveedor C'];

  for (var ingrediente in receta.ingredientes) {
    productos.add(ProductoRelacionado(
      nombre: ingrediente,
      descripcion: 'Ingrediente necesario para la receta',
      precio: 0.0,
      proveedor: proveedores[productos.length % proveedores.length], // Proveedor aleatorio
    ));
  }

  productos.add(ProductoRelacionado(
    nombre: receta.equipo,
    descripcion: 'Equipo necesario para la receta',
    precio: 0.0,
    proveedor: proveedores[productos.length % proveedores.length], // Proveedor aleatorio
  ));

  return productos;
}

}
