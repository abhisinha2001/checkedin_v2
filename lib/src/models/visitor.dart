import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:flutter/material.dart';

class Visitor {
  final String name;
  final String email;
  final String phone;

  Visitor({
    this.name,
    this.email,
    this.phone,
  });

  factory Visitor.fromMap(Map<String, dynamic> data) {
    return Visitor(
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'createdOn': FieldValue.serverTimestamp()
    };
  }
}
