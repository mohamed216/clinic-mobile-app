import 'package:flutter/material.dart';
import 'package:clinic_mobile_app/constants/colors.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> doctors = [
      {'name': 'د. أحمد السكري', 'specialty': 'أخصائي الباطنة', 'status': 'متاح'},
      {'name': 'د. محمد Nasser', 'specialty': 'أخصائي القلب', 'status': 'مشغول'},
      {'name': 'د. سارةJohnson', 'specialty': 'أخصائي الأطفال', 'status': 'متاح'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.secondary,
              child: const Text(
                'الأطباء',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        backgroundColor: AppColors.secondary.withOpacity(0.1),
                        radius: 30,
                        child: const Icon(Icons.person, color: AppColors.secondary),
                      ),
                      title: Text(
                        doctor['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(doctor['specialty']),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: doctor['status'] == 'متاح'
                              ? Colors.green.withOpacity(0.1)
                              : Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          doctor['status'],
                          style: TextStyle(
                            color: doctor['status'] == 'متاح'
                                ? Colors.green
                                : Colors.orange,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
