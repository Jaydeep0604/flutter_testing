import 'package:http/http.dart' as http;
import 'dart:convert';

class AppFunction {
  static Future<List<dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static int addTwoNumber(int num1, int num2) {
    return num1 + num2;
  }

  static double devide(int num1, int num2) {
    if (num2 == 0) {
      throw ArgumentError('can not devide by zero');
    }
    return num1 / num2;
  }
}

class ShoppingCart {
  List<Item> items = [];

  void addItems(Item item) {
    items.add(item);
  }

  double calculateTotal() {
    return items.fold(0.0, (sum, item) => sum + item.price);
  }

  void applyDiscount(double discountPercentage) {
    if ((discountPercentage < 0) || discountPercentage > 100) {
      throw ArgumentError('Invalid discount persentage');
    }
    final discountMultiplier = 1 - discountPercentage / 100;
    print("discountMultiplier is :$discountMultiplier");
    items.forEach((element) {
      element.applyDiscount(discountMultiplier);
    });
  }
}

class Item {
  String name;
  double price;
  Item(this.name, this.price);
  
  void applyDiscount(double discountMultiplier) {
    price *= discountMultiplier;
  }
}
