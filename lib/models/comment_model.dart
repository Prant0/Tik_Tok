import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String userName, comment, profilePhoto, uid, id;
  List likes;
  final datePublished;

  CommentModel({required this.uid,
    required this.likes,
    required this.id,
    required this.profilePhoto,
    required this.userName,
    required this.comment,
    required this.datePublished});

  Map<String, dynamic> toJson() =>
      {
        "username": userName,
        "comment": comment,
        "datePublished": datePublished,
        "likes": likes,
        "profilePhoto": profilePhoto,
        "uid": uid,
        "id": id,

      };

  static CommentModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return CommentModel(
        uid: snapshot["uid"],
        likes:  snapshot["likes"],
        id:  snapshot["id"],
        profilePhoto:  snapshot["profilePhoto"],
        userName:  snapshot["username"],
        comment:  snapshot["comment"],
        datePublished:  snapshot["datePublished"]);
  }
}
