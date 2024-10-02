import 'package:flutter/material.dart';
import '../models/Receta.dart';
import '../models/Usuario.dart';
import 'crear_receta.dart';
import 'detalle_receta.dart';

class HomeScreen extends StatefulWidget {
  final Usuario usuarioSistema;
  final Usuario usuarioDefault;
  final void Function(Receta receta) onFavoriteToggle;

  const HomeScreen({
    super.key,
    required this.usuarioSistema,
    required this.usuarioDefault,
    required this.onFavoriteToggle,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showOfficialRecipes = true;

  void _changeTab(bool showOfficial) {
    setState(() {
      _showOfficialRecipes = showOfficial;
    });
  }

  void _navigateToCrearReceta() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CrearRecetaScreen(
          usuario: widget.usuarioDefault,
          onRecetaCreada: (nuevaReceta) {
            setState(() {
              widget.usuarioDefault.recetasCreadas.add(nuevaReceta);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Receta> recetasAMostrar = _showOfficialRecipes
        ? widget.usuarioSistema.recetasCreadas
        : widget.usuarioDefault.recetasCreadas;

    return Scaffold(
      floatingActionButton: !_showOfficialRecipes
          ? FloatingActionButton(
              onPressed: _navigateToCrearReceta,
              child: const Icon(Icons.add),
            )
          : null,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('MokkApp'),
              titlePadding: EdgeInsets.all(16.0),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _changeTab(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _showOfficialRecipes ? Colors.blue : Colors.grey,
                    ),
                    child: const Text('Oficiales'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _changeTab(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !_showOfficialRecipes ? Colors.blue : Colors.grey,
                    ),
                    child: const Text('Comunidad'),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final receta = recetasAMostrar[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: const Icon(Icons.coffee, size: 50),
                      title: Text(
                        receta.nombre,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Tipo de grano: ${receta.tipoGrano}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          receta.esFavorito
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: receta.esFavorito ? Colors.red : null,
                        ),
                        onPressed: () => widget.onFavoriteToggle(receta),
                      ),
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
                    ),
                  ),
                );
              },
              childCount: recetasAMostrar.length,
            ),
          ),
        ],
      ),
    );
  }
}
