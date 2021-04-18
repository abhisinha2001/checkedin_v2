import 'dart:async';

import 'package:checkedin_v2/src/blocs/auth_bloc.dart';
import 'package:checkedin_v2/src/models/visitor.dart';
import 'package:checkedin_v2/src/screens/confirmPage.dart';
import 'package:checkedin_v2/src/screens/home.dart';
import 'package:checkedin_v2/src/screens/testconfirm.dart';
import 'package:checkedin_v2/src/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StreamSubscription<User> loginStateSubscription;
  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => TestPage()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.white,
                ),
                SignInButton(
                  buttonType: ButtonType.google,
                  onPressed: () {
                    authBloc.loginWithGoogle();
                  },
                ),
              ]
              // ElevatedButton(
              //     style: ButtonStyle(
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //         RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(30.0),
              //         ),
              //       ),
              //     ),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       height: 60,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Text(
              //             'Check-In',
              //             style: TextStyle(
              //                 fontSize: 30, fontWeight: FontWeight.bold),
              //           ),
              //           Icon(
              //             Icons.arrow_right_alt_rounded,
              //             size: 60,
              //           ),
              //         ],
              //       ),
              //     ),
              //     onPressed: () {
              //       print(Authentication.signInWithGoogle());
              //     }),

              ),
        ),
      ),
    );
  }
}
