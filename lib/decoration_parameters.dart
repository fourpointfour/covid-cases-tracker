import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const decoration_for_cases = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
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
  fontWeight: FontWeight.w600,
  fontSize: 23,
);

const stateTileSubtitleTextStyle = TextStyle(
  fontSize: 19,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);