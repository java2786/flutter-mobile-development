import 'dart:math';

import 'package:expense_tracker/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseDetailsScreen extends StatelessWidget{
  final Expense expense;
  ExpenseDetailsScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Details"),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Title: ${expense.title}", style: TextStyle(fontSize: 20),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red[600]),
              onPressed: (){
                Navigator.pop(context, "delete");
              }, 
              child: Text("Delete Expense", style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}