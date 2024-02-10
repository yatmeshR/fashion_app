

import 'package:cloud_firestore/cloud_firestore.dart';

class Arrival {
  final String imagepath;
  final double rate;
  final String name;
  final int prize;



  Arrival(
      {required this.imagepath,
      required this.rate,
      required this.name,
      required this.prize,
      });


  static Arrival fromSnapshot(DocumentSnapshot snap) {
    Arrival arrival = Arrival(
        imagepath: snap['imagepath'],
        rate: snap['rate'],
        name: snap['name'],
        prize: snap['prize'],
    );
    return arrival;
  }
}

List<Arrival> cartItems = [];

List<Arrival> wishItems = [];
