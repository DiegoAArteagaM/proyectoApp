import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/providers/users_providers.dart';
import 'package:formvalidation/src/utils/alert_util.dart';


class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  final userProvider = UserProvider();
  
  String _fecha = ""; //Para guardar la seleccion del dateChoose
  String _nombre ="";
  String _email ="";
  String _contrasena="";
  String _dependencia="";

  final _formKey = GlobalKey<FormState>();


  //Variables para controlar la seleccion de los checkBox
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

  TextEditingController _inputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),

      body: Builder(builder: (context)=>
        Container(
          margin: EdgeInsets.all(8.0),
          child: Form(
            key:_formKey,
            child:ListView(
              children:<Widget>[

                  //Se crean los objetos visuales de la pantalla
                  _crearInput(),
                  Divider(),
                  _crearDepenencia(),
                  Divider(),
                  _crearEmail(),
                  Divider(),
                  _crearPass(),
                  Divider(),
                  _crearFecha(context),
                  Divider(),
                  _crearText(),
                  Divider(),
                  _tos(),
                  Divider(),
                  _fiebre(),
                  Divider(),
                  _cansancio(),
                  Divider(),
                  _dolorMuscular(),
                  Divider(),
                  _garganta(),
                  Divider(),
                  _diarrea(),
                  Divider(),
                  _conjuntivitis(),
                  Divider(),
                  _dolorCabeza(),
                  Divider(),
                  _perdidaDelSentido(),
                  Divider(),
                  _erupcionesCutaneas(),
                  Divider(),
                  _dificultadRespirar(),
                  Divider(),
                  _dolorPecho(),
                  Divider(),
                  _dificultadMovimiento(),
                  Divider(),

                  RaisedButton(
                    child : Text("ACEPTAR"),
                    color : Colors.green,
                    textColor: Colors.white,
                    shape: StadiumBorder(),
                    onPressed: (){

                      _registrarPersona(context);

                    },
                ),   
            
              ],
            )
         
          ),
        )
      )
      

    );
  }


  Widget _crearInput(){

    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20) 
        ),
        hintText: "Nombre de la persona",
        labelText: "Nombre",
        helperText: "Es el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
    onChanged: (valor){
      setState(() {
        this._nombre = valor;
      });
    },
    );

  }

  Widget _crearDepenencia(){
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20) 
        ),
        hintText: "Dependencia a la que pertenece",
        labelText: "Dependencia",
        helperText: "Es la de pendencia",
        suffixIcon: Icon(Icons.book),
        icon: Icon(Icons.business)
      ),
    onChanged: (valor){
      setState(() {
        this._dependencia = valor;
      });
    },
    );
  }

  Widget _crearEmail(){
     return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20) 
        ),
        hintText: "Email",
        labelText: "Email",
        helperText: "Correo electronico ",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.mail)
      ),
    onChanged: (valor){
      setState(() {
        this._email =valor;
      });
    },
    );
  }

  Widget _crearPass(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20) 
        ),
        hintText: "Contraseña",
        labelText: "Contraseña",
        helperText: "Contraseña",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock_outline)
      ),
    onChanged: (valor){
      setState(() {
        this._contrasena = valor;
      });
    },
    );
  }

  Widget _crearFecha(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20) 
        ),
        hintText: "Fecha de Nacimiento",
        labelText: "Fecha de Nacimiento",
        helperText: "Fecha de Nacimiento",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
    onTap: (){
      FocusScope.of(context).requestFocus(new FocusNode());
      _selectDate(context);
    },
    );
  }

  void _selectDate(BuildContext context) async{

    DateTime date = await showDatePicker(
      context: context,  
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(1950),
      lastDate: new DateTime.now(),
    );

    if(date != null){
      setState(() {
        _fecha = date.toString().substring(0,10);
        _inputController.text = _fecha;
      });
    }
  }

Widget _tos(){
  return CheckboxListTile(
    title: Text("Tos seca"),
    value:  tos,  
    onChanged: (valor){
      setState(() {
        tos = valor;
      });
    }
  );
}

Widget _fiebre(){
  return CheckboxListTile(
    title: Text("Fiebre"),
    value:  fiebre,  
    onChanged: (valor){
      setState(() {
        fiebre = valor;
      });
    }
  );
}

