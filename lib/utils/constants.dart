import 'package:flutter/material.dart';

class APIConstants {
  
  //email
  static String emailBaseUrl =
      'https://emailvalidation.abstractapi.com/v1/?api_key=';
  static String emailAPIKey = 'c6e241984d364cb682cce7641b8f6cd2';

  //phone
   static String phoneBaseUrl =
      'https://phonevalidation.abstractapi.com/v1/?api_key=';
  static String phoneAPIKey = '1138c9b5fc1d4b1dbc82d728fd238971';
}

const String successImage = 'asset/images/success.svg';
const String failImage = 'asset/images/fail.svg';
const String validImage = 'asset/images/done.svg';
const String invalidImage = 'asset/images/email_fail.svg';
const String phoneImage = 'asset/images/phone_success.svg';



const resultTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
const constantSpacing = SizedBox(height: 17.5);
