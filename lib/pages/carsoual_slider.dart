import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../provider/carsoual_provider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Carsoual_slider extends StatefulWidget {
  const Carsoual_slider({Key? key}) : super(key: key);

  @override
  State<Carsoual_slider> createState() => _Carsoual_sliderState();
}

class _Carsoual_sliderState extends State<Carsoual_slider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<carsoal_slidder>(
        builder: (context, provider, child) => Column(
          children: [
            CarouselSlider(
              items: provider.ImageList.map((e) {
                return Container(
                  height: 250,
                  width: double.infinity,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(e),
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                height: 250,
                aspectRatio: 1.0,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) =>
                    provider.changeCurrentPageIndex(index),
              ),
            ),
            DotsIndicator(
              dotsCount: provider.ImageList.length,
              position: provider.currentIndex,
            )
          ],
        ),
      ),
    );
  }
}
