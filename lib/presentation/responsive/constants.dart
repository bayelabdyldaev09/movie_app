import 'package:flutter/material.dart';

Container filmType(String type) {
  return Container(
    height: 18,
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    margin: EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Color(0xFFDBE3FF),
    ),
    child: Text(
      type,
      style: TextStyle(
        color: Color(0xFF88A4E8),
        fontSize: 8,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

var rate = Wrap(
  crossAxisAlignment: WrapCrossAlignment.center,
  spacing: 4,
  children: [
    Icon(Icons.star, color: Color(0xFFFFC319), size: 16),
    Text(
      '9.1/10 IMDb',
      style: TextStyle(
        color: Color(0xFF9C9C9C),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  ],
);
