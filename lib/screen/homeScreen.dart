import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsonparsing_ecommerce_app/screen/productscreen.dart';
import '../model/main_model.dart';
import '../utils/list.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF1F6),
      body: StatefulBuilder(
        builder: (context, setState) {
          int _selectedIndex = 0;

          const List<Widget> _widgetOptions = <Widget>[
            HomeContent(),
            Text(
              'Search',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Text(
              'Profile',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ];

          void _onItemTapped(int index) {
            setState(() {
              _selectedIndex = index;
            });
          }

          return Column(
            children: [
              Expanded(
                child: Center(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
              ),
              BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.teal[500],
                onTap: _onItemTapped,
              ),
            ],
          );
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'What are you',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Cooking today?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xffFEFEFE),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.notifications_outlined),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 40,
                width: 420,
                decoration: BoxDecoration(
                  color: const Color(0xffFEFEFE),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search any Recipe...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: 420,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/bg.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Categories",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) =>
                    tabbar_container(list[index], index),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text(
                  "Quick & Easy",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Spacer(),
                Text(
                  'VIEW ALL',
                  style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
            FutureBuilder(
              future: rootBundle.loadString('assets/jsondata.json'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error loading data'),
                  );
                } else if (snapshot.hasData) {
                  Map jsonDatalist = jsonDecode(snapshot.data!);
                  print(jsonDatalist);
                  MainModal mainModal = MainModal.fromJson(jsonDatalist);
                  return SizedBox(
                    height: 450,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mainModal.recipes.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 1.2,
                              mainAxisExtent: 240),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                      mainModal: mainModal,
                                      productIndex: index),
                                ));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 125,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          mainModal.recipes[index].image,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                mainModal.recipes[index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.local_fire_department_outlined,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${mainModal.recipes[index].prepTimeMinutes} Time.',
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.access_time,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '${mainModal.recipes[index].prepTimeMinutes} Min.',
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Text(
                                    '${mainModal.recipes[index].rating}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '(${mainModal.recipes[index].reviewCount} Reviews)',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}



Widget tabbar_container(String text, int index) {
  return Container(
    margin: const EdgeInsets.all(5),
    height: 40,
    width: 85,
    decoration: BoxDecoration(
        color: (index == 0) ? Colors.teal : Color(0xffFEFEFE),

        borderRadius: BorderRadius.circular(20)),
    child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: (index == 0) ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        )),
  );
}
