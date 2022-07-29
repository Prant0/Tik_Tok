import 'package:flutter/material.dart';
import 'package:tok_tok/widget/brand_colors.dart';


class ProfileScreen extends StatelessWidget {
    ProfileScreen({Key? key,  this.uid}) : super(key: key);
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    /*  appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            authController.signOut();
          },
              icon:Icon(Icons.logout_outlined))
        ],
      ),*/
      body: Center(child: Text("Profile page$uid"),)
    );
  }
}
