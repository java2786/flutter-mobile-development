class Expense {
  String title;
  double amount;
  String category;
  DateTime date;

Expense({
  required this.title,
  required this.amount,
  required this.category,
  required this.date
});
}

// void main(){
//   var kharcha = Expense(title:"Mobile recharge", amount:299, category:"Recharge", date:DateTime.now());
//   print(kharcha.title);
// }