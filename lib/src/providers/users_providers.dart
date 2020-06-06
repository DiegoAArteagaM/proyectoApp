import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class UserProvider{
  static const  _apikey = 'AIzaSyDGJZbb4-Acx0wtjPrs5nFZ9boOtgd7K6c ';
  

  Future<Map<String,dynamic>> register({ String email, String password }) async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_apikey';
    final Map regData = {
      "email":email,
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


    print(response.body);

    final responseMap = json.decode(response.body);


    if( response.statusCode == 200 ){

      // Obtiene el token y el id del usuario y los establece
      // en el almacenamiento del telefono
      final payload = json.decode( B64urlEncRfc7515.decodeUtf8( responseMap["idToken"].split('.')[1] ));


      prefs.setString("user_id", payload['user_id']);
      prefs.setInt("expiration", payload['exp']);
      prefs.setString("user_token", responseMap["idToken"]);

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

    SharedPreferences prefs = await SharedPreferences.getInstance();

    encuesta["id_user"] = prefs.getString("user_id");
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
}