import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'global.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List images = [
  //   "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
  //   "https://1.bp.blogspot.com/-kK7Fxm7U9o0/YN0bSIwSLvI/AAAAAAAACFk/aF4EI7XU_ashruTzTIpifBfNzb4thUivACLcBGAsYHQ/s1280/222.jpg",
  //   "https://imgd.aeplcdn.com/1056x594/n/cw/ec/102709/ntorq-125-right-front-three-quarter.jpeg?isig=0&q=75",
  //   "https://thumbs.dreamstime.com/b/silhouette-bridge-crab-plover-birds-image-taken-surat-city-golden-hour-photographers-stunning-170042876.jpg",
  //   "https://media.gettyimages.com/id/1161778128/photo/close-up-of-hand-holding-lens-against-city-at-night.jpg?s=612x612&w=gi&k=20&c=Ii4rLOeZX1jBBEW4_uvn-oaFi6J-rOcKkrjTJIw3C10=",
  // ];

  bool icon = true;

  int currentpage = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(),
                child: Row(
                  children: [
                    ...Global.heading
                        .map(
                          (e) => Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: ActionChip(
                          label: Text(
                            "${e['name']}",
                          ),
                          onPressed: () {
                            setState(() {
                              Global.o = Global.NAB[Global.heading.indexOf(e)];
                            });
                          },
                        ),
                      ),
                    )
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: (icon == true) ? Column(
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        onPageChanged: (val, _) {
                          setState(() {
                            currentpage = val;
                          });
                          print(currentpage);
                        },
                        height: 280,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                      ),
                      items: [
                        ...Global.o.map((e) =>
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network("${e['i']}",fit: BoxFit.fill,)),
                        ).toList(),
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 110,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...Global.o.map((e) {

                            int i = Global.o.indexOf(e);

                            return Padding(
                              padding: const EdgeInsets.only(left: 6,right: 5),
                              child: GestureDetector(
                                onTap: () {
                                  carouselController.animateToPage(i,duration: Duration(milliseconds: 300),curve: Curves.easeInOut);
                                  print(i);
                                },
                                child: CircleAvatar(
                                  radius: (currentpage == i) ? 7 : 5,
                                  backgroundColor: (currentpage == i) ? Colors.white : Colors.grey[800],
                                ),
                              ),
                            );
                          },
                          ).toList(),
                        ],
                      ),
                    ),
                  ],
                ) : (icon == false) ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        width: 280,
                        child: CarouselSlider(
                          carouselController: carouselController,
                          options: CarouselOptions(
                            onPageChanged: (val, _) {
                              setState(() {
                                currentpage = val;
                              });
                              print(currentpage);
                            },
                            height: 250,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 0.7,
                            enlargeCenterPage: true,
                          ),
                          items: [
                            ...Global.o.map((e) =>
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network("${e['i']}",fit: BoxFit.fill,)),
                            ).toList(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 110,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...Global.o.map((e) {

                            int i = Global.o.indexOf(e);

                            return Padding(
                              padding: const EdgeInsets.only(left: 5,right: 4),
                              child: GestureDetector(
                                onTap: () {
                                  carouselController.animateToPage(i,duration: Duration(milliseconds: 300),curve: Curves.easeInOut);
                                  print(i);
                                },
                                child: CircleAvatar(
                                  radius: (currentpage == i) ? 7 : 5,
                                  backgroundColor: (currentpage == i) ? Colors.white : Colors.grey[800],
                                ),
                              ),
                            );
                          },
                          ).toList(),
                        ],
                      ),
                    ),
                  ],
                ) : Column(
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        onPageChanged: (val, _) {
                          setState(() {
                            currentpage = val;
                          });
                          print(currentpage);
                        },
                        height: 280,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                      ),
                      items: [
                        ...Global.o.map((e) =>
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network("${e['i']}",fit: BoxFit.fill,)),
                        ).toList(),
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 110,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...Global.o.map((e) {

                            int i = Global.o.indexOf(e);

                            return Padding(
                              padding: const EdgeInsets.only(left: 6,right: 5),
                              child: GestureDetector(
                                onTap: () {
                                  carouselController.animateToPage(i,duration: Duration(milliseconds: 300),curve: Curves.easeInOut);
                                  print(i);
                                },
                                child: CircleAvatar(
                                  radius: (currentpage == i) ? 7 : 5,
                                  backgroundColor: (currentpage == i) ? Colors.white : Colors.grey[800],
                                ),
                              ),
                            );
                          },
                          ).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
