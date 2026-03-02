class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String status;
  final String? phone;
  final double? consultationFee;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.status,
    this.phone,
    this.consultationFee,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      specialty: json['specialty'] ?? '',
      status: json['status'] ?? 'غير متاح',
      phone: json['phone'],
      consultationFee: json['consultationFee']?.toDouble(),
    );
  }
}
