import 'package:e_commerce_shose/core/const.dart';
import 'package:e_commerce_shose/core/flutter_icon.dart';
import 'package:e_commerce_shose/widget/app_clipper.dart';
import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;
import '../model/show_model.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.shoeModel}) : super(key: key);
  final ShoeModel shoeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shoeModel.color,
      appBar: AppBar(
        backgroundColor: shoeModel.color,
        elevation: 0,
        title: Text("CATEGORIES"),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(FlutterIcons.left_open_1)),
      ),
      body: Container(
      //  padding: EdgeInsets.only(right: 10),
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [

            ClipPath(
              clipper: AppClipper(cornerSize: 50, diagonalHeight: 200),
              child: Container(
                padding: EdgeInsets.only(top: 205,left: 16),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                        width: 250,
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          shoeModel.name,
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,fontFamily: "MyFlutterApp"),
                        )),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 25,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(width: 10,),
                          Text("143 reviews",style: TextStyle(
                            fontSize: 14,
                            color: Colors.black38,
                            fontStyle: FontStyle.italic
                          ),)
                        ],
                      ),

                    ),
                    SizedBox(height: 16,),
                    Text("Details:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,),),
                    SizedBox(height: 8,),
                    Text("${shoeModel.desc}",style: TextStyle(fontWeight: FontWeight.w200,fontSize: 16,fontStyle: FontStyle.italic,color: Colors.black38),),
                    SizedBox(height: 10,),
                    Text("COLOR OPTION",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,),),
                    SizedBox(height: 10,),
                    Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildCircle(AppColors.redColor),
                          buildCircle(AppColors.greenColor),
                          buildCircle(AppColors.blueColor),
                          buildCircle(AppColors.orangeColor),
                          buildCircle(AppColors.yellowColor),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Positioned(

                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "PRICE",
                            style: TextStyle(
                              color: Colors.black26,
                            ),
                          ),
                          Text(
                            "\$${shoeModel.price.toInt()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 50,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Text(
                          "ADD CART",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 100,bottom: 10),
              child: Transform.rotate(
                  angle:-math.pi/7 ,
                  child: Image(
                      width: MediaQuery.of(context).size.width*0.7,
                      image: AssetImage("assets/image/${shoeModel.imgPath}"))),
            )
          ],
        ),
      ),
    );
  }

  Container buildCircle(Color color) {
    return Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50)
                ),
              );
  }
}
