import 'dart:io';

class Customer{
  String gender;
  int age;
  int salary;

  Customer(this.gender, this.age, this.salary);

    void cheakLoanApproval() {
        bool approved = false;     

        if (gender == "male") {
        approved = age >= 23 && age <= 60 && salary >= 25000;
        } else if (gender == "female") {
        approved = age >= 21 && age <= 62 && salary >= 30000;
        } else if (gender != "male" && gender != "female") {
        approved = age >= 22 && age <= 60 && salary >= 27000;
        } else {
        print("Invalid Gender!");
        return;
        }

        if (approved) {
        print("Loan Approved");
        } else {
        print("Loan Rejected");
        }
    }
}


void main() {
  print("Enter Gender (male/female):");
  String gender = stdin.readLineSync()!.toLowerCase();

  print("Enter Age:");
  int age = int.parse(stdin.readLineSync()!);

  print("Enter Salary:");
  int salary = int.parse(stdin.readLineSync()!);

  Customer obj = Customer(gender, age, salary);

  obj.cheakLoanApproval();
}
