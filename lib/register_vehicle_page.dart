// ignore_for_file: unused_import, prefer_const_constructors

import 'package:bakaki_matatu_app/get_vehicle_registered.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VehiclePage extends StatefulWidget {

  const VehiclePage({super.key});

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  final User = FirebaseAuth.instance.currentUser!;


  // document IDs
  List<String> docIDs = [];

  //getting docIDs
  Future getDocID() async {
    await FirebaseFirestore.instance.collection('Vehicle').get().then((snapshot) => 
    snapshot.docs.forEach((document) {
      print(document.reference);
      docIDs.add(document.reference.id);
     }
     ),
     );

  }


  // controllers
  final _vehicleController = TextEditingController();

@override
  void dispose(){
    _vehicleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text( 
          User.email!,style: TextStyle(fontSize: 16),),
          actions: [
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                },
              child: Icon(Icons.logout)),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //vehicle registration
              TextField(
                controller: _vehicleController,
                decoration: const InputDecoration(
                  hintText: 'Enter vehicle registration number',
                  border: OutlineInputBorder(),
                ),
              ),
              //register button
              MaterialButton(
                onPressed: (){},
                color: Colors.blue,
                child: Text('REGISTER',style: TextStyle(color: Colors.white),
                ),
                ),
                // display registered vehicles
                Expanded(
                  child: FutureBuilder(
                future: getDocID(),
                builder: (context, snapshot) {
                return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal:55.0),
                    child: ListTile(
                      tileColor: Colors.lightGreenAccent,
                              title: GetVehicleRegistered(
                                documentId: docIDs[index]),
                      ),
                  );
                  },
               );
              },
            ),
          ),
            ],
          ),
      )
    );
  }
}