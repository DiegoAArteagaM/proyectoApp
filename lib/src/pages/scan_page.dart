
import 'package:flutter/material.dart';


class ScanPage extends StatefulWidget {

final String qrEscaneado;
final Map<String, dynamic> mapa;

ScanPage(this.qrEscaneado, this.mapa);

@override
ScanPageState createState() => ScanPageState(this.qrEscaneado, this.mapa);
}

//======================================================================================================================================

class ScanPageState extends State<ScanPage> {

String qrEscaneado;
Map<String, dynamic> mapa;
String name;
String dependencia;
String email;
List<dynamic> sintomas;

@override
void initState() { 
  super.initState();
  
}

ScanPageState(qqrEscaneado, map){
  this.mapa = map;
  this.qrEscaneado = qqrEscaneado;
}

  bool tos = false;
  bool fiebre = false;
  bool diarrea = false;
  bool cansancio = false;
  bool dolorM = false;
  bool dolorG = false;
  bool conjun = false;
  bool dolorC = false;
  bool perdidaOlfato = false;
  bool dificultadResp = false;
  bool dolorP = false;
  bool dificultadM = false;
  bool erupciones  = false;

@override
Widget build(BuildContext context) {  

  return Scaffold(
    appBar: AppBar(
      title: Text("RESULTADO ESCANER"),
    ),
    body: ListView(
      children: _crearItems()
    )
      
   );
}

List<Widget> _crearItems(){
  
  print("se escaneo //////////////////////////////// >>>>>>>>>>>>>>>>>>>>>>>>>> $mapa");
  List<Widget> lista = new List<Widget>();
  name = mapa["name"];
  dependencia = mapa["dependencia"];
  email = mapa["email"];
  sintomas = mapa["sintomas"];

  tos = sintomas[0];
   fiebre = sintomas[1];
   diarrea = sintomas[2];
   cansancio = sintomas[3];
   dolorM = sintomas[4];
   dolorG = sintomas[5];
   conjun = sintomas[6];
   dolorC = sintomas[7];
   perdidaOlfato = sintomas[8];
   dificultadResp = sintomas[9];
   dolorP = sintomas[10];
   dificultadM = sintomas[11];
   erupciones  = sintomas[12];


  final nameWid = ListTile(
    title: Text("NOMBRE: $name"),
    leading: Icon(Icons.group),
  );

  final emailW = ListTile(
    title: Text("CORREO: $email"),
    leading: Icon(Icons.mail),
  );

  final dependenciaw = ListTile(
    title: Text("DEPENDENCIA: $dependencia"),
    leading: Icon(Icons.folder_shared),
  );

  final textWid = ListTile(
    title: Text("ESTADO DE SALUD DE $name:"),
    leading: Icon(Icons.local_hospital),
  );

  Widget wtos;
  if(tos){
     wtos = ListTile(
      title: Text("ACTUALMENTE TIENE TOS"),
      leading: Icon(Icons.thumb_down, color:Colors.red),      
    );
  }else{
    wtos = ListTile(
      title: Text("ACTUALMENTE NO TIENE TOS"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wfiebre;
  if(fiebre){
     wfiebre = ListTile(
      title: Text("ACTUALMENTE TIENE FIEBRE"), 
      leading: Icon(Icons.thumb_down, color:Colors.red),      
    );
  }else{
    wfiebre = ListTile(
      title: Text("ACTUALMENTE NO TIENE FIEBRE"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wcansancio;
  if(cansancio){
     wcansancio = ListTile(
      title: Text("ACTUALMENTE TIENE CANSANCIO"),
      leading: Icon(Icons.thumb_down, color:Colors.red),       
    );
  }else{
    wcansancio = ListTile(
      title: Text("ACTUALMENTE NO TIENE CANSANCIO"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wDolorM;
  if(dolorM){
     wDolorM = ListTile(
      title: Text("ACTUALMENTE TIENE DOLOR MUSCULAR"),
      leading: Icon(Icons.thumb_down, color:Colors.red),       
    );
  }else{
    wDolorM = ListTile(
      title: Text("ACTUALMENTE NO TIENE DOLOR MUSCULAR"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wDolorG;
  if(dolorG){
     wDolorG = ListTile(
      title: Text("ACTUALMENTE TIENE DOLOR DE GARGANTA"), 
      leading: Icon(Icons.thumb_down, color:Colors.red),      
    );
  }else{
    wDolorG = ListTile(
      title: Text("ACTUALMENTE NO TIENE DOLOR DE GARGANTA"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wDiarrea;
  if(diarrea){
     wDiarrea = ListTile(
      title: Text("ACTUALMENTE TIENE DIARREA"),  
      leading: Icon(Icons.thumb_down, color:Colors.red),     
    );
  }else{
    wDiarrea = ListTile(
      title: Text("ACTUALMENTE NO TIENE DIARREA"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wConjunt;
  if(conjun){
     wConjunt = ListTile(
      title: Text("ACTUALMENTE TIENE CONJUNTIVITIS"),  
      leading: Icon(Icons.thumb_down, color:Colors.red),     
    );
  }else{
    wConjunt = ListTile(
      title: Text("ACTUALMENTE NO TIENE CONJUNTIVITIS"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wDolorC;
  if(dolorC){
     wDolorC = ListTile(
      title: Text("ACTUALMENTE TIENE DOLOR DE CABEZA"),  
      leading: Icon(Icons.thumb_down, color:Colors.red),     
    );
  }else{
    wDolorC = ListTile(
      title: Text("ACTUALMENTE NO TIENE DOLOR DE CABEZA"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wSentido;
  if(perdidaOlfato){
     wSentido = ListTile(
      title: Text("ACTUALMENTE TIENE PERDIDA DE SENTIDO U OLFATO"), 
      leading: Icon(Icons.thumb_down, color:Colors.red),      
    );
  }else{
    wSentido = ListTile(
      title: Text("ACTUALMENTE NO TIENE PERDIDA DE SENTIDO U OLFATO"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wErupcion;
  if(erupciones){
     wErupcion = ListTile(
      title: Text("ACTUALMENTE TIENE ERUPCIONES CUTANEAS"), 
      leading: Icon(Icons.thumb_down, color:Colors.red),      
    );
  }else{
    wErupcion = ListTile(
      title: Text("ACTUALMENTE NO TIENE ERUPCIONES CUTANEAS"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wRespirar;
  if(dificultadResp){
     wRespirar = ListTile(
      title: Text("ACTUALMENTE TIENE DIFICULTAD PARA RESPIRAR"),  
      leading: Icon(Icons.thumb_down, color:Colors.red),     
    );
  }else{
    wRespirar = ListTile(
      title: Text("ACTUALMENTE NO TIENE DIFICULTAD PARA RESPIRAR"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wPecho;
  if(dolorP){
     wPecho = ListTile(
      title: Text("ACTUALMENTE TIENE DOLOR DE PECHO"), 
      leading: Icon(Icons.thumb_down, color:Colors.red),     
    );
  }else{
    wPecho = ListTile(
      title: Text("ACTUALMENTE NO TIENE DOLOR DE PECHO"),
      leading: Icon(Icons.thumb_up, color: Colors.green),
    );
  }

  Widget wMovimiento;
  if(dificultadM){
     wMovimiento = ListTile(
      title: Text("ACTUALMENTE TIENE DIFICULTAD DE MOVIMIENTO"), 
      leading: Icon(Icons.thumb_down, color:Colors.red),      
    );
  }else{
    wMovimiento = ListTile(
      title: Text("ACTUALMENTE NO TIENE DIFICULTAD DE MOVIMIENTO"),
      leading: Icon(Icons.thumb_up, color: Colors.green), 
    );
  }

  Widget wRecomendacion;
  if(tos || fiebre || dolorP || dolorC || dolorG || dolorM || dificultadResp || dificultadM || diarrea || cansancio || conjun 
          || perdidaOlfato || erupciones){
     wRecomendacion = ListTile(
      title: Text("DADO TU ESTADO DE SALUD SE TE RECOMIENDA DESCANSAR Y PERMANECER EN CUARENTENA Y VISITAR A TU MEDICO"), 
      leading: Icon(Icons.thumb_down, color:Colors.red),      
    );
  }else{
    wRecomendacion = ListTile(
      title: Text("GOZAS DE BUENA SALUD, CUIDATE Y CUIDA A LOS DEMAS"),
      leading: Icon(Icons.thumb_up, color: Colors.green), 
    );
  }  

  lista.add(nameWid);
  lista.add(Divider());
  lista.add(emailW);
  lista.add(Divider());
  lista.add(dependenciaw);
  lista.add(Divider());
  lista.add(textWid);
  lista.add(Divider());
  lista.add(wtos);
  lista.add(Divider());
  lista.add(wfiebre);
  lista.add(Divider());
  lista.add(wcansancio);
  lista.add(Divider());
  lista.add(wDolorM);
  lista.add(Divider());
  lista.add(wDolorG);
  lista.add(Divider());
  lista.add(wDiarrea);
  lista.add(Divider());
  lista.add(wConjunt);
  lista.add(Divider());
  lista.add(wDolorC);
  lista.add(Divider());
  lista.add(wSentido);
  lista.add(Divider());
  lista.add(wErupcion);
  lista.add(Divider());
  lista.add(wRespirar);
  lista.add(Divider());
  lista.add(wPecho);
  lista.add(Divider());
  lista.add(wMovimiento);
  lista.add(Divider());
  lista.add(wRecomendacion);


  return lista;
}

}