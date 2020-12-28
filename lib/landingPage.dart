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
                        margin: EdgeInsets.only(top: 250),
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
