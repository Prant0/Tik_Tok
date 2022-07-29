import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tok_tok/screen/confirm_screen.dart';
import 'package:tok_tok/widget/brand_colors.dart';


class AddVedioScreen extends StatefulWidget {
  const AddVedioScreen({Key? key}) : super(key: key);

  @override
  _AddVedioScreenState createState() => _AddVedioScreenState();
}

class _AddVedioScreenState extends State<AddVedioScreen> {


pickVedio(ImageSource src)async{
  final vedio=await ImagePicker().pickVideo(source: src);
  if(vedio!=null){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ConfirmScreen(

      videoFile: File(vedio.path),
      videoPath:  vedio.path,
    )));
  }
}


  showOptionDialog(BuildContext context){
    return showDialog(context: context, builder: (context)=>SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: ()=>pickVedio(ImageSource.gallery),
          child: Row(
            children: [
              Icon(Icons.image),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Gallery"),
              )
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: ()=>pickVedio(ImageSource.camera),
          child: Row(
            children: [
              Icon(Icons.camera),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Camera"),
              )
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Icon(Icons.cancel),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cancel"),
              )
            ],
          ),
        ),
      ],
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: ()=>showOptionDialog(context),
          child: Container(
            alignment: Alignment.center,
            width: 190,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),

              color: buttonColor,
            ),
            child: Text("Add Vedio",style: myStyle(20,Colors.black,FontWeight.w800),),
          ),
        ),
      )
    );
  }
}
