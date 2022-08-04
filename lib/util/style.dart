import 'package:flutter/material.dart';

InputDecoration textFieldDecoration({required String hintText}) => InputDecoration(
  label: Text(hintText),
  labelStyle: TextStyle(
      color: Color(0xFFB1B1B1)),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFB1B1B1),
      width: 0.5,
    ),
    borderRadius: BorderRadius.circular(50),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFB1B1B1),
      width: 0.5,
    ),

    borderRadius: BorderRadius.circular(50),
  ),
  contentPadding:
  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
);