import 'package:flutter_web/material.dart';

class Carousel {
  final List<Color> bgColors;
  final String imageUrl;

  Carousel({this.bgColors, this.imageUrl});
}

List<Carousel> carousels = [
  Carousel(
      bgColors: [Colors.teal, Colors.green], imageUrl: "images/shoe.png"),
  Carousel(
      bgColors: [Colors.teal, Colors.green], imageUrl: "images/shoe.png"),
  Carousel(
      bgColors: [Colors.teal, Colors.green], imageUrl: "images/shoe.png"),
  Carousel(
      bgColors: [Colors.teal, Colors.green], imageUrl: "images/shoe.png"),
  Carousel(
      bgColors: [Colors.teal, Colors.green], imageUrl: "images/shoe.png"),
  Carousel(
      bgColors: [Colors.teal, Colors.green], imageUrl: "images/shoe.png")
];
