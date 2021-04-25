import 'package:checkedin_v2/src/blocs/controller_bloc.dart';
import 'package:flutter/material.dart';

class EnterDetailsPage extends StatefulWidget {
  @override
  _EnterDetailsPageState createState() => _EnterDetailsPageState();
}

class _EnterDetailsPageState extends State<EnterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name cannot be Empty';
                    }
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name cannot be Empty';
                    }
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name cannot be Empty';
                    }
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone No:',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name cannot be Empty';
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
