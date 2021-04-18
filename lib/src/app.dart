import 'package:checkedin_v2/src/blocs/auth_bloc.dart';
import 'package:checkedin_v2/src/constants.dart';

import 'package:checkedin_v2/src/screens/home.dart';
import 'package:checkedin_v2/src/screens/login.dart';
import 'package:checkedin_v2/src/screens/testconfirm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  Widget buildLoading() => Center(child: CircularProgressIndicator());
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        home: Scaffold(
          body: LoginPage(),
        ),
        theme: ThemeData(
          backgroundColor: kblue,
          scaffoldBackgroundColor: kblue,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
