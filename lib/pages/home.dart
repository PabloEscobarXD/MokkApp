import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Para el control de la pestaña seleccionada

  // Lista de pantallas que serán mostradas según la pestaña seleccionada
  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoritosScreen(),
    const PerfilScreen(),
  ];

  // Cambiar el índice seleccionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages, // Mantiene el estado de las páginas
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Recetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex, // Índice seleccionado
        onTap: _onItemTapped,         // Cambia la página según el ítem seleccionado
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 150.0,
          pinned: true,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('MokkApp'),
            titlePadding: EdgeInsets.all(16.0),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
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
                      'Título de la Card ${index + 1}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Descripción breve de la Card ${index + 1}.',
                      style: const TextStyle(fontSize: 18),
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navegar a la página de detalles
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecetaDetailScreen(
                            recetaTitulo: 'Título de la Card ${index + 1}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            childCount: 5, // Número de cards
          ),
        ),
      ],
    );
  }
}


class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: const Center(
        child: Text('Esta es la página de Favoritos.'),
      ),
    );
  }
}

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: const Center(
        child: Text('Esta es la página de Perfil.'),
      ),
    );
  }
}

class RecetaDetailScreen extends StatelessWidget {
  final String recetaTitulo;

  const RecetaDetailScreen({super.key, required this.recetaTitulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recetaTitulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recetaTitulo,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Aquí irán los detalles de la receta seleccionada.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}