// ignore_for_file: unused_import, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetVehicleRegistered extends StatelessWidget {
  final String documentId;

  GetVehicleRegistered({required this.documentId});

  @override
  Widget build(BuildContext context) {

    // get the collection
    CollectionReference Vehicle = FirebaseFirestore.instance.collection('Vehicle');

    return FutureBuilder<DocumentSnapshot>(
      future: Vehicle.doc(documentId).get(),
      builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map <String, dynamic>;
        return Text(
          'Vehicle: ${data['Vehicle']}');
      }
      return Text('loading..');
    }));
  }
}