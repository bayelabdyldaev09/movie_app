import 'package:flutter/material.dart';

var richText = RichText(
  text: TextSpan(
    text: 'New Member? ',
    style: TextStyle(fontSize: 16, color: Colors.black),
    children: [
      TextSpan(
        text: 'Register now',
        style: TextStyle(
          color: Color(0xFF6C63FF),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
);

var welcome = Container(
  height: 251,
  alignment: Alignment.center,
  child: Padding(
    padding: const EdgeInsets.fromLTRB(0, 134, 0, 0),
    child: Column(
      children: [
        Text('Welcome Back', style: TextStyle(fontSize: 24)),
        Text(
          'sign in to access your account',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ],
    ),
  ),
);

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: color, width: 1),
    );
  }