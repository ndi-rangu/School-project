// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUserAccount extends StatelessWidget {
  final String documentId;

  GetUserAccount({required this.documentId});

  @override
  Widget build(BuildContext context) {

    // get the collection
    CollectionReference Users = FirebaseFirestore.instance.collection('Users');

    return FutureBuilder<DocumentSnapshot>(
      future: Users.doc(documentId).get(),
      builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map <String, dynamic>;
        return Text(
          'FIRST NAME: ${data['first name']}' + 
          ' ' + 'LAST NAME: ${data['last name']}'
          ' ' + 'ID NUMBER: ${data['ID number']}'
          ' ' + 'CONTACT NUMBER: ${data['Contact details']}'
          ' ' + 'EMAIL: ${data['email']}');
      }
      return Text('loading..');
    }));
  }
}