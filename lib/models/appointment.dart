class Appointment {
  final String id;
  final String patientName;
  final String time;
  final String status;
  final String type;
  final String? notes;

  Appointment({
    required this.id,
    required this.patientName,
    required this.time,
    required this.status,
    required this.type,
    this.notes,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] ?? '',
      patientName: json['patientName'] ?? '',
      time: json['time'] ?? '',
      status: json['status'] ?? '',
      type: json['type'] ?? '',
      notes: json['notes'],
    );
  }
}
