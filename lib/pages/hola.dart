import 'package:flutter/material.dart';

class Hola extends StatefulWidget {
  const Hola({super.key, required this.title});
  final String title; 
  @override
  State<Hola> createState()=>_HolaState();
}

class _HolaState extends State<Hola>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text(widget.title), backgroundColor: Color.fromARGB(249, 56, 54, 221)));
  }
}