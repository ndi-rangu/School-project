// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class GetFareCollected extends StatelessWidget {
  final String documentId;

  GetFareCollected({required this.documentId});

  @override
  Widget build(BuildContext context) {

    // get the collection
    CollectionReference Fares = FirebaseFirestore.instance.collection('Fares');

    return FutureBuilder<DocumentSnapshot>(
      future: Fares.doc(documentId).get(),
      builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map <String, dynamic>;
        return Text(
          'Monday: ${data['monday']}' + 
          ' ' + 'Tuesday: ${data['tuesday']}'
          ' ' + 'Wednesday: ${data['wednesday']}'
          ' ' + 'Thursday: ${data['thursday']}'
          ' ' + 'Friday: ${data['friday']}'
          ' ' + 'Saturday: ${data['saturday']}'
          ' ' + 'Sunday: ${data['sunday']}');
      }
      return Text('loading..');
    }));
  }
}