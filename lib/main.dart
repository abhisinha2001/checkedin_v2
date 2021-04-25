import 'package:checkedin_v2/src/services/userSimpleServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await UserSimpleServices.init();
  runApp(App());
}
