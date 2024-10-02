import 'package:flutter/material.dart';
import '../models/Receta.dart';

class RecetaDetailScreen extends StatelessWidget {
  final Receta receta;

  const RecetaDetailScreen({super.key, required this.receta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receta.nombre),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              receta.nombre,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Autor: ${receta.autor}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            Text('Tipo de grano: ${receta.tipoGrano}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Técnica de extracción: ${receta.tecnicaExtraccion}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Tiempo de preparación: ${receta.tiempoPreparacion}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            Text('Instrucciones:', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            Text(receta.instrucciones, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            // Mostrar productos relacionados en tarjetas
            Text('Productos Relacionados:', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 16),
            Column(
              children: receta.productosRelacionados.map((producto) => Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(producto.nombre, style: const TextStyle(fontSize: 20)),
                  subtitle: Text('${producto.descripcion}\nProveedor: ${producto.proveedor}'),
                  isThreeLine: true,
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
