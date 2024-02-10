
import 'package:brondo/data/product_data/model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //using filter the list
  bool filterItem = true;

  void filterCartItems() {
    setState(() {
      if (filterItem) {
        cartItems.sort((a, b) => a.prize.compareTo(b.prize));
      } else {
        cartItems.sort((a, b) => b.prize.compareTo(a.prize));
      }
      filterItem = !filterItem;
    });
  }

  // remove from cart
  void removeCart(Arrival product) {
    setState(() {
      cartItems.remove(product);
    });
  }

  //display the total prize
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < quantityCount; i++) {
      totalPrice += (cartItems[i].prize);
    }
    return totalPrice.toStringAsFixed(2);
  }

  // Quantity count
  int quantityCount = 0;

  // Incraese the Quantity
  // void incrementQuantity() {
  //   setState(() {
  //     quantityCount++;
  //   });
  // }
  //
  // void decrementQuantity() {
  //   setState(() {
  //     if (quantityCount > 0) {
  //       quantityCount--;
  //     }
  //   });
  // }


  // Map productQuantity(product) {
  //   var quantity = Map();
  //
  //   product.forEach((products){
  //     if(!quantity.containsKey(products)) {
  //       quantity[products] = 1;
  //     } else{
  //       quantity[products] += 1;
  //     }
  //   });
  //
  //   return quantity;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: const BoxDecoration(
              color: Colors.white30, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined, size: 28)),
        ),
        title: const Text(
          'CART',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white30, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  filterCartItems();
                },
                icon: const Icon(Icons.sort)),
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty ? Center(child: Text('Your Cart is Empty...')) : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartItems[index];
                  return Padding(
                    padding:
                    const EdgeInsets.only(left: 25, right: 25, top: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          //   product image
                          Image.asset(
                            product.imagepath,
                            height: 100,
                          ),
                          Column(
                            children: [
                              //   product name
                              Text(
                                product.name,
                                style: const TextStyle(fontSize: 20),
                              ),

                              //   product prize
                              Text(
                                "Rs" + " " + product.prize.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),

                              //   product quantity
                              // Row(
                              //   children: [
                              //     Container(
                              //       decoration:
                              //       BoxDecoration(shape: BoxShape.circle),
                              //       child: IconButton(
                              //           onPressed: decrementQuantity,
                              //           icon: Icon(Icons.remove)),
                              //     ),
                              //     Text(quantityCount.toString()),
                              //     Container(
                              //       decoration:
                              //       BoxDecoration(shape: BoxShape.circle),
                              //       child: IconButton(
                              //           onPressed: incrementQuantity,
                              //           icon: Icon(Icons.add)),
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                removeCart(product);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 28,
                                color: Colors.orange[900],
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.orange[900],
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(calculateTotal(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white),
                      ),
                      child: const Text('Pay Now >',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
