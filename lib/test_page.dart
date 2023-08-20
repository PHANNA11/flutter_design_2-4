import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app1/home_page.dart';
import 'package:test_app1/pages/home_page.dart';
import 'package:test_app1/pages/profile_page.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  String pathImage = 'assets/images/';

  List<String> images = [
    '364785871_636199681822244_925004147024813297_n.jpg',
    '364788666_636199118488967_2073040999544456559_n.jpg',
    '364806295_636198191822393_5485596086830543044_n.jpg',
    '365162226_636197125155833_2959209422245764664_n.jpg',
    '365189611_636199581822254_6471284189133837131_n.jpg',
  ];
  int index = 0;
  void setIndex(int index) {
    setState(() {
      this.index = index;
    });
  }

  File? fileImage;

  List<Widget> pages = [const HomePageTap(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Favorit',
              icon: Icon(Icons.favorite),
            ),
            Tab(
              text: 'Menu',
              icon: Icon(Icons.menu),
            ),
            Tab(
              text: 'Map',
              icon: Icon(Icons.map),
            ),
          ]),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(children: [
                Container(
                  width: double.infinity,
                  color: Colors.red,
                  child: ImageSlideshow(
                      initialPage: 0,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: List.generate(
                          images.length,
                          (indexImage) => Image(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  '$pathImage${images[indexImage]}')))),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: fileImage == null
                      ? const SizedBox()
                      : Image(image: FileImage(File(fileImage!.path))),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.yellow,
                )
              ]),
            ),
            Expanded(child: pages[index]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: setIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () async {
                var getImage =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {
                  fileImage = File(getImage!.path);
                });
              },
              child: const Icon(Icons.image),
            ),
            FloatingActionButton(
              onPressed: () async {
                var getImage =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                setState(() {
                  fileImage = File(getImage!.path);
                });
              },
              child: const Icon(Icons.camera_alt),
            ),
          ],
        ),
      ),
    );
  }
}
// AIzaSyBgISYRsqWesHaL2qZYrVXTRvlD9IfeN5s