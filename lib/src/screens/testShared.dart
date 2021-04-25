import 'package:checkedin_v2/src/services/userSimpleServices.dart';
import 'package:flutter/material.dart';

class TestShared extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(UserSimpleServices.getEmail()),
    );
  }
}
