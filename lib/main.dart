import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tok_tok/controllers/auth_controller.dart';
import 'package:tok_tok/screen/auth/login_page.dart';
import 'package:tok_tok/screen/auth/registation_screen.dart';
import 'package:tok_tok/widget/brand_colors.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value){
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tok_Tok',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black87
      ),
      home:LoginPage() ,
    );
  }
}
