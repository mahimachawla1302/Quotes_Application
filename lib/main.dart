import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/homepage.dart';
import 'package:firebase_example/showmysheet.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return MySheet();
                  });
            },
          ),

        appBar: AppBar(
          title: Text('Quotes'),
        ),
        body: Homepage(),
      );

  }
}
