import 'package:flutter/cupertino.dart';
import 'package:sushi_restaurant_app/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: 'Amala',
        price: '21.00',
        imagePath: 'lib/images/amala.png',
        rating: '9.1'),
    Food(
        name: 'Rice',
        price: '30.00',
        imagePath: 'lib/images/rice.png',
        rating: '10'),
    Food(
        name: 'Shawarma',
        price: '15.00',
        imagePath: 'lib/images/homepage.png',
        rating: '8.9'),
    Food(
        name: 'Avocado Salad',
        price: '8.00',
        imagePath: 'lib/images/av.png',
        rating: '5.9'),
    Food(
        name: 'Noodles',
        price: '21.00',
        imagePath: 'lib/images/noodles.png',
        rating: '7.9'),
    Food(
        name: 'Sushi 1',
        price: '14.00',
        imagePath: 'lib/images/sushi-2.png',
        rating: '5'),
    Food(
        name: 'Chicken & Chips',
        price: '23.00',
        imagePath: 'lib/images/fry.png',
        rating: '6.9'),
    Food(
        name: 'Sushi 2',
        price: '8.00',
        imagePath: 'lib/images/sushi-3.png',
        rating: '4.9'),
  ];
  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
