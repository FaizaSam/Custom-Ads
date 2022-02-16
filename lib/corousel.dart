import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/utils.dart';
// import 'package:carousel_slider/carousel_state.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class Corousel extends StatefulWidget {
  Corousel({Key key}) : super(key: key);

  @override
  State<Corousel> createState() => _CorouselState();
}

class _CorouselState extends State<Corousel> {
  int activeIndex = 0;
  final imag = [
    'assets/ads_three.jpg',
    'assets/ads_five.jpg',
    'assets/ads_one.jpg',
    'assets/ads_four.jpg',
    'assets/ads_two.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Image Corousel Slider",
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              child: CarouselSlider.builder(
                  itemCount: imag.length,
                  itemBuilder: (context, index, realIndex) {
                    final actImg = imag[index];
                    return imageButton(actImg, index);
                  },
                  options: CarouselOptions(
                      height: 400,
                      autoPlay: true,
                      //  viewportFraction: 1,
                      pageSnapping: false,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                      autoPlayInterval: Duration(seconds: 4))),
            ),
            const SizedBox(
              height: 32,
            ),
            buildIndicator(),
          ],
        ));
  }

  Widget imageButton(String actImag, index) {
    return OutlinedButton(
        onPressed: () {
          launch('https://www.google.com');
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              // color: Colors.grey,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(actImag))),
        ));
  }

  Widget buildImage(String actImag, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          // color: Colors.grey,
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(actImag))),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: imag.length,
    );
  }
}
