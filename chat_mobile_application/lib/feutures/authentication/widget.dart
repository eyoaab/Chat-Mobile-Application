import 'package:flutter/material.dart';

InputDecoration customInputDecoration({
  required String labelText,
  required Icon suffixIcon,
  Color enabledBorderColor = Colors.blue,
  Color errorBorderColor = Colors.red,
}) {
  return InputDecoration(
    labelText: labelText,
    fillColor: Colors.white,
    filled:true,

    suffixIcon: suffixIcon,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      
      borderSide: BorderSide(color: enabledBorderColor,width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      
      borderSide: const BorderSide(color: Colors.grey
),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      
      borderSide: BorderSide(color: errorBorderColor,width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      
      borderSide: BorderSide(color: errorBorderColor,width: 2.0),
    ),
  );
}


InputDecoration passwordInputDecoration({
  required String labelText,
  required bool isPasswordVisible,
  required VoidCallback togglePasswordVisibility,
}) {
  return InputDecoration(
    labelText: labelText,
    fillColor: Colors.white,
    filled: true,
    suffixIcon: IconButton(
      icon: Icon(
        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        color: Colors.grey,
      ),
      onPressed: togglePasswordVisibility,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      
      borderSide: const BorderSide(color: Colors.grey), 
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      
      borderSide: const BorderSide(color: Colors.grey, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
    ),
     enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      
      borderSide: const  BorderSide(color: Colors.blue,width: 2.0),
    ),
  );
}


bool isValidEmail(String email) {
  String emailPattern =
      r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';

  RegExp regExp = RegExp(emailPattern);

  return regExp.hasMatch(email);
}