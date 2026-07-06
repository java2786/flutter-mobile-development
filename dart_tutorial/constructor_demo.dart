class Computer{
  int ram;
  String brand;
  int storage;
  String? color;
  String? processor_name;
  String? model;

  // Computer(this.ram, this.brand, this.storage, this.color, this.processor_name, this.model);
  Computer({required this.ram, required this.brand, this.storage=500});
}
// TextSytle(fontSize: 32, fontWeight: FontWeight.bold)
void main(){
  Computer c = Computer(ram: 2, brand: "HCL");
  print(c.ram);
}