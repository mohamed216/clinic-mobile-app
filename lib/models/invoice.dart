class Invoice {
  final String id;
  final String patientName;
  final double amount;
  final String status;
  final DateTime date;

  Invoice({
    required this.id,
    required this.patientName,
    required this.amount,
    required this.status,
    required this.date,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'] ?? '',
      patientName: json['patientName'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
    );
  }
}
