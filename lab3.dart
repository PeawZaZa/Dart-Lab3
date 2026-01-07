void main() {
  print("=== 🏁 เปิดระบบโชว์รูมยานยนต์ (Vehicle Showroom) 🏁 ===\n");

  // 1. สร้างยานพาหนะประเภทต่างๆ (Polymorphism)
  // สร้างรถยนต์ไฟฟ้า (EV)
  ElectricCar tesla = ElectricCar(
    id: "EV-001",
    model: "Tesla Model 3",
    price: 1590000,
    batteryCapacity: 75.0, // 75 kWh
  );

  // สร้างรถมอเตอร์ไซค์บิ๊กไบค์
  SuperBike ducati = SuperBike(
    id: "BK-999",
    model: "Ducati Panigale V4",
    price: 1200000,
    engineCC: 1103, // 1103 cc
  );

  // 2. ทดสอบการทำงาน
  // ทดสอบ Encapsulation & Setter (ลองตั้งราคาติดลบ)
  print("--- 🛠 ทดสอบแก้ไขราคา (Validation) ---");
  tesla.price = -500; // ต้องแจ้งเตือน Error
  tesla.price = 1490000; // ลดราคาขายจริง (สำเร็จ)

  // ทดสอบ Method เฉพาะ
  print("\n--- 🔋 ทดสอบระบบชาร์จไฟ ---");
  tesla.chargeBattery();

  // 3. แสดงผลข้อมูลทั้งหมด (Polymorphism loop)
  print("\n--- 📄 รายการยานพาหนะในโชว์รูม ---");
  List<Vehicle> showroom = [tesla, ducati];

  for (var vehicle in showroom) {
    vehicle.displayDetails(); // เรียกใช้เมธอดที่ Override มา
    print(""); // เว้นบรรทัดสวยๆ
  }
}

// ==========================================
// 1. สร้าง Class แม่ (Parent Class)
// ==========================================
class Vehicle {
  // Property สาธารณะ
  String id;
  String model;
  
  // 2. ซ่อนข้อมูลด้วย Private (_) (Encapsulation)
  double _price; 

  Vehicle({
    required this.id, 
    required this.model, 
    required double price
  }) : _price = price; // กำหนดค่าเริ่มต้นให้ตัวแปร Private

  // 3. Getter/Setter
  // Getter อ่านค่าราคา
  double get price => _price;

  // Setter กำหนดราคาใหม่ พร้อม Validation
  set price(double newPrice) {
    if (newPrice > 0) {
      double diff = _price - newPrice;
      _price = newPrice;
      print("✅ อัปเดตราคา $model เป็น ${_formatMoney(_price)} บาท (ลดลง ${diff.abs()})");
    } else {
      print("❌ [Error] ราคาต้องมากกว่า 0 บาท! (คุณพยายามใส่: $newPrice)");
    }
  }

  // Method พื้นฐาน
  void displayDetails() {
    print("Layer: Vehicle (Base)");
    print("รุ่น: $model");
    print("ราคา: ${_formatMoney(_price)} บาท");
  }

  // Helper function จัดรูปแบบเงิน (แถมให้เพื่อความสวยงาม)
  String _formatMoney(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}

// ==========================================
// 4. สร้าง Class ลูก (Inheritance) - รถไฟฟ้า
// ==========================================
class ElectricCar extends Vehicle {
  double batteryCapacity; // ความจุแบต (kWh)

  // ส่งค่า id, model, price ไปยัง Constructor ของแม่ (super)
  ElectricCar({
    required String id,
    required String model,
    required double price,
    required this.batteryCapacity,
  }) : super(id: id, model: model, price: price);

  // เพิ่มฟังก์ชันเฉพาะของรถไฟฟ้า
  void chargeBattery() {
    print("⚡ กำลังชาร์จไฟให้ $model (ความจุ $batteryCapacity kWh)... เต็ม 100% แล้ว!");
  }

  @override
  void displayDetails() {
    print("🚗 [รถยนต์ไฟฟ้า EV]");
    print("รหัส: $id");
    print("รุ่น: $model");
    print("ราคา: ${price} บาท"); // ใช้ Getter price
    print("แบตเตอรี่: $batteryCapacity kWh");
    print("สถานะ: พร้อมจำหน่าย");
  }
}

// ==========================================
// 4. สร้าง Class ลูก (Inheritance) - บิ๊กไบค์
// ==========================================
class SuperBike extends Vehicle {
  int engineCC; // ขนาดเครื่องยนต์ (cc)

  SuperBike({
    required String id,
    required String model,
    required double price,
    required this.engineCC,
  }) : super(id: id, model: model, price: price);

  @override
  void displayDetails() {
    print("🏍️ [ซูเปอร์ไบค์]");
    print("รหัส: $id");
    print("รุ่น: $model");
    print("ราคา: ${price} บาท");
    print("ความแรง: $engineCC cc");
    print("สถานะ: พร้อมซิ่ง");
  }
}