
import 'package:formvalidation/src/providers/users_providers.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/scan_page.dart';
import 'package:formvalidation/src/providers/rutas_provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String qrEscaneado;
  UserProvider userProvider = UserProvider();
  final rutasProvider = new RutasProvider();
  Map<String, dynamic> mapa = Map();
  String name;
  List<dynamic> sintomas;

  String titulo1 = "Ten en cuenta";
  String titulo2 = "No mientas";
  String titulo3 = "Cuidate";

  String texto1 = "El correcto funcionamiento de esta aplicaion esta sujeto a la veracidad de la informacion proporcinada por los usuarios, por tal razon te solicitamos que los datos que brindes lo hagas de forma etica y sincera";
  String texto2 = "La sinceridad de tus respuestas es primordial, por este motivo te recordamos que la Normatividad Colombiana para enfrentar la emergencia sanitaria en el Articulo 368 del codigo penal, obliga a la poblacion a seguir las indicaciones del gobierno para prevenir la propagacion del Covis-19, si mientes sobre tu estado de salud frente al Virus violaras este articulo ";
  String texto3 = "Esta App fue desarrollada con el fin de ayudar a mitigar los efectos del Covid-19, usa la opcion actualizar datos para actualizar tu estado de salud a diario y ayudar al Quindio a superar la emergencia sanitaria";

  Future _scanQR() async {
    
    try{ 
      dynamic scan = (await BarcodeScanner.scan()).rawContent.toString();
      qrEscaneado = scan;
      print("se escaneo >>>>>>>>>>>>>>>>>>>>>>>>>> $qrEscaneado");
    }catch(e){
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("QRona"),
      ),
      body : Stack(
        children: <Widget>[          
          _crearPantalla(context),         
        ],
      ),
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Colors.green,
        child: Icon(Icons.camera_alt, color: Colors.white, size: 40.0,),
        onPressed: (){

          _scanQR().then((valor){
                        return userProvider.getEncuestaByIdUser(qrEscaneado);                        
                      }).then((response){
                        print(response);
                        this.mapa = response;
                        Navigator.of(context).push(MaterialPageRoute( 
                            builder: (context) => ScanPage(qrEscaneado, this.mapa["data"]),
                          )
                        );
                      });  

        },      
      ),
    );
  }

  Widget _crearPantalla(BuildContext context){

    return FutureBuilder(

      //Sentencia para leer las rutas del Json
      future: rutasProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){
          final List<dynamic> opt = snapshot.data; 

          return Stack(
          children: <Widget>[ //Dibuja un circulo en el fondo

            Container(
              padding: EdgeInsets.only(top:10.0),
              child:Column(
                children: <Widget>[
                  card(texto2, titulo2),

                  SizedBox(height: 10, width: double.infinity),
                  card(texto1, titulo1),

                  SizedBox(height: 10, width: double.infinity),
                  card(texto3, titulo3),

                  SizedBox(height: 50, width: double.infinity),  
                  //Boton ingresar
                  RaisedButton(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                      child: Text("Ingresar", style: TextStyle(fontSize: 25, color: Colors.green)),
                    ),
                    shape: StadiumBorder(),
                    elevation: 0.0,
                    onPressed: (){
                      Navigator.pushNamed(context, opt[0]["ruta"]);
                    },
                  ),

                  SizedBox(height: 10, width: double.infinity),          

                  //Boton Registro
                  RaisedButton(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                        child: Text("Registrarse", style: TextStyle(fontSize: 25, color: Colors.green)),
                      
                    ),
                    shape: StadiumBorder(),
                    
                    elevation: 0.0,
                    
                    onPressed: (){
                      Navigator.pushNamed(context, opt[1]["ruta"]);
                    },
                  ),


                ]
                    
                ),
            
              )
            
          ],
        );
      }

    ); 
  }

  Widget card(String texto, String titulo){
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.green, size: 50.0,),
            title: Text(titulo),
            subtitle: Text(texto),
          )
        ],
      ),
    );
  }
  
}