import 'package:flutter/material.dart';

class Hola extends StatefulWidget {
  const Hola({super.key, required this.title});
  final String title;

  @override
  State<Hola> createState() => _HolaState();
}

class _HolaState extends State<Hola> {
  int _contador = 0; // Variable para almacenar el valor del contador
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(249, 56, 54, 221),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto que muestra el valor del contador
            Text(
              'Contador: $_contador',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Espacio entre el texto y el botón
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  _contador++; // Incrementa el contador
                });
              },
              child: Text('Incrementar contador'),
            ),
            SizedBox(height: 20), // Espacio entre los botones
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SegundaPagina(), // Navega a SegundaPagina
                  ),
                );
              },
              child: Text('Ir a la segunda página'),
            ),
            SizedBox(height: 20), // Espacio entre los botones
            // Card funcionando como un botón
            InkWell(
              onTap: () {
                // Navegar a otra página
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Título del diálogo'),
                    content: Text('Este es el contenido del diálogo.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cierra el diálogo
                        },
                        child: Text('Aceptar'),
                      ),
                    ],
                  );
                },
              );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Bordes redondeados
                ),
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(20), // Espacio interno
                  width: 300, // Ancho de la Card
                  height: 150, // Alto de la Card
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Imagen dentro de la Card
                      Icon(
                        Icons.coffee,
                        size: 40,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Título de la Card',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Esta es una descripción breve.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Página'),
      ),
      body: Center(
        child: Text('¡Bienvenido a la Segunda Página!'),
      ),
    );
  }
}
