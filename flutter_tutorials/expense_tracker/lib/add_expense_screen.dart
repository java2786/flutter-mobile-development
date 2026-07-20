import 'package:expense_tracker/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddExpenseScreenState();
  }
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String selectedCategory = "Food";
  List<String> categories = ["Food", "Travel", "Shopping", "Bills", "Other"];

  void submitExpense() {
    if (titleController.text.isEmpty || amountController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill all fields.")));
      return;
    } else {
      print("Category: " + selectedCategory);
      print("title: " + titleController.text);
      print("Amount: " + amountController.text);

      final newExpense = Expense(
        title: titleController.text,
        amount: double.parse(amountController.text),
        category: selectedCategory,
        date: DateTime.now(),
      );


      setState(() {
        titleController.text = '';
        amountController.text = '';
        selectedCategory = "Food";

        Navigator.pop(context, newExpense);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Expense Form")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: titleController,

                decoration: InputDecoration(
                  labelText: "Enter title",
                  border: ShapedInputBorder(
                    shape: Border.all(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                decoration: InputDecoration(
                  labelText: "Enter amount",

                  border: ShapedInputBorder(
                    shape: Border.all(color: Colors.black),
                  ),
                ),
              ),
              DropdownButton<String>(
                value: selectedCategory,
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitExpense,
                child: Text("Save Expense"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
