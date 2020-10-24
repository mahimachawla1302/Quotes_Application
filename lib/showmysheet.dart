import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MySheet extends StatefulWidget {
  @override
  _MySheetState createState() => _MySheetState();
}

class _MySheetState extends State<MySheet> {
  String quote;
  String qtBy;

  void addToDB(String quote, String qtBy) async {
    await FirebaseFirestore.instance
        .collection("quotes")
        .add({'quote': quote, 'by': qtBy});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: <Widget>[
              Expanded(child: Text("Quote:")),
              Expanded(
                flex: 7,
                child: TextField(
                textAlign: TextAlign.center,
                onChanged: (val) {
                  quote = val;
                },
            ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: Text("By:")),
              Expanded(
                flex: 7,
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    qtBy = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            child: Text("Add",style: TextStyle(fontSize: 20, color: Colors.white),),
            onPressed: () {
              addToDB(quote, qtBy);
              Navigator.pop(context);
            },
            color: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}
