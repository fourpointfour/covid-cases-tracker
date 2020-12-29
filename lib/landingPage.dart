import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingPage extends StatelessWidget {
  // TODO: Remove the next variable
  // var i = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFFCF8E8),
        appBar: AppBar(
          backgroundColor: Color(0xFFFCF8E8),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.info,
            ),
            iconSize: 30,
            onPressed: (){},
            color: Colors.black,
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                          "Corona Cases\nTracker",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.red,
                        ),
                      ),
                      // the following container would contain the button to
                      // navigate to the dataPage
                      Container(
                        margin: EdgeInsets.only(top: 200),
                        width: 210,
                        decoration: BoxDecoration(
                          color: Color(0xFFDF7861),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.format_list_numbered,
                                size: 10,
                              ),
                              Text("Get Cases Count"),
                            ],
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, '/dataPage');
                          },
                        ),
                      ),
                      Container(
                        height: 250,
                        width: 250,
                        child: FlareActor(
                          'lib/assets/coronavirus.flr',
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: 'move',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
