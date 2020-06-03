import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _fecha = ""; //Para guardar la seleccion del dateChoose

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

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[

          //Se crean los objetos visuales de la pantalla
          _crearInput(),
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
            onPressed: (){},
          ),   
          
        ],
      ),
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
      firstDate: new DateTime(1920),
      lastDate: new DateTime.now(),
    );

    if(date != null){
      setState(() {
        _fecha = date.toString();
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
}