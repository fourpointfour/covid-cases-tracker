import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFFFCF8E8),
        appBar: AppBar(
          backgroundColor: Color(0xFFFCF8E8),
          elevation: 0,
          leading: MyIcon(),
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
                      Container(
                        padding: EdgeInsets.only(left: 7, right: 7),
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset('lib/assets/title.png'),
                      ),
                      // the following container would contain the button to
                      // navigate to the dataPage
                      Container(
                        margin: EdgeInsets.only(top: 80),
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

class MyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      icon: Icon(Icons.info, color: Colors.black,),
      onPressed: (){
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xFFDF7861),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                      "About the developer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Vaibhav Kushwaha',
                      style: TextStyle(
                          fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.black,),
                        SizedBox(width: 7),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20,
                            ),
                            text: 'vaikushbhav@gmail.com',
                            recognizer: TapGestureRecognizer()..onTap = () async {
                              final String url = 'mailto:vaikushbhav@gmail.com';
                              if(await canLaunch(url))
                                await launch(url);
                            },
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Row(
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            child: Image.asset(
                              'lib/assets/github.png',
                            ),
                          ),
                          SizedBox(width: 7),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 20,
                              ),
                              text: 'fourpointfour',
                              recognizer: TapGestureRecognizer()..onTap = () async {
                                final String url = 'https://www.github.com/fourpointfour';
                                if(await canLaunch(url))
                                  await launch(url);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

