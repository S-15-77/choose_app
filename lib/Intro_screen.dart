import 'package:choose_app/first_page.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String? name;
  int? count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Quiz APP',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
            // SizedBox(
            //   height: 48.0,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                onChanged: (value) {
                  //print(value);
                  name = value;
                },
                //controller: textFieldValueHolder,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //print(name);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstPage(
                          name: name,
                        ),
                      ),
                    );
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Start the quiz',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
