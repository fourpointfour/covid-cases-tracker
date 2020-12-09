import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LandingPage extends StatelessWidget {
  // TODO: Remove the next variable
  // var i = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text("Corona Cases Tracker"),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 20, 8, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      spreadRadius: 3.0,
                    ),
                  ],
                ),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Center(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.purpleAccent,
                          child: Text("Get Current Stats"),
                          onPressed: (){
                            print("Get button pressed");
                            Navigator.pushNamed(context, '/dataPage');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Text("Button"),
        //   onPressed: (){
        //     i++;
        //     print("Button Pressed $i");
        //   },
        // ),
      ),
    );
  }
}
