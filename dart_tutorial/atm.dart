import 'dart:io';

double balance = 5000;
int user_pin = 1234;

void user_menu() {
  int choice = 1;

while(choice!=4){
  print("**** Welcome User ****");
  print("1. Cheak bal");
  print("2. Withdraw bal");
  print("3. Change pin");
  print("4. Exit");

      print("please enter your choice : ");
      choice = int.parse(stdin.readLineSync()!);

      if (choice == 1) {
        print(" your balance is : $balance");
        user_menu();
      } else if (choice == 2) {
        print("enter widraw_amount");
        int widraw_bal = int.parse(stdin.readLineSync()!);
        if (widraw_bal < balance) {
          balance = balance - widraw_bal;
          print("this is your current balance : $balance");
        } else {
          print("widraw_bal is greater than balance");
        }
        
      } else if (choice == 3) {
        print("enter new pin");
        int new_pin = int.parse(stdin.readLineSync()!);
        user_pin = new_pin;
        print("pin changed successfully. this is your new pin : $new_pin");
        
      } else if (choice == 4) {
        print("Doing Logout.");
      } else {
        print("invalid choice");
      }
    

}
      
}

void main_menu() {
    int choice = 0;

    while(choice!=3){
        print("**** welcome to famous ATM ****");
        print("1. Login");
        print("2. Forgot Pin");
        print("3. Exit");

        print("enter choice ");
        choice = int.parse(stdin.readLineSync()!);
        if (choice == 1) {
            print("enter pin to login ");
            int pin = int.parse(stdin.readLineSync()!);
            if(pin == user_pin){
                user_menu();
            } else {
                print("Try again.");
            }
        } else if (choice == 2) {
            print("You forgot your pin. This feature is COMING SOON...");
        } else if (choice == 3) {
            print("Bye Bye");
        } else {
            print("Invalid input");
        }
    }
}

void main() {


  main_menu();

  
}
