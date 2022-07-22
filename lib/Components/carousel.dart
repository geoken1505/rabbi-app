import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({Key? key}) : super(key: key);

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  @override
  Widget build(BuildContext context) {
  return CarouselSlider(

      items: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child:
          Image.network('https://i.ytimg.com/vi/kD9FDre6E3g/mqdefault.jpg',
            width: MediaQuery.of(context).size.width-40,
            height: MediaQuery.of(context).size.height/8,
            fit: BoxFit.cover,

          ),

        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child:
          Image.network('https://i.ytimg.com/vi/CHGF5Zkci0s/mqdefault.jpg',
            width: MediaQuery.of(context).size.width-40,
            height: MediaQuery.of(context).size.height/8,
            fit: BoxFit.cover,

          ),

        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child:
          Image.network('https://i.ytimg.com/vi/Dztm6P2170U/mqdefault.jpg',
            width: MediaQuery.of(context).size.width-40,
            height: MediaQuery.of(context).size.height/8,
            fit: BoxFit.cover,

          ),

        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        height: 180,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),

      ));
  }
}