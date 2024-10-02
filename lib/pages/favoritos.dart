import 'package:flutter/material.dart';
import '../models/Receta.dart';
import '../models/Usuario.dart';
import 'detalle_receta.dart';

class FavoritosScreen extends StatelessWidget {
  final Usuario usuario;

  const FavoritosScreen({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: usuario.recetasFavoritas.isEmpty
          ? const Center(
              child: Text('No tienes recetas favoritas.'),
            )
          : ListView.builder(
              itemCount: usuario.recetasFavoritas.length,
              itemBuilder: (context, index) {
                final receta = usuario.recetasFavoritas[index];
                return ListTile(
                  title: Text(receta.nombre),
                  subtitle: Text('Tipo de Grano: ${receta.tipoGrano}'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecetaDetailScreen(
                          receta: receta,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
