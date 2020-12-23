import 'dart:async';
import 'dart:convert';
import 'package:covid_cases_tracker/decoration_parameters.dart';
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
  var confirmed = 32, recovered = 0, deceased = 0;
  List<String> stateCodes;
  Timer timer;
  Future getData() async{
    Response response = await get("https://api.covid19india.org/v4/data.json");
    data = jsonDecode(response.body);
    print(data.keys);
    setState(() {
      this.data = data;
      this.stateCodes = List<String>.of(this.data.keys);
      getTotalData();
    });
  }

  void getTotalData()
  {
    print(stateCodes.length);
    stateCodes.map((String stateCode){
      this.confirmed += data[stateCode]["total"]["confirmed"];
      this.deceased += data[stateCode]["total"]["deceased"];
      this.recovered += data[stateCode]["total"]["recovered"];
    });
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
          color: Colors.yellowAccent,
          size: 70,
        );
      }
    else
      return Container(
        child: Column(
          children: [
            // for horizontal scrolling
            Container(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Container(
                    width: 180,
                    child: TotalCaseTile(listTitle: "Confirmed", casesCount: confirmed,),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 180,
                    child: TotalCaseTile(listTitle: "Deceased", casesCount: deceased,),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 180,
                    child: TotalCaseTile(listTitle: "Recovered", casesCount: recovered,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: stateCodes.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: EdgeInsets.all(8),
                      height: 100,
                      decoration: decoration_for_cases,
                      child: ExpansionTile(
                        title: Text(stateCodes[index]),
                        children: [Text("Hello subtitle!"),],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
  }
}
