import 'package:burnstien/homepage.dart';
import 'package:burnstien/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart'; // Ensure this imports your main page or login page

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Color(0xFF443627)),
        ),
        backgroundColor: const Color(0xFFF2F6D0),
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildSettingsTile('Account Settings', CupertinoIcons.person, () {}),
            _buildSettingsTile('Notifications', CupertinoIcons.bell, () {}),
            _buildSettingsTile('Privacy & Security', CupertinoIcons.lock, () {}),
            _buildSettingsTile('Appearance', CupertinoIcons.paintbrush, () {}),
            _buildSettingsTile('Language', CupertinoIcons.globe, () {}),
            _buildSettingsTile('Help & Support', CupertinoIcons.question_circle, () {}),
            _buildSettingsTile('About', CupertinoIcons.info_circle, () {}),
            const SizedBox(height: 20),
            CupertinoButton(
              color: const Color(0xFFD98324),
              borderRadius: BorderRadius.circular(20),
              child: const Text('Log Out', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => LoginPage()), // Change to LoginPage() if needed
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(String title, IconData icon, VoidCallback onTap) {
    return CupertinoListTile(
      leading: Icon(icon, color: const Color(0xFFD98324)),
      title: Text(title, style: const TextStyle(color: Color(0xFF443627), fontSize: 16)),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: const Icon(CupertinoIcons.forward, color: Color(0xFF443627)),
        onPressed: onTap,
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;

  const CupertinoListTile({super.key, required this.leading, required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              leading,
              const SizedBox(width: 10),
              title,
            ],
          ),
          trailing,
        ],
      ),
    );
  }
}
