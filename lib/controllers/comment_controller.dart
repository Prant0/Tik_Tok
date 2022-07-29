import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tok_tok/models/comment_model.dart';
import 'package:tok_tok/widget/brand_colors.dart';

class CommentController extends GetxController {
  final Rx<List<CommentModel>> _comments = Rx<List<CommentModel>>([]);

  List<CommentModel> get comments => _comments.value;
  String _postId = "";

  updatePostId(String id) {
    _postId = id;
    getComment();
  }

  getComment() async {
    _comments.bindStream(firestore
        .collection("videos")
        .doc(_postId)
        .collection("comments")
        .snapshots()
        .map((QuerySnapshot query) {
      List<CommentModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(
          CommentModel.fromSnap(element),
        );
      }
      return retVal;
    }));
  }

  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
        DocumentSnapshot userDoc = await firestore
            .collection("users")
            .doc(authController.user.uid)
            .get();
        var allDocs = await firestore
            .collection("videos")
            .doc(_postId)
            .collection("comments")
            .get();
        int len = allDocs.docs.length;
        CommentModel commentModel = CommentModel(
            uid: authController.user.uid,
            likes: [],
            id: "Comment $len",
            profilePhoto: (userDoc.data()! as dynamic)["profilePhoto"],
            userName: (userDoc.data()! as dynamic)["name"],
            comment: commentText.trim(),
            datePublished: DateTime.now());
        await firestore
            .collection("videos")
            .doc(_postId)
            .collection("comments")
            .doc("Comment $len")
            .set(commentModel.toJson());

        DocumentSnapshot doc =
            await firestore.collection("videos").doc(_postId).get();
        firestore.collection("videos").doc(_postId).update({
          "commentCount": (doc.data()! as dynamic)["commentCount"] + 1,
        });
      }
    } catch (e) {
      Get.snackbar("Error while commenting", e.toString());
    }
  }

  likeComment(String id) async {
    var uid = authController.user.uid;
    DocumentSnapshot doc = await firestore
        .collection("videos")
        .doc(_postId)
        .collection("comments")
        .doc(id)
        .get();
    if ((doc.data()! as dynamic)["likes"].contains(uid)) {
    await  firestore
          .collection("videos")
          .doc(_postId)
          .collection("comments")
          .doc(id)
          .update({
        "likes": FieldValue.arrayRemove([uid]),
      });
    }else{
     await firestore
          .collection("videos")
          .doc(_postId)
          .collection("comments")
          .doc(id)
          .update({
        "likes": FieldValue.arrayUnion([uid]),});
    }
  }
}
