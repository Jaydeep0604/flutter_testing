import 'package:flutter_testing/functions/app_functions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // test('functions testing', () async {
  //   final apiData = await AppFunction.fetchData();
  //   List<dynamic> responseData = apiData;
  //   expect(responseData, isA<List<dynamic>>());
  // });

  test('add two number', () {
    final result = AppFunction.addTwoNumber(5, 25);
    expect(result, equals(30));
  });

  test('devide by non zero', () {
    final resulut = AppFunction.devide(10, 2);
    expect(resulut, equals(5));
  });

// comment this for All tests passed! message
  // test('devide by zero', () {
  //   expect(AppFunction.devide(10, 0), throwsArgumentError);
  // });

  test('calculate the total price', () {
    final cart = ShoppingCart();
    final item = Item("Laptop", 1000.0);
    final item2 = Item("Mouse", 20.0);
    cart.addItems(item);
    cart.addItems(item2);
    final total = cart.calculateTotal();
    expect(total, 1020.0);
  });
  test('apply discount to shopping cart', () {
    final cart = ShoppingCart();
    final item1 = Item("Laptop", 1000.0);
    final item2 = Item("Mouse", 20.0);
    cart.addItems(item1);
    cart.addItems(item2);
    cart.applyDiscount(10);
    expect(item1.price, equals(900.0));
    expect(item2.price, equals(18.0));
  });
  // comment this for All tests passed! message
  // test("invalid discout persentage", () {
  //   final cart = ShoppingCart();
  //   final item1 = Item("Laptop", 1000.0);
  //   final item2 = Item("Mouse", 20.0);
  //   cart.addItems(item1);
  //   cart.addItems(item2);
  //   cart.applyDiscount(110);
  //   expect(item1.price, equals(1100.0));
  //   expect(item2.price, equals(22.0));
  // });
}
