import 'package:flutter/material.dart';
import 'package:tok_tok/screen/auth/registation_screen.dart';
import 'package:tok_tok/widget/brand_colors.dart';
import 'package:tok_tok/widget/custom_textfield.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

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

                SizedBox(height: 100,),

                Text("Login",style: myStyle(25,Colors.white,FontWeight.w900),),

                SizedBox(height: 30,),

               CustomTextField(
                 controller: emailController!,
                 hintText: 'Enter Your Email',
                icon: Icon(Icons.email),
               ),

                SizedBox(height: 30,),
               CustomTextField(

                 controller: passwordController!,
                 hintText: 'Enter Your Password',


                 icon: Icon(Icons.password),
               ),


                SizedBox(height: 30,),
                
                InkWell(
                  onTap: (){
                    authController.loginUser(emailController.text, passwordController.text);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.redAccent
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text("Login",style: myStyle(20,Colors.white),),
                  ),
                ),

                SizedBox(height: 20,),

                Row(
                  children: [
                    Text("Don't have an Account ?  ",style: myStyle(18,Colors.white,FontWeight.w400),),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RegistationScreen()));
                        },
                        child: Text("Register Here",style: myStyle(18,Colors.blue,FontWeight.w900),)),
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
