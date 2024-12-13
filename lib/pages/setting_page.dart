import 'package:escort/utils/colors.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: const Center(child: Text("Settings Page")),
    );
  }
}
