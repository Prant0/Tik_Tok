import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tok_tok/controllers/video_controller.dart';
import 'package:tok_tok/screen/comment_screen.dart';
import 'package:tok_tok/widget/brand_colors.dart';
import 'package:tok_tok/widget/circle_animation.dart';
import 'package:tok_tok/widget/video_player_item.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';
class VideoScreen extends StatelessWidget {
    VideoScreen({Key? key}) : super(key: key);
  final VideoController videoController=Get.put(VideoController());

  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    return Scaffold(
      body:Obx(
        (){
          return  PageView.builder(
              itemCount:videoController.videoList.length ,
              controller: PageController(
                initialPage: 0,
                viewportFraction: 1,

              ),
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                final data= videoController.videoList[index];
                return Stack(
                  children: [
                     VideoPlayerItem(videoUrl:data.videoUrl),
                    Column(
                      children: [
                        SizedBox(height: 100,),
                        Expanded(child: Row(
                          // mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(" ${data.username}",style: myStyle(20,Colors.white,FontWeight.bold),),
                                  Text(" ${data.caption}",style: myStyle(15,Colors.white,FontWeight.bold),),
                                  Row(
                                    children: [
                                      Icon(Icons.music_note,size: 15,color: Colors.white,),
                                      Text("${data.songName}",style: myStyle(15,Colors.white,FontWeight.bold),),

                                    ],
                                  ),SizedBox(height: 16,),
                                ],
                              ),
                            ),



                            ),

                            Container(
                              width: 100,

                              margin: EdgeInsets.only(top: size.height/5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  buildProfile("${data.profilePhoto}"),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      IconButton(onPressed: (){
                                        videoController.likeVideo(data.id);
                                      }, icon: Icon(Icons.favorite,size: 40,color:data.likes.contains(authController.user.uid)? Colors.redAccent:Colors.white,)),
                                      SizedBox(height: 8,),
                                      Text("${data.likes.length.toString()}",style: myStyle(20,Colors.white,FontWeight.bold),),
                                    ],
                                  ),
                                  Column(

                                    children: [
                                      IconButton(onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CommentScreen(
                                          id: data.id,
                                        )));
                                      }, icon: Icon(Icons.comment,size: 40,color: Colors.white,)),
                                      SizedBox(height: 8,),
                                      Text("${data.commentCount.toString()}",style: myStyle(20,Colors.white,FontWeight.bold),),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(onPressed: (){}, icon: Icon(Icons.reply,size: 40,color: Colors.white,)),
                                      SizedBox(height: 8,),
                                      Text("${data.shareCount.toString()}",style: myStyle(20,Colors.white,FontWeight.bold),),
                                    ],
                                  ),

                                  CircleAnimation(
                                    child:buildMusicAlbum("${data.profilePhoto}"),
                                  )

                                ],
                              ),
                            )

                          ],))
                      ],
                    )
                  ],
                );
              });
        }
      )
    );
  }
  buildProfile(String profilePhoto){
    return SizedBox(width: 60,height: 60,child: Stack(
      children: [
        Positioned(
          left: 5,
          child: Container(
              width: 50,height: 50,padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)
              ),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child:  Image(image: NetworkImage(profilePhoto),fit: BoxFit.cover,),
              )
          ),
        )
      ],
    ),);
  }
  buildMusicAlbum(String profilePhoto){
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11),
            height: 50,width: 50,
            decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [
                 Colors.grey,
                 Colors.white,


               ]),
              borderRadius: BorderRadius.circular(25)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto,),fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

