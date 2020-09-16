import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
Future SendEmail(String message, String email, String name)async{
  var response = await post('https://yazanshmo.000webhostapp.com/YazanWebsite/mail.php',body: {
    'message':message,
    'name':name,
    'From':email
  });
  if (response.statusCode == 200){
    print(response.body.toString());
   return true;
  }
  else {
    return false;
  }
}