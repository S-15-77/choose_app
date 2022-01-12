import 'package:choose_app/Intro_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';

final _firestore = FirebaseFirestore.instance;

class Result extends StatefulWidget {
  int? qns1;

  Result({this.name, this.qns2, this.qns1});
  String? name;
  int? qns2;
  @override
  _ResultState createState() =>
      _ResultState(name: name, qns2: qns2, qns1: qns1);
}

class _ResultState extends State<Result> {
  _ResultState({this.name, this.qns2, this.qns1});
  String? name;
  int? qns2;
  int? qns1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text("RESULT"),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                color: Colors.grey.shade600,
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          '${qns2! + qns1!}',
                          style: TextStyle(fontSize: 100.0),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text("This is the Score Secured by the $name")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              _firestore.collection('Result').add(
                                  {'name': name, 'score': (qns2! + qns1!)});

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IntroScreen()));
                            },
                            child: Text("ReTake",
                                style:
                                    TextStyle(color: Colors.lightBlueAccent)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
