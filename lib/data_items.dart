import 'dart:async';
import 'dart:convert';
import 'package:covid_cases_tracker/decoration_parameters.dart';
import 'package:covid_cases_tracker/dropdown_selector.dart';
import 'package:covid_cases_tracker/total_case_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class DataItems extends StatefulWidget {
  @override
  _DataItemsState createState() => _DataItemsState();
}

class _DataItemsState extends State<DataItems> {
  dynamic data;
  var confirmed = 0, recovered = 0, deceased = 0;
  List<String> stateCodes;
  Timer timer;
  Future getData() async{
    Response response = await get("https://api.covid19india.org/v4/data.json");
    data = jsonDecode(response.body);
    setState(() {
      this.data = data;
      this.stateCodes = List<String>.of(this.data.keys);
      this.stateCodes.remove('TT');
      print(stateCodes.length);
      getTotalData();
    });
  }

  void getTotalData()
  {
    this.confirmed += data['TT']['total']['confirmed'];
    this.recovered += data['TT']['total']['recovered'];
    this.deceased += data['TT']['total']['deceased'];
  }

  @override
  void initState(){
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
          color: Color(0xFF583D72),
          size: 70,
        );
      }
    else
      return Container(
        child: Column(
          children: [
            // for horizontal scrolling
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Container(
                    width: 150,
                    child: TotalCaseTile(listTitle: "Confirmed", casesCount: confirmed,),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 150,
                    child: TotalCaseTile(listTitle: "Deceased", casesCount: deceased,),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 150,
                    child: TotalCaseTile(listTitle: "Recovered", casesCount: recovered,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
            DropdownStateSelector(stateCodes: stateCodes, data: data,),
          ],
        ),
      );
  }
}
