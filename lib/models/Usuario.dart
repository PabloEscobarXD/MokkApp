import 'package:aplicacion1_ejemplo/models/Receta.dart';

class Usuario {
  String id;
  String nombre;
  String email;
  List<String> preferencias;
  List<Receta> recetasFavoritas;

  Usuario({
    required this.id,
    required this.nombre,
    required this.email,
    required this.preferencias,
    required this.recetasFavoritas,
  });

  void gestionarFavoritos(Receta receta) {
    if (recetasFavoritas.contains(receta)) {
      recetasFavoritas.remove(receta);
    } else {
      recetasFavoritas.add(receta);
    }
  }

  void gestionarPreferencias(List<String> nuevasPreferencias) {
    preferencias = nuevasPreferencias;
  }

  Receta crearReceta(String nombre, List<String> ingredientes, String instrucciones,
      String tipoGrano, String tecnicaExtraccion, String tiempoPreparacion, String equipo) {
    return Receta(
      id: DateTime.now().toString(),
      nombre: nombre,
      ingredientes: ingredientes,
      instrucciones: instrucciones,
      tipoGrano: tipoGrano,
      tecnicaExtraccion: tecnicaExtraccion,
      tiempoPreparacion: tiempoPreparacion,
      equipo: equipo,
      autor: this.nombre,
      resenas: [],
      esFavorito: false,
    );
  }
}