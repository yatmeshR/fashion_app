

import 'package:brondo/presentation/ui/cart_page/cart_page.dart';
import 'package:brondo/presentation/ui/profile_page/profile_page.dart';
import 'package:brondo/presentation/ui/wishlist_page/wish_list_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerData extends StatelessWidget {
  DrawerData({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  // user logout method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                  child: Center(
                    child:Icon(
                      Icons.favorite,
                      size: 30,
                    ),
                  ),
                ),

                // user profile
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => ProfilePage()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 26,
                    ),
                    title: Text(
                      'Profile',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                // cart page
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CartPage()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.shopping_cart_outlined,
                      size: 26,
                    ),
                    title: Text(
                      'Cart',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                // Wishlist page
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => WishListPage()));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.favorite_border_rounded,
                      size: 26,
                    ),
                    title: Text(
                      'Your List',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(
                      Icons.shopping_bag_outlined,
                      size: 26,
                    ),
                    title: Text(
                      'Your Order',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // User Logout
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: GestureDetector(
              onTap: signUserOut,
              child: Row(
                children: [
                  Icon(
                    Icons.logout_rounded,
                    size: 26,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Log Out',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
