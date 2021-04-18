import 'dart:async';

import 'package:checkedin_v2/src/blocs/auth_bloc.dart';
import 'package:checkedin_v2/src/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  StreamSubscription<User> loginStateSubscription;
  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()));
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
      body: Center(
        child: StreamBuilder<User>(
          stream: authBloc.currentUser,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  snapshot.data.displayName,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      snapshot.data.photoURL.replaceFirst('s96', 's400')),
                  radius: 60,
                ),
                SignInButton(
                    buttonType: ButtonType.google,
                    btnText: 'Sign Out of google',
                    onPressed: () {
                      authBloc.logout();
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
