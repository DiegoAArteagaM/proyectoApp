import 'package:flutter/material.dart';
import 'package:formvalidation/src/providers/users_providers.dart';
import 'package:formvalidation/src/utils/alert_util.dart';
import 'package:formvalidation/src/utils/menu_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Actualizar extends StatefulWidget {


  @override
  _Actualizar createState() => _Actualizar();
}

class _Actualizar extends State<Actualizar> {

  SharedPreferences _prefs;
  UserProvider userProvider= UserProvider();
  Map<String, dynamic> _usrData;

  bool _tos           = false;
  bool _fiebre        = false;
  bool _cansancio     = false;
  bool _dolorM        = false;
  bool _doloG         = false;
  bool _diarrea       = false;
  bool _conjuntivitis = false;
  bool _dolorC        = false;
  bool _perdidaSent   = false;
  bool _erupCutaneas  = false;
  bool _dificultadRes = false;
  bool _dolorPecho    = false;
  bool _dificultadMov = false;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext context, asyncData){
        var body;

        if( asyncData.hasData ){
          
          this._prefs = asyncData.data;

          userProvider.getEncuestaByIdUser(this._prefs.getString("user_id")).then((resp){
            
            this._usrData = resp["data"];
            
           
          });
          body=_getForm(context);
        }
        else{
          body= Container();
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Actualiza tus Síntomas"),
          ),
          drawer: Menu(),
          body: body,
        );


      },
    );
  }

  Widget _getForm(BuildContext context){
    return Form(child: ListView(
      children: <Widget>[
        SizedBox(height: 15),
        Container(
          child: Center(
            child: Text(
              "Actualiza tu información",
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 20, 
                color: Colors.grey[800]
              ),
            ),
          ),
        ),
        CheckboxListTile(
          title: Text("Tos"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _tos,  
          onChanged: (valor){
            setState(() {
              _tos = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Fiebre"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _fiebre,  
          onChanged: (valor){
            setState(() {
              _fiebre = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Cansancio"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _cansancio,  
          onChanged: (valor){
            setState(() {
              _cansancio = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Dolor Muscular"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _dolorM,  
          onChanged: (valor){
            setState(() {
              _dolorM = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Dolor de Garganta"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _doloG,  
          onChanged: (valor){
            setState(() {
              _doloG = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Diarrea"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _diarrea,  
          onChanged: (valor){
            setState(() {
              _diarrea = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Conjuntivitis"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _conjuntivitis,  
          onChanged: (valor){
            setState(() {
              _conjuntivitis = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Dolor de Cabeza"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _dolorC,  
          onChanged: (valor){
            setState(() {
              _dolorC = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Perdida del Sentido"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _perdidaSent,  
          onChanged: (valor){
            setState(() {
              _perdidaSent = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Erupciones Cutaneas"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _erupCutaneas,  
          onChanged: (valor){
            setState(() {
              _erupCutaneas = valor;
            });
          }
        ),
        
        CheckboxListTile(
          title: Text("Dificultad para Respirar"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _dificultadRes,  
          onChanged: (valor){
            setState(() {
              _dificultadRes = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Dolor de Pecho"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _dolorPecho,  
          onChanged: (valor){
            setState(() {
              _dolorPecho = valor;
            });
          }
        ),
        CheckboxListTile(
          title: Text("Dificultad de Movimiento"),
          checkColor: Colors.green[900],
          activeColor: Colors.white,
          value:  _dificultadMov,  
          onChanged: (valor){
            setState(() {
              _dificultadMov = valor;
            });
          }
        ),
        Container(
          child: Center(
            child: FlatButton(
              color: Colors.green,
              child: Text(
                "Actualizar",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
              onPressed: (){
                _guardarEncuesta(context);
              }
            )
          )
          ),
        
        
      ],
    ));
  }


  void _guardarEncuesta(BuildContext context){
    final sintomas=[
      this._tos,
      this._fiebre,
      this._cansancio,
      this._dolorM,
      this._doloG,
      this._diarrea,
      this._conjuntivitis,
      this._dolorC,
      this._perdidaSent,
      this._erupCutaneas,
      this._dificultadRes,
      this._dolorPecho,
      this._dificultadMov
    ];

    this._usrData["sintomas"] = sintomas;

    userProvider.guardarEncuesta(this._usrData).then((resp){
      if( resp ){
        showDialogMsg(context, "Mensaje", "Información actualizada");
      }
      else{
        showDialogMsg(context, "Error", "No se pudo actualizar los \n síntomas");
      }
    });
  }
}