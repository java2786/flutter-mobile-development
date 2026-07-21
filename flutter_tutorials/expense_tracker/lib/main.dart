import 'package:expense_tracker/add_expense_screen.dart';
import 'package:expense_tracker/expense_detail_screen.dart';
import 'package:expense_tracker/expense_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> expenses = [
    Expense(
      title: "Mobile recharge",
      amount: 299,
      category: "Recharge",
      date: DateTime.now(),
    ),
    Expense(
      title: "College to Home Cab",
      amount: 350,
      category: "Travel",
      date: DateTime(2026, 7, 1),
    ),
    Expense(
      title: "Lunch",
      amount: 80,
      category: "Food",
      date: DateTime(2026, 6, 23),
    ),
  ];

  void navigateToAddExpense() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddExpenseScreen();
        },
      ),
    );

    if (result != null && result is Expense) {
      setState(() {
        expenses.add(result);
      });
    }
  }

  void navigateToDetail(Expense expense, int index) async {
    print("${expense.title} is clicked");

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          // return AddExpenseScreen();
          return ExpenseDetailsScreen(expense: expense);
        },
      ),
    );

    if(result == 'delete'){
      setState(() {
      // expenses.removeAt(index);
      int ei = -1;

      for(int i=0;i<expenses.length;i++){
        Expense currentExpense = expenses[i];
        if(currentExpense.title == expense.title &&
          currentExpense.amount == expense.amount &&
          currentExpense.category == expense.category && 
          currentExpense.date == expense.date){
            ei = i;
            break;
          }      
      }

      if(ei>-1){
        expenses.removeAt(ei);
      }
      });

    }
  }

  @override
  Widget build(BuildContext context) {

    double total = 0;
    for(int i=0;i<expenses.length;i++){
      total = total + expenses[i].amount;
    }

    return Scaffold(
      appBar: AppBar(title: Text("Expense Tracker App")),
      // body: Center(child: Text("Expense List"),),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.teal[100],
            child: Text(
              "Total Spent: Rs. ${total.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: expenses.isNotEmpty
                ? ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (BuildContext context, int index) {
                      final expense = expenses[index];
                      return ListTile(
                        title: Text(expense.title),
                        subtitle: Text(expense.category),
                        trailing: Text(
                          "Rs. ${expense.amount.toStringAsFixed(2)}",
                        ),
                        onTap: () {
                          navigateToDetail(expense, index);
                          // navigateToDetail
                        },
                      );
                    },
                  )
                : const Center(child: Text('No Expenses')),
          ),
          // FloatingActionButton(onPressed: navigateToAddExpense, child: Icon(Icons.add),)
          Align(
            alignment: Alignment.bottomRight, // or Alignment.bottomRight
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FloatingActionButton(
                onPressed: navigateToAddExpense,
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
