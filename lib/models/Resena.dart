import 'package:aplicacion1_ejemplo/models/Receta.dart';
import 'package:aplicacion1_ejemplo/models/Usuario.dart';

class Resena {
  String id;
  Usuario usuario;
  Receta receta;
  int puntuacion;
  String comentarios;

  Resena({
    required this.id,
    required this.usuario,
    required this.receta,
    required this.puntuacion,
    required this.comentarios,
  });
}