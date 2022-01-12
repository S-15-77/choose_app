import 'package:choose_app/result_page.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class SecondPage extends StatefulWidget {
  int? qns1;
  String? name;
  SecondPage({required this.name, this.qns1});
  @override
  _SecondPageState createState() => _SecondPageState(name, qns1);
}

enum flag { flagged, unflagged }

class _SecondPageState extends State<SecondPage> {
  _SecondPageState(this.name, this.qns1);
  String? name;
  int? qns1;
  int qns2 = 0;
  //bool selected = false;
  flag isPressed = flag.unflagged;
  //SecondPage({this.count});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        actions: [
          GestureDetector(
            child: Icon(
                isPressed == flag.flagged ? Icons.star : Icons.star_border),
            onTap: () {
              setState(() {
                isPressed = flag.flagged;
              });
            },
            onDoubleTap: () {
              setState(() {
                isPressed = flag.unflagged;
              });
            },
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Some cats are actually allergic to human',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Countdown(
                    seconds: 20,
                    build: (context, time) => Text(
                      time.toString(),
                      style: TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                    interval: Duration(milliseconds: 100),
                    onFinished: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(
                            name: name,
                            qns1: qns1,
                            qns2: qns2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Colors.green,
                    //color: selected ? Colors.green : Colors.grey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      //print(count);
                      qns2 = 1;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    color: Colors.red,
                    child: Text(
                      "FALSE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      qns2 = 0;
                      //The user picked option2.
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      print(qns2);
                      print(name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Result(
                                    name: name,
                                    qns2: qns2,
                                    qns1: qns1,
                                  )));
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(
                            name: name,
                            qns1: qns1,
                            qns2: qns2,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
