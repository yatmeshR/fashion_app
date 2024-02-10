import 'package:brondo/data/product_data/model.dart';
import 'package:brondo/data/product_data/women_page_data.dart';
import 'package:brondo/presentation/ui/deatil_page/details_page.dart';
import 'package:flutter/material.dart';


class WArrivalList extends StatefulWidget {
  @override
  State<WArrivalList> createState() => _WArrivalListState();
}

class _WArrivalListState extends State<WArrivalList> {



  //Add items in wishlist
  void addWish(Arrival product) {
    setState(() {
      wishItems.add(product);
    });

    showDialog(
        context: context,
        builder: (builder) => AlertDialog(
          title: Text("Added Sucessfully"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products2.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          final product = products2[index];
          return Container(
            margin: EdgeInsets.only(left: 10),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(14),
            ),

            child : Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(products2[index].imagepath,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(14),
                            bottomRight: Radius.circular(14),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange[900],size: 22,),
                            SizedBox(width: 5,),
                            Text(products2[index].rate.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                        ),
                        child: IconButton(onPressed: () {addWish(products2[index]);},
                            icon: Icon(Icons.favorite_border_rounded)),
                      ),
                    )
                  ],

                ),

                SizedBox(height: 5),

                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //  name
                          Text(products2[index].name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),

                          //  prize
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Rs " + products2[index].prize.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange[900],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(14),
                                        bottomRight: Radius.circular(14))
                                ),
                                child: IconButton(onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              DetailPage(item: product,)));
                                },
                                  icon: Icon(Icons.add),
                                  color: Colors.white,
                                  iconSize: 30,),
                              )
                            ],
                          )
                          //  add to cart
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

        }

    );

  }
}