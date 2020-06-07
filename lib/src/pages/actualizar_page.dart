import 'package:flutter/material.dart';
import 'package:formvalidation/src/utils/menu_util.dart';

class Actualizar extends StatefulWidget {


  @override
  _Actualizar createState() => _Actualizar();
}

class _Actualizar extends State<Actualizar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Datos"),
        centerTitle: true,
      ),
      drawer: Menu(),
      body:Text("Hola")
    );
  }
}