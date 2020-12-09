import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class DataItems extends StatefulWidget {
  @override
  _DataItemsState createState() => _DataItemsState();
}

class _DataItemsState extends State<DataItems> {
  var data;
  Future getData() async{
    Response response = await get("https://api.covid19india.org/v4/data.json");
    data = jsonDecode(response.body);
    print(data.length);
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData().then((data){
      setState(() {
        this.data = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(data == null)
      {
        return SpinKitDualRing(
          color: Colors.yellowAccent,
          size: 70,
        );
      }
    else
      return Text("This is proof that data is retrieved successfully");
  }
}
