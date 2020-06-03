

import 'package:flutter/material.dart';
import 'package:formvalidation/src/providers/rutas_provider.dart';

class HomePage extends StatelessWidget {

  final rutasProvider = new RutasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Stack(
        children: <Widget>[
          _crearPantalla(context),
         
        ],
      ),
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Colors.white,
        child: Icon(Icons.mail, color: Colors.green),
        onPressed: (){},      
      ),
    );
  }

  //Metodo para dibujar los elementos graficos en la pantalla inicial
  Widget _crearPantalla(BuildContext context){

    final size = MediaQuery.of(context).size;

    //Sentencia para poner el color de fondo con efecto gradiente
    final fondo = Container(
      height: size.height*1,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(41, 106, 67, 1.0),
            Color.fromRGBO(2, 128, 53, 1.0)
          ]
        ),
      ),
    );

    //Sentencia para crear objeto circulo del fondo
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );

    return FutureBuilder(

      //Sentencia para leer las rutas del Json
      future: rutasProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){
          final List<dynamic> opt = snapshot.data; 

          return Stack(
          children: <Widget>[
            fondo, // se agrega el fondo al Stack
            Positioned(top: 90.0, left:30.0, child: circulo),         //Dibuja un circulo en el fondo
            Positioned(top: -40.0, right:-30.0, child: circulo),      //Dibuja un circulo en el fondo
            Positioned(bottom: -50.0, right:-10.0, child: circulo),   //Dibuja un circulo en el fondo
            Positioned(bottom: 120.0, right:20.0, child: circulo),    //Dibuja un circulo en el fondo
            Positioned(bottom: -50.0, left:-20.0, child: circulo),    //Dibuja un circulo en el fondo

            Container(
              padding: EdgeInsets.only(top:80.0),
              child:Column(
                children: <Widget>[
                  
                  SizedBox(height: 30.0, width: double.infinity),
                  Icon(Icons.local_hospital, color: Colors.white, size: 100.0), //Icono pantalla inicial

                  SizedBox(height: 150.0, width: double.infinity),

                  //Boton ingresar
                  RaisedButton(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                        child: Text("Ingresar", style: TextStyle(fontSize: 25, color: Colors.green)),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    
                    elevation: 0.0,
                    onPressed: (){
                    Navigator.pushNamed(context, opt[0]["ruta"]);
                    },
                  ),

                  SizedBox(height: 50, width: double.infinity),

                  //Boton Registro
                  RaisedButton(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                        child: Text("Registrarse", style: TextStyle(fontSize: 25, color: Colors.green)),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    
                    elevation: 0.0,
                    onPressed: (){
                      Navigator.pushNamed(context, opt[1]["ruta"]);
                    },
                  ),

                  SizedBox(height: 50, width: double.infinity),

                  //Boton Escanear
                  RaisedButton(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 75.0, vertical: 15.0),
                        child: Text("Escanear", style: TextStyle(fontSize: 25, color: Colors.green),),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    elevation: 0.0,
                    onPressed: (){
                      Navigator.pushNamed(context, opt[2]["ruta"]);
                    },
                  ),

                  SizedBox(height: 50, width: double.infinity),                  

                ],
              )
            )
            
          ],
        );
      }

    );

    
  }
}