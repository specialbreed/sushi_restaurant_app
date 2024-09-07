import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant_app/components/buttons.dart';
import 'package:sushi_restaurant_app/components/food_tile.dart';
import 'package:sushi_restaurant_app/models/shop.dart';
import 'package:sushi_restaurant_app/pages/food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey.shade900,
        ),
        title: Text(
          'Find your Food',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: Icon(
                Icons.shopping_cart,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Get 30% Promo',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(text: 'Redeem', onTap: () {}),
                  ],
                ),
                Image.asset(
                  'lib/images/egg.png',
                  height: 90,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search here...'),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food Menu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey.shade800),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/egg.png',
                      height: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Egg Bread',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$21.00',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
