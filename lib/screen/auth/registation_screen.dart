import 'package:flutter/material.dart';
import 'package:tok_tok/widget/brand_colors.dart';
import 'package:tok_tok/widget/custom_textfield.dart';


class RegistationScreen extends StatefulWidget {
  const RegistationScreen({Key? key}) : super(key: key);

  @override
  _RegistationScreenState createState() => _RegistationScreenState();
}

class _RegistationScreenState extends State<RegistationScreen> {

  TextEditingController emailController=TextEditingController( );
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Tok Tok",style: myStyle(35,Colors.white,FontWeight.w900),),
                SizedBox(height: 30,),
                Text("Registation",style: myStyle(25,Colors.white,FontWeight.w900),),

                SizedBox(height: 20,),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/271deea8-e28c-41a3-aaf5-2913f5f48be6/de7834s-6515bd40-8b2c-4dc6-a843-5ac1a95a8b55.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI3MWRlZWE4LWUyOGMtNDFhMy1hYWY1LTI5MTNmNWY0OGJlNlwvZGU3ODM0cy02NTE1YmQ0MC04YjJjLTRkYzYtYTg0My01YWMxYTk1YThiNTUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.BopkDn1ptIwbmcKHdAOlYHyAOOACXW0Zfgbs0-6BY-E"),
                      backgroundColor: Colors.black,

                    ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: (){
                            authController.pickImage();
                          },
                          icon: Icon(Icons.photo),

                        ))
                  ],
                ),

                SizedBox(height: 20,),
                CustomTextField(

                  controller: nameController!,
                  hintText: 'Enter User Name',

                  icon: Icon(Icons.person),
                ),
                SizedBox(height: 20,),


                CustomTextField(

                  controller: emailController!,
                  hintText: 'Enter Your Email',

                  icon: Icon(Icons.email),
                ),

                SizedBox(height: 20,),
                CustomTextField(

                  controller: passwordController!,
                  hintText: 'Enter Your Password',
                  icon: Icon(Icons.password),

                ),


                SizedBox(height: 20,),

                InkWell(
                  onTap:()=>authController.registerUser(nameController.text, emailController.text,
                    passwordController.text,
                    authController.profilePhoto,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.redAccent
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text("Register",style: myStyle(20,Colors.white),),
                  ),
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Text("Already have an Account ?  ",style: myStyle(18,Colors.white,FontWeight.w400),),
                    InkWell(
                        onTap: (){

                        },
                        child: Text("Login Here",style: myStyle(18,Colors.blue,FontWeight.w900),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
