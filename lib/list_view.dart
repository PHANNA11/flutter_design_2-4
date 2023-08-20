import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  String pathImage = 'assets/images/';
  bool isGridView = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ListView'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            icon: !isGridView
                ? const Icon(Icons.menu)
                : const Icon(Icons.view_cozy),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: !isGridView
          ? ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('$pathImage${images[index]}')),
                    ),
                  ),
                );
              },
            )
          : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              childAspectRatio: 14 / 18,
              children: List.generate(
                images.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('$pathImage${images[index]}')),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFBxduf75Z-yNIxG2w9FMtq1fQB2cLm1LqLrsoYzKj1l2oxrrZZrC8blDFvZX5Ska2ZtU&usqp=CAU')),
                                shape: BoxShape.circle),
                          ))
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: setIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
