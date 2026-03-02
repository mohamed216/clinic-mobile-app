class Patient {
  final String id;
  final String name;
  final String code;
  final String gender;
  final int age;
  final String? phone;
  final String? email;
  final String? bloodType;

  Patient({
    required this.id,
    required this.name,
    required this.code,
    required this.gender,
    required this.age,
    this.phone,
    this.email,
    this.bloodType,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      gender: json['gender'] ?? '',
      age: json['age'] ?? 0,
      phone: json['phone'],
      email: json['email'],
      bloodType: json['bloodType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'gender': gender,
      'age': age,
      'phone': phone,
      'email': email,
      'bloodType': bloodType,
    };
  }
}
