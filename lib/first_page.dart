import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  String? name;
  FirstPage({this.name});
  @override
  _FirstPageState createState() => _FirstPageState(name);
}

enum flag { flagged, unflagged }

class _FirstPageState extends State<FirstPage> {
  String? name;
  _FirstPageState(this.name);

  int count1 = 0;
  flag isPressed = flag.unflagged;
  String? finalAns;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.grey.shade900,
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(name: name),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  var name;

  QuizPage({this.name});
  @override
  _QuizPageState createState() => _QuizPageState(name: name);
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState({this.name});
  String? name;
  int count = 0;
  int qns1 = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Which Of the Below Image is an Animal',
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
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
              interval: Duration(milliseconds: 100),
              onFinished: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                      qns1: qns1,
                      name: name,
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
            child: TextButton(
              //color: selected ? Colors.green : Colors.grey.shade900,
              child: Image(
                image: NetworkImage(
                    'https://animalsmalltalk.files.wordpress.com/2014/03/the-african-elephant.jpg'),
              ),
              onPressed: () {
                qns1 = 1;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Image(
                image: NetworkImage(
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP._7th8gKIQga5nF56JNuLFQHaE8%26pid%3DApi&f=1'),
              ),
              onPressed: () {
                qns1 = 0;
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
                // qns1 ? count++ : count;
                print(qns1);
                print(name);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                              qns1: qns1,
                              name: name,
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.arrow_back_ios_new_rounded),
            // ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                      qns1: qns1,
                      name: null,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
