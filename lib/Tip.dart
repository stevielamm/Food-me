import 'package:flutter/material.dart';
import 'package:food_app/main.dart';

class TipCalculator extends StatefulWidget {
  TipCalculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double billAmount = 0, tipPercentage = 0, tipAmount = 0, totalAmount = 0;


  void calculate() {
    setState(() {

       tipAmount = billAmount * (tipPercentage / 100);

      totalAmount = billAmount + tipAmount;
    });
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 75.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Tip Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              onChanged: (val) {
                billAmount = double.parse(val);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Total Amount",
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            SizedBox(
              height: 65,
            ),
            TextField(
              onChanged: (val) {
                tipPercentage = double.parse(val);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tip %",
                labelStyle: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                // TODO
                if (billAmount > 0) {
                  calculate();
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 85),
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(18)),
                child: Center(
                child: Text(
                  "Calculate",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            tipAmount != 0
                ? Text(
                    "Tip: \$$tipAmount",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  )
                : Container(),
            SizedBox(
              height: 30,
            ),
            totalAmount != 0
                ? Text(
                    "Total Bill:  \$$totalAmount",
                    style: TextStyle(fontSize: 17),
                  )
                : Container(),

          ],
        ),
      ),


    );
  }
}
