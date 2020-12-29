import 'package:flutter/material.dart';

const decoration_for_cases = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  // color: Colors.orangeAccent,
);

const stateCaseTileParameter = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(6)),
  boxShadow: [
    BoxShadow(
      color: Colors.black26,
      spreadRadius: 3,
      blurRadius: 5,
    ),
  ]
);

const stateTileTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const stateTileSubtitleTextStyle = TextStyle(
  fontSize: 15,
);