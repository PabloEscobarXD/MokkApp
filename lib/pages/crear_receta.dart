import 'package:flutter/material.dart';
import '../models/Receta.dart';
import '../models/Usuario.dart';
import '../models/ProductoRelacionado.dart';


class CrearRecetaScreen extends StatefulWidget {
  final Usuario usuario;
  final Function(Receta) onRecetaCreada;

  const CrearRecetaScreen({
    super.key,
    required this.usuario,
    required this.onRecetaCreada,
  });

  @override
  _CrearRecetaScreenState createState() => _CrearRecetaScreenState();
}

class _CrearRecetaScreenState extends State<CrearRecetaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _ingredientesController = TextEditingController();
  final _instruccionesController = TextEditingController();
  final _tipoGranoController = TextEditingController();
  final _tecnicaExtraccionController = TextEditingController();
  final _tiempoPreparacionController = TextEditingController();
  final _equipoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _ingredientesController.dispose();
    _instruccionesController.dispose();
    _tipoGranoController.dispose();
    _tecnicaExtraccionController.dispose();
    _tiempoPreparacionController.dispose();
    _equipoController.dispose();
    super.dispose();
  }

  void _crearReceta() {
  if (_formKey.currentState!.validate()) {
    final nuevaReceta = Receta(
      id: 'some_unique_id', // Genera un ID único para la receta
      nombre: _nombreController.text,
      ingredientes: _ingredientesController.text.split(','),
      instrucciones: _instruccionesController.text,
      tipoGrano: _tipoGranoController.text,
      tecnicaExtraccion: _tecnicaExtraccionController.text,
      tiempoPreparacion: _tiempoPreparacionController.text,
      equipo: _equipoController.text,
      autor: widget.usuario.nombre,
      resenas: [],
      esFavorito: false,
      productosRelacionados: [],
    );

    nuevaReceta.productosRelacionados = ProductoRelacionado.generarProductosRelacionados(nuevaReceta);

    widget.onRecetaCreada(nuevaReceta);
    Navigator.pop(context);
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Receta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre de la receta'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre de la receta';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ingredientesController,
                decoration: const InputDecoration(labelText: 'Ingredientes (separados por comas)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa los ingredientes';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _instruccionesController,
                decoration: const InputDecoration(labelText: 'Instrucciones'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa las instrucciones';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tipoGranoController,
                decoration: const InputDecoration(labelText: 'Tipo de grano'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el tipo de grano';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tecnicaExtraccionController,
                decoration: const InputDecoration(labelText: 'Técnica de extracción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa la técnica de extracción';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tiempoPreparacionController,
                decoration: const InputDecoration(labelText: 'Tiempo de preparación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el tiempo de preparación';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _equipoController,
                decoration: const InputDecoration(labelText: 'Equipo necesario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el equipo necesario';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _crearReceta,
                child: const Text('Añadir Receta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