Widget _cansancio(){
  return CheckboxListTile(
    title: Text("Cansancio o Agotamiento"),
    value:  cansancio,  
    onChanged: (valor){
      setState(() {
        cansancio = valor;
      });
    }
  );
}

Widget _dolorMuscular(){
  return CheckboxListTile(
    title: Text("Dolor Muscular"),
    value:  dolorM,  
    onChanged: (valor){
      setState(() {
        dolorM = valor;
      });
    }
  );
}

Widget _garganta(){
  return CheckboxListTile(
    title: Text("Dolor de Garganta"),
    value:  dolorG,  
    onChanged: (valor){
      setState(() {
        dolorG = valor;
      });
    }
  );
}

Widget _diarrea(){
  return CheckboxListTile(
    title: Text("Diarrea"),
    value:  diarrea,  
    onChanged: (valor){
      setState(() {
        diarrea = valor;
      });
    }
  );
}

Widget _conjuntivitis(){
  return CheckboxListTile(
    title: Text("Conjuntivitis"),
    value:  conjun,  
    onChanged: (valor){
      setState(() {
        conjun = valor;
      });
    }
  );
}

Widget _dolorCabeza(){
  return CheckboxListTile(
    title: Text("Dolor de Cabeza"),
    value:  dolorC,  
    onChanged: (valor){
      setState(() {
        dolorC = valor;
      });
    }
  );
}

Widget _perdidaDelSentido(){
  return CheckboxListTile(
    title: Text("Perdida del sentido del olfato"),
    value:  perdidaOlfato,  
    onChanged: (valor){
      setState(() {
        perdidaOlfato = valor;
      });
    }
  );
}

Widget _erupcionesCutaneas(){
  return CheckboxListTile(
    title: Text("Erupciones Cutaneas"),
    value:  erupciones,  
    onChanged: (valor){
      setState(() {
        erupciones = valor;
      });
    }
  );
}

Widget _dificultadRespirar(){
  return CheckboxListTile(
    title: Text("Dificultad para Respirar"),
    value:  dificultadResp,  
    onChanged: (valor){
      setState(() {
        dificultadResp = valor;
      });
    }
  );
}

Widget _dolorPecho(){
  return CheckboxListTile(
    title: Text("Dolor o presion en el pecho"),
    value:  dolorP,  
    onChanged: (valor){
      setState(() {
        dolorP = valor;
      });
    }
  );
}

Widget _dificultadMovimiento(){
  return CheckboxListTile(
    title: Text("Dificultad para moverse o hablar"),
    value:  dificultadM,  
    onChanged: (valor){
      setState(() {
        dificultadM = valor;
      });
    }
  );
}

Widget _crearText(){
  return Container(
    child: Text("Marque los sintomas que ha presentado en los ultimos 2 dias por favor", ),
  );
  
}

// Esta funcion se conecta al servicion de firebase 
// Y registra a esta persona en la base de datos de
// firestore

  _registrarPersona(BuildContext context){
    this.userProvider.register(
      email:this._email, 
      password: this._contrasena
    ).then((resp){
      if( resp["success"] ){
        this._registrarEncuesta(context);
      }
      else{
        showDialogMsg( context, "Error", resp["data"]["error"]["message"] );
      }
    });
  }

  // Regista la encuesta que fue diligenciada por el usuario
  void _registrarEncuesta( BuildContext context ){
    final formData = {
      "name":this._nombre,
      "email":this._email,
      "dependencia":this._dependencia,
      "birthdate":this._fecha,
      "sintomas":[
        this.tos,
        this.fiebre,
        this.cansancio,
        this.dolorM,
        this.dolorG,
        this.diarrea,
        this.conjun,
        this.dolorC,
        this.perdidaOlfato,
        this.erupciones,
        this.dificultadResp,
        this.dolorP,
        this.dificultadM
      ]

    };

    userProvider.guardarEncuesta(formData).then((resp){
      if( resp ){
        _showMessageRegister(context);
        sleep(const Duration(milliseconds: 1500));
        Navigator.pushNamed(context, "login");
      } 
      else{
        showDialogMsg(context, "Error", "No se pudo almacenar la respuesta");
      }
    });

  }

  void _showMessageRegister( BuildContext context){
    final snackBar = SnackBar(
      content: Text('Usuario Registrado'),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }
}