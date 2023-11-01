// import 'package:expense_tracker/expense_model.dart';
// import 'package:flutter/material.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String currentCategory = 'Others';
//   TextEditingController nameController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.purple,
//         title: const Center(
//           child: Text(
//             'Expense Tracker',
//             style: TextStyle(
//                 fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Category",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(
//                       width: 12,
//                     ),
//                     DropdownButton(
//                         value: currentCategory,
//                         items: const [
//                           DropdownMenuItem(
//                             value: 'Category',
//                             child: Text('Category'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'Veg',
//                             child: Text('Veg'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'Statitionary',
//                             child: Text('Statitionary'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'Rent',
//                             child: Text('Rent'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'Farm',
//                             child: Text('Farm'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'Electric Bill',
//                             child: Text('Electric Bill'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'Household',
//                             child: Text('Household'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'Oil',
//                             child: Text('Oil'),
//                           ),
//                           DropdownMenuItem(
//                             value: 'Others',
//                             child: Text('Others'),
//                           ),
//                         ],
//                         onChanged: (String? value) {
//                           if (value != null) {
//                             currentCategory = value;
//                             setState(() {});
//                           }
//                         }),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 14,
//                 ),
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     labelText: "Name",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter Name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: priceController,
//                   decoration: InputDecoration(
//                     labelText: "Price",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter Price';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: descController,
//                   maxLines: 3,
//                   decoration: InputDecoration(
//                     labelText: "Description",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: 130,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       color: Colors.purple,
//                       borderRadius: BorderRadius.circular(16)),
//                   child: TextButton(
//                     onPressed: () async {
//                       ExpenseInfo exp = ExpenseInfo(name: nameController.text, category: currentCategory, description: descController.text, price: priceController.text);
//                       await SaveExpenseInfoToSharedPreferences.setExpenseInfo(exp);
//                       if (mounted) {
//                         if (_formKey.currentState!.validate()) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return ShowScreen(
//                                   name: nameController.text,
//                                   price: priceController.text,
//                                   description: descController.text,
//                                   category: currentCategory,
//
//                                 );
//                               },
//                             ),
//                           );
//                         }
//                       }
//                     },
//                     child: Text(
//                       "Add Expense",
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
import 'dart:convert';

import 'package:expense_tracker/expense_model.dart';
import 'package:expense_tracker/show_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController();
    categoryController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String currentValue = 'Veg';
  List<String> list = [
    'Veg',
    'Stationary',
    'Rent',
    'Farm',
    'oil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
         backgroundColor: Colors.purple,
        title: const Text('Add Expense', style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
          key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Category'),
                      DropdownButton(
                        value: currentValue,
                        items: list.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (String? item) {
                          currentValue = item!;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
              TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Price';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(1000, 50)),
                    ),
                    onPressed: () {
                      addExpense();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ShowExpenseScreen();
                      }));
                    },
                    child: const Text(
                      'Add Expense',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addExpense() async {
    ExpenseInfo expenseInfo = ExpenseInfo(
      name: nameController.text,
      category: currentValue,
      price: int.parse(priceController.text),
      description: descriptionController.text,
    );
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String addExp = jsonEncode(expenseInfo.toMap());
    List<String> expenseList =
        sharedPreferences.getStringList('ExpenseData') ?? [];
    expenseList.add(addExp);
    sharedPreferences.setStringList('ExpenseData', expenseList);
  }
}
