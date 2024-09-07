import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant_app/components/buttons.dart';
import 'package:sushi_restaurant_app/components/themes/colors.dart';
import 'package:sushi_restaurant_app/models/food.dart';
import 'package:sushi_restaurant_app/models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.green,
          content: Text(
            'Successfully added to cart',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey.shade900,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Imagine a dish that takes you on a journey of flavors, where each bite unravels layers of taste and texture. The first thing you notice is the aroma, a warm and inviting scent that hints at a mix of spices and herbs, setting the stage for what’s to come. Every mouthful offers a different experience, with bursts of flavor that surprise your palate, leaving you eager for the next bite. It’s comfort and indulgence in every taste ',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      height: 2,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.green,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$' + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                MyButton(text: 'Add to Cart', onTap: addToCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
