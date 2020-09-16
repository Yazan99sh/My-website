import 'package:http/http.dart';
import 'dart:convert';
Future <dynamic> portfolio()async{
  var response = await post('https://yazanshmo.000webhostapp.com/YazanWebsite/portfolio.php');
  if (response.statusCode == 200){
    return json.decode(response.body);
  }
  else
    return null;
}