# Vehicle Showroom Management System (ระบบจัดการโชว์รูมยานยนต์)
## Lab 3: Object Oriented Programming Application

### โจทย์:
นำหลักการ OOP มาประยุกต์ใช้สร้างระบบจัดการสินค้า โดยเปลี่ยนจากสินค้าทั่วไปเป็น **"ยานพาหนะ (Vehicle)"** โดยมีข้อกำหนดดังนี้:
1.  **Class Creation:** สร้าง Class แม่และลูก
2.  **Encapsulation:** ซ่อนข้อมูลสำคัญด้วย Private Variable (`_`)
3.  **Getter/Setter:** ใช้ในการเข้าถึงและตรวจสอบความถูกต้องของข้อมูล
4.  **Inheritance:** การสืบทอดคุณสมบัติจากแม่สู่ลูก

---

## ผลลัพธ์การทำงาน (Output)
<img width="608" height="518" alt="image" src="https://github.com/user-attachments/assets/62706bc6-f6c8-4314-b44a-f0e959abdc93" />

---

## คำอธิบายโค้ด (Code Explanation)

### 1. Encapsulation (การห่อหุ้มข้อมูล)
* **Private Variable:** ผมใช้ `_price` เป็นตัวแปร Private เพื่อป้องกันการแก้ไขราคาโดยพลการจากภายนอก
* **Data Validation:** ในส่วนของ `Setter` (set price) ผมได้เขียนเงื่อนไขดักไว้ว่า **"ราคารถต้องไม่ต่ำกว่า 0"** หากมีการป้อนค่าติดลบ ระบบจะแจ้งเตือน Error และไม่ทำการบันทึกค่า เพื่อความปลอดภัยของข้อมูล

### 2. Inheritance (การสืบทอด)
* สร้าง Class `Vehicle` เป็นแม่แบบ (Superclass) ที่เก็บคุณสมบัติพื้นฐาน เช่น `id`, `model`
* สร้าง Class `ElectricCar` และ `SuperBike` ให้ `extends Vehicle` เพื่อรับคุณสมบัติเหล่านั้นมาใช้ทันที โดยไม่ต้องเขียนโค้ดซ้ำซ้อน

### 3. Polymorphism & Overriding
* มีการใช้ `@override` ในเมธอด `displayDetails()` ของคลาสลูกแต่ละตัว
* **ผลลัพธ์:** แม้จะสั่งแสดงผลด้วยคำสั่งเดียวกัน แต่ `ElectricCar` จะแสดงข้อมูล **"แบตเตอรี่ (kWh)"** ในขณะที่ `SuperBike` จะแสดงข้อมูล **"ความแรง (cc)"** แยกกันตามประเภทรถอย่างถูกต้อง

### 4. Null Safety & Logic
* ออกแบบ Logic การตัดเงินหรือคำนวณส่วนต่างราคาใน Setter เพื่อให้เห็นการเปลี่ยนแปลงที่ชัดเจนเมื่อมีการอัปเดตข้อมูล

## Source Code
ดูโค้ดฉบับเต็มได้ที่ไฟล์: `lab3.dart`
