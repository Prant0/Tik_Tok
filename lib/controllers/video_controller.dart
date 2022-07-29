import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tok_tok/models/video_model.dart';
import 'package:tok_tok/widget/brand_colors.dart';

class VideoController extends GetxController{
  final Rx<List<VideoModel>> _videoList= Rx<List<VideoModel>>([]);
  List<VideoModel> get videoList => _videoList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    _videoList.bindStream(firestore.collection("videos").snapshots().map((QuerySnapshot query){
      List<VideoModel> retVal=[];
      for(var element in query.docs ){
        retVal.add(VideoModel.fromSnap(element));
      }
      return retVal;

    } ));
    super.onInit();
  }

    likeVideo(String id)async{
    DocumentSnapshot doc=await firestore.collection("videos").doc(id).get();
    var uid=authController.user.uid;
    if((doc.data()! as dynamic)["likes"].contains(uid)){
      await firestore.collection("videos").doc(id).update({
        "likes":FieldValue.arrayRemove([uid])
      });
    }else{
      await firestore.collection("videos").doc(id).update({
        "likes":FieldValue.arrayUnion([uid])
      });
    }
    }

}
