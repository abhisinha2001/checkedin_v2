import 'package:checkedin_v2/constants.dart';
import 'package:checkedin_v2/src/providers/google_sign_in.dart';
import 'package:checkedin_v2/src/screens/LoggedInWidget.dart';
import 'package:checkedin_v2/src/screens/home.dart';
import 'package:checkedin_v2/src/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  Widget buildLoading() => Center(child: CircularProgressIndicator());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                final provider = Provider.of<GoogleSignInProvider>(context);
                if (provider.isSigningIn) {
                  return buildLoading();
                } else if (snapshot.hasData) {
                  return LoggedInWidget();
                } else {
                  return LoginPage();
                }
              }),
        ),
      ),
      theme: ThemeData(
        backgroundColor: kblue,
        scaffoldBackgroundColor: kblue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
