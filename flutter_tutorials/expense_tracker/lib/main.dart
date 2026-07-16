import 'package:expense_tracker/expense_model.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget{
  const ExpenseTrackerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{
  List<Expense> expenses = [
    Expense(title:"Mobile recharge", amount:299, category:"Recharge", date:DateTime.now()),
    Expense(title:"College to Home Cab", amount:350, category:"Travel", date:DateTime(2026, 7, 1)),
    Expense(title:"Lunch", amount:80, category:"Food", date:DateTime(2026, 6, 23))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracker App"),),
      // body: Center(child: Text("Expense List"),),
      body: 
      expenses.isNotEmpty?
      ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (BuildContext context, int index) {
            final expense = expenses[index];
            return ListTile(
              title: Text(expense.title),
              subtitle: Text(expense.category),
              trailing: Text("Rs. ${expense.amount.toStringAsFixed(2)}"),
              onTap: (){
                print("${expense.title} is clicked");
              },
            );
          },
        ): const Center(child: Text('No Expenses'))
    );
  }
}