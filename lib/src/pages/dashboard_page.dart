import 'package:flutter/material.dart';
import 'package:formvalidation/src/utils/menu_util.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatelessWidget {


  SharedPreferences _prefs;
  /**
   * Este es un constructor asincrono que 
   * primero obtiene el id del usuario para 
   * poder obtener su informacion y construir su 
   * qr
   */
  @override build( BuildContext context ){
    
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, asynData){
        
        Widget body;
        
        if(asynData.hasData){

          this._prefs = asynData.data;
          body = _buildBody(context);
        
        }
        else{
          body = Container();
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Bienvenido"),
            //automaticallyImplyLeading:t,
            
          ),
          drawer: Menu(),
          body:  body,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            }
          ),
        

          
        );
      },
    );

  }


 
  Widget _buildBody(BuildContext context){
    return Column(
      children: <Widget>[
        SizedBox(
          height: 80.0,
        ),
        Center(
          child: Text(
            "Hola "+this._prefs.getString("name"),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.green[900],
            ),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Center(
          child: Text(
            "ESTE ES TU CODIGO QR",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.grey[850],
            ),
          ),
        ),
        SizedBox(height: 15),
        Center(
          child: QrImage(
            data: this._prefs.getString("user_id"),
            version: QrVersions.auto,
            size: 300.0,
          ),
        )
      ],
    );
  }
}