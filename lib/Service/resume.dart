import 'package:http/http.dart';
import 'dart:convert';
Future <dynamic> resume()async{
var response = await post('https://yazanshmo.000webhostapp.com/YazanWebsite/resume.php');
if (response.statusCode == 200){
  return await json.decode(response.body);
}
else
  return null;
}