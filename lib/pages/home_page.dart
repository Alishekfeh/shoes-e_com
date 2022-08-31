import 'package:e_commerce_shose/core/const.dart';
import 'package:e_commerce_shose/core/flutter_icon.dart';
import 'package:e_commerce_shose/widget/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../model/show_model.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShoeModel> shoeModel = ShoeModel.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categorise",
                    style: TextStyle(color: Colors.indigo, fontSize: 32),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.black26,
                        size: 32,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: shoeModel.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Details(shoeModel: shoeModel[index],)));
                      },
                      child: Container(
                        width: 250,
                        padding: EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            buildClipPathBackGround(index, 230),
                            Positioned(
                              right: 0,
                              bottom: 150,
                              child: Transform.rotate(
                                angle: -math.pi / 8,
                                child: Image(
                                    width: 210,
                                    image: AssetImage(
                                        "assets/image/${shoeModel[index].imgPath}")),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Just For You",
                    style: TextStyle(
                        color: Colors.indigo.shade800,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(color: AppColors.greenColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ...shoeModel.map((data) => GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => Details(shoeModel: data)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 1,
                              spreadRadius: 4)
                        ]),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/image/${data.imgPath}"),
                          height: 60,
                          width: 100,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    "${data.name}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  )),
                              Text(
                                "${data.brand}",
                                style: TextStyle(
                                    color: Colors.black26, height: 1.5),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "\$${data.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "MyFlutterApp"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)
            ]),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.black12,
          currentIndex: 1,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.compass), label: "data"),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.list), label: "data"),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.bag), label: "data"),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.person_outline), label: "data"),
          ],
        ),
      ),
    );
  }

  Widget buildClipPathBackGround(int index, double width) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 100),
      child: Container(
        width: width,
        color: shoeModel[index].color,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Icon(
                      shoeModel[index].brand == "Nike"
                          ? FlutterIcons.nike
                          : FlutterIcons.converse,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                      width: 160,
                      child: Text(
                        shoeModel[index].name,
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$ ${shoeModel[index].price}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40)),
                    color: AppColors.greenColor),
                child: Icon(
                  FlutterIcons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
