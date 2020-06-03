
import 'dart:convert';

import 'package:flutter/services.dart';

class RutasProvider{
  List<dynamic> rutas = [];

  RutasProvider(){
    cargarData();
  }

  Future <List<dynamic>> cargarData() async{
    final resp = await rootBundle.loadString("data/menu_opts.json");

    Map dataMap = json.decode(resp);
    rutas = dataMap["rutas"];
    return rutas;    
  }

  
}