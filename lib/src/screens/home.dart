import 'package:checkedin_v2/src/constants.dart';
import 'package:checkedin_v2/src/models/visitor.dart';
import 'package:checkedin_v2/src/screens/confirmPage.dart';
import 'package:checkedin_v2/src/services/firestore_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirestoreService firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: kblue,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Check-In',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_right_alt_rounded,
                              size: 60,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Visitor visitor = Visitor(
                            name: 'Abhinav Singh',
                            email: 'abhisinha0501@gmail.com',
                            phone: '8123920076');
                        firestoreService.setVisitor(visitor);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ConfirmPage()));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   body: Center(child: Text('Hello there!')),
//   floatingActionButton: FloatingActionButton(
//     child: Icon(Icons.add),
//     onPressed: () {
//       Visitor visitor = Visitor(
//           name: 'Abhinav Singh',
//           email: 'abhisinha0501@gmail.com',
//           phone: '8123920076');

//       firestoreService.setVisitor(visitor);
//       firestoreService.getEntries();
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => ConfirmPage()));
//     },
//   ),
// );
