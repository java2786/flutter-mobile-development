class Person{
  String? name;
  int? age;
  String? gender;
  String? dob;
  double? weight;
  double? height;
  String? city;
  String? area;
  String? phone;

  Person({
    required this.name, 
    required this.age, 
    this.gender="Male",
    this.dob = "01-01-2020",
    this.weight = 75,
    this.height = 5.7,
    this.city = "Delhi",
    this.area = "Cannought Place",
    this.phone = "1234567890"
  });
}

void main(){
  Person p1 = Person(name: "Ramesh", age: 22, phone: "9876987698");
  Person p2 = Person(name: "Dinesh", age: 22, city: "Pune");


  print(p2.name); 
  print(p2.age);
  print(p2.gender);
  print(p2.dob);
  print(p2.weight);
  print(p2.height);
  print(p2.city);
  print(p2.area);
  print(p2.phone);
}

