import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PaymentPicker extends StatefulWidget {
  PaymentPicker({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PaymentPickerState createState() => _PaymentPickerState();
}

class _PaymentPickerState extends State<PaymentPicker> {
  // createAlertDialog(BuildContext context){
  //
  //
  //   return showDialog(context: context,builder: (context) {
  //     return AlertDialog(
  //
  //       title: Text("Lucky Winner ! ",textAlign: TextAlign.center,),
  //       content: TextField(
  //
  //
  //       ),
  //       actions: <Widget>[
  //         MaterialButton(
  //           elevation: 5.0,
  //           child: Text("Okay ! ",),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     );
  //   });
  // }
  List<String> names = ["Steven", "Carl", "Gibby", "Billy"];
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Picker",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[100],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      setState(() {
                        names.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Text(names[index]),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Add new name",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 10, bottom: 10),
                                  isDense: true),
                            ),
                          ),
                          RaisedButton(
                            child: Text("Add"),
                            onPressed: () {
                              addToList();
                            },
                          )
                        ],
                      ),
                      Builder(
                        builder: (context) => RaisedButton(
                            child: Text("Get Random Name"),
                            onPressed: () async {
                              var random = Random();
                              // createAlertDialog(context);
                              await Alert(
                                  context: context,
                                  title: names[random.nextInt(names.length)] + " has to pay :(",
                                  buttons: [
                                    DialogButton(
                                      child: Text("Okay"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ]).show();
                              // Alert(content: Text("Random name is: " + names[random.nextInt(names.length)]));
                            }),
                      )
                    ],
                  )))
        ],
      ),
    );
  }

  void addToList() {
    if (nameController.text.isNotEmpty) {
      setState(() {
        names.add(nameController.text);
      });
    }
  }
}
