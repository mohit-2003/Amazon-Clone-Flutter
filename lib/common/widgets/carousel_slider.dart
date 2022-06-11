import 'package:amazon_clone/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CarouselSlider(
        items: GlobalVariables.carouselImages.map((i) {
          return new Builder(
            builder: (context) {
              return Image.network(
                i,
                fit: BoxFit.cover,
              );
            },
          );
        }).toList(),
        options: new CarouselOptions(
            viewportFraction: 1, height: 200, autoPlay: true));
  }
}
