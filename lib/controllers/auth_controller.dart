import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tok_tok/models/user_model.dart' as model;
import 'package:tok_tok/screen/auth/login_page.dart';
import 'package:tok_tok/screen/home_page.dart';
import 'package:tok_tok/widget/brand_colors.dart';

class AuthController extends GetxController {
  late Rx<File>? _pickedImage;
  static AuthController instance = Get.find();
  File? get ProfilePhoto => _pickedImage!.value;
  late Rx<User?> _user;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user=Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
   ever(_user, _setInitialScreen);

  }

  _setInitialScreen(User?  user) {
    if(user==null){
      Get.offAll(()=>LoginPage());
    }else{
      Get.offAll(()=>HomePage());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar("Profile Picture",
          "You have successfullty selected your profile picture!");
    }
    _pickedImage = Rx<File>(File(pickedImage!.path));
  }



  void registerUser(String userName, email, password, File? image) async {
    try {
      if (userName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //Save to our Auth and firebase firestore

        UserCredential credential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadUrl = await _uploadToStorage(image);

        model.User user = model.User(
          email: email,
          uid: credential.user!.uid,
          profilePhoto: downloadUrl,
          name: userName,
        );
        await firestore
            .collection("users")
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar("Error Creating Account", "Please Enter All The Fields");
      }
    } catch (e) {
      Get.snackbar("Error Creating Accout", e.toString());
    }
  }

  Future<String> _uploadToStorage(File? image) async {
    Reference ref = firebaseStore
        .ref()
        .child("profilePic")
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void lohinUser(String email, password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        print("Login Done bro");

      } else {
        Get.snackbar("Error Login", "Please Enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error Creating Accout", e.toString());
    }
  }
}
