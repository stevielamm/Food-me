import 'package:flutter/material.dart';
import 'Filters.dart';

class randR extends StatefulWidget {
  const randR({Key? key}) : super(key: key);

  @override
  _randRState createState() => _randRState();
}

class _randRState extends State<randR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[100],
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Restaurant Randomizer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 65,
              ),

            ]
            )
        )
    );
  }
}
