
import 'package:brondo/presentation/ui/cart_page/cart_page.dart';
import 'package:brondo/presentation/ui/wishlist_page/wish_list_page.dart';
import 'package:brondo/presentation/widget/drawer_data.dart';
import 'package:brondo/presentation/widget/tab.dart';
import 'package:flutter/material.dart';
import 'screen/kids/ui/kids_page.dart';
import 'screen/mens/ui/men_page.dart';
import 'screen/womens/ui/women_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    MyTab(name: 'For Men'),
    MyTab(name: 'For Women'),
    MyTab(name: 'For Kids'),
  ];




  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(68.0),
            child: AppBar(
              title: Text(
                'BRONDO.',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                Stack(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => WishListPage()));
                    },
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      size: 28,
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange[900],
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '3',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ))
                ]),
                Stack(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => CartPage()));
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 28,
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange[900],
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            '3',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ))
                ])
              ],
            ),
          ),
          drawer: Drawer(
            child: DrawerData(),
          ),
          body: Column(
            children: [
              // tab bar
              TabBar(
                  // controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    color: Colors.orange[900],
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: myTabs),

              //tabbar views
              Expanded(
                child: TabBarView(
                  children: [
                    MenPage(),
                    WomenPage(),
                    KidsPage(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
