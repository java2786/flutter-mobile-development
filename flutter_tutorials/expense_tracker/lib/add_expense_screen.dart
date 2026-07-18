import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddExpenseScreenState();
  }
}

class _AddExpenseScreenState extends State<AddExpenseScreen>{
  
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String selectedCategory = "Food";
  List<String> categories = ["Food", "Travel", "Shopping", "Bills", "Other"];

  void submitExpense(){
    print("Adding an expense: "+selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Expense Form"),),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: titleController,
            ),
            SizedBox(height: 20,),
            TextField(
              controller: amountController,
            ),
            DropdownButton<String>(
              value: selectedCategory,
              items: categories.map((category){
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(), 
              onChanged: (value){
                setState((){
                  selectedCategory = value!;
                });
              }
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: submitExpense, child: Text("Save Expense"))
          ],
        ),
      )
    );
  }
}