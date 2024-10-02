import 'package:flutter/material.dart';
import 'models/Usuario.dart';
import 'models/Receta.dart';
import 'pages/home.dart';
import 'pages/favoritos.dart';
import 'pages/perfil.dart';

void main() {
  runApp(const MokkApp());
}

class MokkApp extends StatelessWidget {
  const MokkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MokkApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'MokkApp'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final Usuario _usuarioSistema = Usuario(
  id: '1',
  nombre: 'MokkApp',
  email: 'mokapp@example.com',
  preferencias: [],
  recetasFavoritas: [],
  recetasCreadas: [
    Receta(
      id: '1',
      nombre: 'Café Latte',
      ingredientes: ['Café', 'Leche'],
      instrucciones: '1. Prepara un café espresso. 2. Calienta la leche y espúmala. 3. Mezcla el café y la leche en partes iguales.',
      tipoGrano: 'Arábica',
      tecnicaExtraccion: 'Espresso',
      tiempoPreparacion: '5 min',
      equipo: 'Cafetera espresso',
      autor: 'MokkApp',
      resenas: [],
      esFavorito: false,
      productosRelacionados: [],
    ),
    Receta(
      id: '2',
      nombre: 'Café Americano',
      ingredientes: ['1 taza de agua', '1 o 2 cucharadas de café molido'],
      instrucciones: '1. Calienta el agua hasta hervir. 2. Añade el café molido y filtra.',
      tipoGrano: 'Arábica',
      tecnicaExtraccion: 'Goteo',
      tiempoPreparacion: '5 min',
      equipo: 'Cafetera de goteo',
      autor: 'MokkApp',
      resenas: [],
      esFavorito: false,
      productosRelacionados: [],
    ),
    Receta(
      id: '3',
      nombre: 'Café Frappé',
      ingredientes: ['1 taza de café fuerte frío', '1 taza de leche', 'Azúcar al gusto', 'Hielo'],
      instrucciones: '1. Mezcla el café frío, la leche y el azúcar. 2. Añade hielo y licúa hasta que esté suave.',
      tipoGrano: 'Robusta',
      tecnicaExtraccion: 'Espresso',
      tiempoPreparacion: '10 min',
      equipo: 'Licuadora, máquina de espresso',
      autor: 'MokkApp',
      resenas: [],
      esFavorito: false,
      productosRelacionados: [],
    ),
    Receta(
      id: '4',
      nombre: 'Café con Leche',
      ingredientes: ['1 taza de café fuerte', '1 taza de leche', 'Azúcar al gusto'],
      instrucciones: '1. Prepara el café. 2. Calienta la leche y mézclala con el café.',
      tipoGrano: 'Arábica',
      tecnicaExtraccion: 'Espresso',
      tiempoPreparacion: '5 min',
      equipo: 'Cafetera espresso, espumador de leche',
      autor: 'MokkApp',
      resenas: [],
      esFavorito: false,
      productosRelacionados: [],
    ),
    Receta(
      id: '5',
      nombre: 'Café Turco',
      ingredientes: ['1 taza de agua', '2 cucharadas de café molido', 'Azúcar al gusto (opcional)'],
      instrucciones: '1. Mezcla en un cezve y calienta. 2. Retira del fuego justo antes de hervir.',
      tipoGrano: 'Arábica',
      tecnicaExtraccion: 'Hervido',
      tiempoPreparacion: '10 min',
      equipo: 'Cezve',
      autor: 'MokkApp',
      resenas: [],
      esFavorito: false,
      productosRelacionados: [],
    ),
  ],
);


  final Usuario _defaultUsuario = Usuario(
    id: '2',
    nombre: 'John Doe',
    email: 'john.doe@example.com',
    preferencias: ['Café con leche'],
    recetasFavoritas: [],
    recetasCreadas: [],
  );

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(
        usuarioSistema: _usuarioSistema,
        usuarioDefault: _defaultUsuario,
        onFavoriteToggle: _toggleFavorite,
      ),
      FavoritosScreen(usuario: _defaultUsuario),
      PerfilScreen(usuario: _defaultUsuario),
    ];
  }

  void _toggleFavorite(Receta receta) {
    setState(() {
      receta.esFavorito = !receta.esFavorito;
      if (receta.esFavorito) {
        _defaultUsuario.recetasFavoritas.add(receta);
      } else {
        _defaultUsuario.recetasFavoritas.removeWhere((r) => r.id == receta.id);
      }
    });
  }

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
        children: _pages,
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
