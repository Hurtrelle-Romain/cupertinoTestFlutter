import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class iOSPage extends StatefulWidget {

  @override
  iOSState createState() =>  iOSState();
}



class iOSState extends State<iOSPage> {

  bool loveIt = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Design sous iOS"),
          leading: Icon(Icons.source),
          backgroundColor: Colors.white,
        ),
        child: Column(
          children: [
            CupertinoButton(
                color: Colors.lightBlueAccent,
                child: Text((loveIt) ? "I love Flutter" : "php is my favorite"),
                onPressed: () {
                  setState(() {
                    loveIt = !loveIt;
                  });
                })
          ],
        )
    );
  }
}