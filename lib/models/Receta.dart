import 'package:aplicacion1_ejemplo/models/Resena.dart';

class Receta {
  String id;
  String nombre;
  List<String> ingredientes;
  String instrucciones;
  String tipoGrano;
  String tecnicaExtraccion;
  String tiempoPreparacion;
  String equipo;
  String autor;
  List<Receta> resenas;
  bool esFavorito;

  Receta({
    required this.id,
    required this.nombre,
    required this.ingredientes,
    required this.instrucciones,
    required this.tipoGrano,
    required this.tecnicaExtraccion,
    required this.tiempoPreparacion,
    required this.equipo,
    required this.autor,
    required this.resenas,
    required this.esFavorito,
  });
}