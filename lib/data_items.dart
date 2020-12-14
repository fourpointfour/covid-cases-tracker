import 'dart:async';
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
  var stateCodes;
  Timer timer;
  Future getData() async{
    Response response = await get("https://api.covid19india.org/v4/data.json");
    data = jsonDecode(response.body);
    print(data.keys);
    setState(() {
      this.data = data;
      this.stateCodes = List<String>.of(this.data.keys);
    });
  }

  void getDataContinuously() async {

  }

  @override
  void initState() {
    super.initState();

    getData();
    //TODO: Uncomment the following function to retrieve data continuously
    // timer = Timer.periodic(Duration(seconds: 40), (Timer t) => getData());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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
      return ListView.builder(
        itemCount: stateCodes.length,
        itemBuilder: (BuildContext context, int index){
          //stateCodes[index] is the state code
          return Container(
            margin: EdgeInsets.fromLTRB(5, 8, 5, 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
            ),
            child: ListTile(
              title: Text(stateCodes[index]),
            ),
          );
        },
      );
  }
}
