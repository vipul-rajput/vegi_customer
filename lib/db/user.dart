//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices{
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";

  createUser(Map value){
    _database.reference().child(ref).push().set(
        value
    ).catchError((e) => { print(e.toString())});
  }
}


//class UserServices{
//  Firestore _firestore = Firestore.instance;
//  String collection = "users";
//
//  void createUser(Map data) {
//    _firestore.collection(collection).document(data["userId"]).setData(data);
//  }
//}