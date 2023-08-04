import 'package:carousel_slider/carousel_slider.dart';
import 'package:fic6_ecommerce/common/global_variables.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariable.bannerImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              i,
              fit: BoxFit.contain,
              height: 200,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}
