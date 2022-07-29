import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tok_tok/controllers/comment_controller.dart';
import 'package:tok_tok/widget/brand_colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentScreen extends StatelessWidget {
  CommentScreen({Key? key,required this.id }) : super(key: key);
  final TextEditingController _commentController = TextEditingController();
  final String id;

  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(child: Obx(() {
              return ListView.builder(
                  itemCount: commentController.comments.length,
                  itemBuilder: (context, index) {
                    final comment=commentController.comments[index];
                    return ListTile(

                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage("${comment.profilePhoto}"),
                      ),
                      title: Row(
                        children: [
                          Text(
                            "${comment.userName}  ",
                            style: myStyle(18, Colors.red, FontWeight.w600),
                          ),

                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${comment.comment}",
                            style: myStyle(16, Colors.white, FontWeight.w400),overflow: TextOverflow.clip,
                          ),
                          Row(
                            children: [
                              Text(
                                "${timeago.format(comment.datePublished.toDate())}",
                                style: myStyle(
                                  12,
                                  Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${comment.likes.length}",
                                style: myStyle(12, Colors.white, FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                      trailing: InkWell(
                          onTap: () {
                            commentController.likeComment(comment.id);
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 25,
                            color:comment.likes.contains(authController.user.uid)? Colors.red :Colors.white,
                          )),
                    );
                  });
            })),
            Divider(),
            ListTile(
              title: TextFormField(
                controller: _commentController,
                style: myStyle(16, Colors.white),
                decoration: InputDecoration(
                  labelText: "Comment",
                  labelStyle: myStyle(20, Colors.white, FontWeight.w700),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              trailing: TextButton(
                onPressed: () {
                  commentController.postComment(_commentController.text.toString());
                  _commentController.clear();
                },
                child: Text(
                  "Send",
                  style: myStyle(16, Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  
}
