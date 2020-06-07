
import 'package:flutter/material.dart';
import 'package:formvalidation/src/providers/users_providers.dart';
import 'package:formvalidation/src/utils/alert_util.dart';

class LoginPage extends StatefulWidget{

  @override
  _LoginPage createState()=>_LoginPage();
  
}


class _LoginPage extends State<LoginPage>{

  String _mail;
  String _password;
  UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.arrow_back),
        onPressed: (){         
          Navigator.pop(context);
        }
      )
    );
  }

  Widget _loginForm(BuildContext context){
    final size = MediaQuery.of(context).size;    

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SafeArea(
            child:Container(
              height: 230.0,
            ) 
          ),

          Container(
            width: size.width*0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color:Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
                )
              ]


            ),
            child: Column(
              children: <Widget>[
                Text("Ingreso", style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 30.0),
                _crearEmail(), 
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 30.0),
                _crearBoton(context)
              ],
            ),
          ),
        
          Text("¿Olvidó su contraseña?")
        ],
      ),
    );

  }

  Widget _crearEmail(){

    return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),

            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon : Icon(Icons.alternate_email, color: Colors.green),
                hintText: "ejemplo@correo.com",
                labelText: "Correo Electronico",
              ),
              onChanged: (mail){
                setState((){
                  this._mail = mail;
                });
              }  ,
            ),
          );
      
  }

   Widget _crearPassword(){
    
   return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon : Icon(Icons.lock_outline, color: Colors.green),
              labelText: "Contraseña",
            
            ),
            onChanged: (password){
              setState((){
                this._password = password;
              });
            } ,
          ),
        );
      
   }

  Widget _crearBoton(BuildContext context){
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Text("Ingresar"),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      elevation: 0.0,
      color: Colors.green,
      textColor: Colors.white,
      onPressed: (){
        _login(context );
      } 
    );
  }

  Widget _crearFondo(BuildContext context){

    final size = MediaQuery.of(context).size;

    final fondo = Container(
      height: size.height*0.4,
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

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );

    return Stack(
      children: <Widget>[
        fondo,
        Positioned(top: 90.0, left:30.0, child: circulo),
        Positioned(top: -40.0, right:-30.0, child: circulo),
        Positioned(bottom: -50.0, right:-10.0, child: circulo),
        Positioned(bottom: 120.0, right:20.0, child: circulo),
        Positioned(bottom: -50.0, left:-20.0, child: circulo),

        Container(
          padding: EdgeInsets.only(top:80.0),
          child:Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle, color : Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text("Iniciar Sesion", style: TextStyle(color : Colors.white, fontSize: 25.0))
            ],
          )
        )
        
      ],
    );
  }


  void _login(BuildContext context){
    final mail = this._mail;
    final password = this._password;

    userProvider.auth(mail, password).then((resp){

      if( resp["success"]==false ){
        showDialogMsg(context, "Error", resp["message"]);
      }
      else{
        Navigator.pushReplacementNamed(context, "/dashboard");
      }

    });
  }

  
}