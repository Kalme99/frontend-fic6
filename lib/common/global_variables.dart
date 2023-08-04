import 'package:flutter/material.dart';

class GlobalVariable {
  static const baseUrl = 'http://10.0.2.2:1337';
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];

  static const List<String> bannerImages = [
    'https://storage.googleapis.com/astro-site/home/new-user.webp',
    'https://storage.googleapis.com/astro-site/home/24jam.webp'
  ];

  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static const selectedNavBarColor = Colors.purpleAccent;
  static const unselectedNavBarColor = Colors.black87;
}
