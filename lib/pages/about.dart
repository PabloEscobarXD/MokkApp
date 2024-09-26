import 'package:aplicacion1_ejemplo/pages/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';

class About extends StatelessWidget {
  const About(
      {super.key,
      this.color = const Color.fromARGB(255, 231, 241, 223),
      this.child,
      required this.title});

  final Color color;
  final Widget? child;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(this.title),
      ),
      body: Center(
          child: Card(
        elevation: 20,
        color: Color.fromRGBO(237, 243, 233, 1),
        child: SizedBox(
            width: 300,
            height: 300,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Mi nombre es Germán'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Volver'))
                    ],
                  ),
                ])),
      )),
    );
  }
}
