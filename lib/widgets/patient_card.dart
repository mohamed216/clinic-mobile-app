import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final String name;
  final String code;
  final String gender;
  final int age;
  final VoidCallback onTap;

  const PatientCard({
    super.key,
    required this.name,
    required this.code,
    required this.gender,
    required this.age,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMale = gender == 'ذكر';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: isMale 
              ? Colors.blue.withOpacity(0.1) 
              : Colors.pink.withOpacity(0.1),
          child: Text(
            name[0],
            style: TextStyle(
              color: isMale ? Colors.blue : Colors.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '$code • $gender • $age سنة',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
