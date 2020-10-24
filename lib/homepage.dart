import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  static const Color cardBackColor = Colors.lightBlueAccent;
  static const Color textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("quotes").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data.docs.map((doc) {
            return doc["quote"] == null && doc["by"] == null
                ? Container()
                : Container(
                    margin: EdgeInsets.all(20),
                    child: Card(
                      elevation: 20,
                      color: cardBackColor,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 9,
                                  child: doc["quote"] == null
                                      ? Container()
                                      : Text(
                                          doc["quote"],
                                          style: TextStyle(
                                              color: textColor, fontSize: 20),
                                        ),
                                ),
                                Expanded(
                                  child: FlatButton(
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    onPressed: (){
                                      FirebaseFirestore.instance.collection("quotes").doc(doc.id).delete();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                doc["by"] == null
                                    ? Container()
                                    : Text(
                                        doc["by"],
                                        style: TextStyle(
                                          color: textColor,
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
            // print(doc["by"]);
          }).toList(),
        );
      },
    );
  }
}
