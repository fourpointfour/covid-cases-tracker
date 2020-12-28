import 'package:covid_cases_tracker/data_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFFCF8E8),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: DataItems(),
          )
        ),
      ),
    );
  }
}
