import 'dart:convert';

import 'package:expense_tracker/expense_model.dart';
import 'package:expense_tracker/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShowExpenseScreen extends StatefulWidget {
  const ShowExpenseScreen({super.key});

  @override
  State<ShowExpenseScreen> createState() => _ShowExpenseScreenState();
}

class _ShowExpenseScreenState extends State<ShowExpenseScreen> {
  List<ExpenseInfo> expList = [];

  @override
  void initState() {
    showExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Expense'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const AddExpenseScreen();
        }));
      },child: const Icon(Icons.add),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: expList.length,
          itemBuilder: (context, index) {
            ExpenseInfo expenseInfo = expList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('name'),
                      const SizedBox(width: 100),
                      Text(expenseInfo.name),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Price'),
                      const SizedBox(width: 100),
                      Text(expenseInfo.price.toString()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Description'),
                      const SizedBox(width: 100),
                      Text(expenseInfo.description),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Category'),
                      const SizedBox(width: 100),
                      Text(expenseInfo.category),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Future<void> showExpense() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   List<String> list = sharedPreferences.getStringList('ExpenseData') ?? [];
  //   List<ExpenseInfo> tempList = [];
  //   for (int i = 0; i < list.length; i++) {
  //     String showExp = list[i];
  //     Map<String, dynamic> map = jsonDecode(showExp);
  //     ExpenseInfo expenseInfo = ExpenseInfo.fromMap(map);
  //     expList.add(expenseInfo);
  //   }
  //   setState(() {
  //     expList = tempList;
  //   });
  //   }
    Future<void> showExpense() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      List<String> list = sharedPreferences.getStringList('ExpenseData') ?? [];
      List<ExpenseInfo> tempList = [];
      for (int i = 0; i < list.length; i++) {
        String showExp = list[i];
        Map<String, dynamic> map = jsonDecode(showExp);
        ExpenseInfo expenseInfo = ExpenseInfo.fromMap(map);
        tempList.add(expenseInfo);
      }
      setState(() {
        expList = tempList;
      });
    }

  }
