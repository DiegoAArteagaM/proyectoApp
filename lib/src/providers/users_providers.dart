
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:query_params/query_params.dart';

class UserProvider{
  static const  _apikey = 'AIzaSyDGJZbb4-Acx0wtjPrs5nFZ9boOtgd7K6c ';
  SharedPreferences _prefs;
  UserProvider(){
    _loadSharedPreferences();
  }

  void _loadSharedPreferences() async {
    this._prefs = await SharedPreferences.getInstance();
  }
  

  Future<Map<String,dynamic>> register({ String email, String password }) async {
    
    

    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_apikey';
    final Map regData = {
      "email":email.trim(),
      "password":password,
      "returnSecureToken":true
    };


    final  response = await http.post(
      url,
      body:json.encode(regData),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
    );


    final responseMap = json.decode(response.body);


    if( response.statusCode == 200 ){

      // Obtiene el token y el id del usuario y los establece
      // en el almacenamiento del telefono
      final payload = json.decode( B64urlEncRfc7515.decodeUtf8( responseMap["idToken"].split('.')[1] ));


      _prefs.setString("user_id", payload['user_id']);
      _prefs.setInt("expiration", payload['exp']);
      _prefs.setString("user_token", responseMap["idToken"]);

      return {
        "success":true,
        "data":responseMap
      };
    }

    return {
      "success":false,
      "data":responseMap
    };
    
  }


  Future<bool> guardarEncuesta( Map<String, dynamic> encuesta ) async {
    final url ="https://coronapp-4b186.firebaseio.com/encuestas.json";

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    encuesta["id_user"] = _prefs.getString("user_id");
    encuesta["created"] = new DateTime.now().millisecondsSinceEpoch;
    final response = await http.post(
      url,
      body:json.encode(encuesta),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }
    );

    if( response.statusCode == 200  ){
      
      return true;
    }
    else{
      return false;
    }


  }


  Future<Map<String, dynamic>> auth( String email, password )async{
  
    final url ="https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_apikey";
    final data = {"email":email.trim(), "password":password,"returnSecureToken":true};

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(data)
    );

    Map<String,dynamic> respFormated = json.decode(response.body);


    if(response.statusCode == 200){

      final payload = json.decode( B64urlEncRfc7515.decodeUtf8( respFormated["idToken"].split('.')[1] ));
      final userData = await this.getEncuestaByIdUser(respFormated["localId"]);

      this._prefs.setString("user_id", respFormated["localId"]);
      this._prefs.setString("user_token", respFormated["idToken"]);
      this._prefs.setInt("expiration", payload["exp"]);
      this._prefs.setString("name", userData["data"]["name"]);

      return {
        "success":true,
        "id_user":respFormated["localId"],
      };
    }
    else{

      String msg = "";
      if(respFormated["error"]["message"] == "EMAIL_NOT_FOUND"){
        msg ="El usuario no existe";
      }
      else if(respFormated["error"]["message"] == "INVALID_PASSWORD"){
        msg ="Contraseña inválida";
      }
      else{
        msg=respFormated["error"]["message"];
      }

      return {"success":false, "message":msg};
    }
  }

  Future<Map<String,dynamic>> getEncuestaByIdUser( String id_user ) async {
    
    final token = this._prefs.getString("user_token");
    String url ="https://coronapp-4b186.firebaseio.com/encuestas.json?";
    
    // concatenar los parametros a la peticion
    URLQueryParams queryParams = new URLQueryParams();

    //queryParams.append("auth", token);
    queryParams.append("orderBy", "\"id_user\"");
    queryParams.append("equalTo", "\"$id_user\"");
    queryParams.append("limitToLast", 1);

    // añadir los parametros a la url del servicio de firebase
    url=url+queryParams.toString();    

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );

    final respFormated = json.decode(response.body);

    if( response.statusCode == 200 ){
      return {"success":true, "data":respFormated[respFormated.keys.toList()[0]]};
    }
    else{
      return {"success":false};
    }
  }


}