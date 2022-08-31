import 'package:flutter/material.dart';

import '../core/const.dart';

class ShoeModel{
  final String name,desc,brand,imgPath;
  final double price;
  final Color color;

  ShoeModel({required this.name, required this.desc, required this.brand, required this.imgPath, required this.price, required this.color});

  static List<ShoeModel> list = [
    ShoeModel(
      name: "Nike Air Jordan 1 Retro High",
      desc:
      "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 184,
      color: AppColors.blueColor,
      brand: "Nike",
      imgPath: "2.png",
    ),
    ShoeModel(
      name: "Converse X OPI Chuck Taylor",
      desc:
      "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 123,
      color: AppColors.yellowColor,
      brand: "Converse",
      imgPath: "1.png",
    ),
    ShoeModel(
      name: "Nike Air Jordan 1 Retro High",
      desc:
      "Familiar but always fresh, the iconic Air Jordan 1 is remastered for today's sneakerhead culture. This Retro High OG version goes all in with full-grain leather, comfortable cushioning and classic design details.",
      price: 135,
      color: AppColors.redColor,
      brand: "Nike",
      imgPath: "3.png",
    ),
  ];

}
