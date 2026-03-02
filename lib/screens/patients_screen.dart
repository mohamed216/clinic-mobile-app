import 'package:flutter/material.dart';
import 'package:clinic_mobile_app/constants/colors.dart';
import 'package:clinic_mobile_app/screens/add_patient_screen.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> patients = [
      {'name': 'أحمد محمد', 'code': 'PAT-001', 'gender': 'ذكر', 'age': 35},
      {'name': 'سارة علي', 'code': 'PAT-002', 'gender': 'أنثى', 'age': 28},
      {'name': 'محمد خالد', 'code': 'PAT-003', 'gender': 'ذكر', 'age': 45},
      {'name': 'ليلى Nasser', 'code': 'PAT-004', 'gender': 'أنثى', 'age': 32},
      {'name': 'عمر سعيد', 'code': 'PAT-005', 'gender': 'ذكر', 'age': 50},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddPatientScreen()),
        ),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'قائمة المرضى',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'بحث...',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Patients List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  final patient = patients[index];
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
                        backgroundColor: patient['gender'] == 'ذكر'
                            ? Colors.blue.withOpacity(0.1)
                            : Colors.pink.withOpacity(0.1),
                        child: Text(
                          patient['name'][0],
                          style: TextStyle(
                            color: patient['gender'] == 'ذكر'
                                ? Colors.blue
                                : Colors.pink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        patient['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${patient['code']} • ${patient['gender']} • ${patient['age']} سنة',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: AppColors.textSecondary,
                      ),
                      onTap: () {},
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
