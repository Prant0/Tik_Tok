import 'package:flutter/material.dart';


class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 30,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, ),
            width: 38,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 45, 108),
              borderRadius: BorderRadius.circular(8)
            ),
          ),
          Container(

            margin: EdgeInsets.only(right: 10, ),
            width: 38,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(8)
            ),
          ),
          Center(
            child: Container(
             height: double.infinity,
              width:40,
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Icon(Icons.add,color: Colors.black,size: 22,),
            ),
          )
        ],
      ),
    );
  }
}
