import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? name;
  String? profilePhoto, email, uid;

  User({this.name, this.uid, this.email, this.profilePhoto});

  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        name: snapshot["name"],
        email: snapshot["email"],
        profilePhoto: snapshot["profilePhoto"],
        uid: snapshot["uid"]);
  }
}