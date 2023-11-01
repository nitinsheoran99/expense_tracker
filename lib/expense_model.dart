// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ExpenseInfo {
//   String name;
//   String price;
//   String description;
//   String category;
//
//   ExpenseInfo({
//     required this.name,
//     required this.category,
//     required this.description,
//     required this.price,
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       "name": name,
//       "price": price,
//       "description": description,
//       "category": category,
//     };
//   }
//
//   static ExpenseInfo fromMap(Map<String, dynamic> map) {
//     return ExpenseInfo(
//       name: map["name"],
//       price: map["price"],
//       description: map["description"],
//       category: map["category"],
//     );
//   }
// }
//
// class SaveExpenseInfoToSharedPreferences {
//   static const String key = 'expenseInfo';
//
//   static Future<void> setExpenseInfo(ExpenseInfo expenseInfo) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String expenseInfoJson = ExpenseInfo(
//       name: expenseInfo.name,
//       category: expenseInfo.category,
//       description: expenseInfo.description,
//       price: expenseInfo.price,
//     ).toMap().toString();
//     await prefs.setString(key, expenseInfoJson);
//   }
//
//   static Future<ExpenseInfo?> getExpenseInfo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? expenseInfoJson = prefs.getString(key);
//     if (expenseInfoJson != null) {
//       Map<String, dynamic> map = jsonDecode(expenseInfoJson);
//       return ExpenseInfo.fromMap(map);
//     }
//     return null;
//   }
// }
class ExpenseInfo {
  String name;
  String category;
  int price;
  String description;

  ExpenseInfo(
      {required this.name,
        required this.category,
        required this.price,
        required this.description});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'description': description,
    };
  }

  static ExpenseInfo fromMap(Map<String, dynamic> map) {
    return ExpenseInfo(
      name: map['name'],
      category: map['category'],
      price: map['price'],
      description: map['description'],
    );
  }
}