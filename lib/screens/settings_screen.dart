import 'package:flutter/material.dart';
import 'package:clinic_mobile_app/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.textPrimary,
              child: const Row(
                children: [
                  Text(
                    'الإعدادات',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  _buildSettingItem(
                    icon: Icons.person,
                    title: 'الملف الشخصي',
                    subtitle: 'تعديل المعلومات',
                    color: Colors.blue,
                  ),
                  _buildSettingItem(
                    icon: Icons.notifications,
                    title: 'الإشعارات',
                    subtitle: 'إعدادات الإشعارات',
                    color: Colors.green,
                  ),
                  _buildSettingItem(
                    icon: Icons.language,
                    title: 'اللغة',
                    subtitle: 'العربية',
                    color: Colors.orange,
                  ),
                  _buildSettingItem(
                    icon: Icons.lock,
                    title: 'الأمان',
                    subtitle: 'تغيير كلمة المرور',
                    color: Colors.purple,
                  ),
                  _buildSettingItem(
                    icon: Icons.local_hospital,
                    title: 'معلومات العيادة',
                    subtitle: 'اسم وبيانات العيادة',
                    color: Colors.red,
                  ),
                  _buildSettingItem(
                    icon: Icons.help,
                    title: 'المساعدة',
                    subtitle: 'الدعم الفني',
                    color: Colors.cyan,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: 10),
                        Text(
                          'تسجيل الخروج',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
