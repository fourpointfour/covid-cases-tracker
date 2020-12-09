import 'package:covid_cases_tracker/dataPage.dart';
import 'package:covid_cases_tracker/landingPage.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    routes: {
      '/' : (context) => LandingPage(),
      '/dataPage' : (context) => DataPage(),
    },
  ));
}