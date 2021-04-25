import 'package:checkedin_v2/src/constants.dart';
import 'package:checkedin_v2/src/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kblue,
        title: Text('My Confirm Page'),
      ),
      body: Container(
        child: StreamBuilder(
          //stream is used to again bind the incoming stream and assigns it to an object known as snapshot
          stream: FirebaseFirestore.instance
              .collection('visitors')
              .orderBy('createdOn',
                  descending:
                      true) // Setting the order so the latest entry is recieved at 0 index
              .snapshots(), // Binds the incoming stream of data to snapshot
          builder: (context,
                  snapshot) //builder is used to literally build out the input stream captured in the snapshot
              {
            if (!snapshot
                .hasData) //check for whether data is present or here await and async needs to be implemented while seperating out the functionality
              return Text('Loading Data... Please Wait');
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  snapshot.data.docs[0]
                      ['name'], //accessing the the fieldname of the snapshot,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  snapshot.data.docs[0]['email'],
                ),
                Text(
                  snapshot.data.docs[0]['phone'],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
