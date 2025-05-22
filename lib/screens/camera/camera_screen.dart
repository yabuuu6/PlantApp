import 'package:flutter/material.dart';
import 'package:plant_app/screens/components/my_bottom_nav_bar.dart';
import 'package:plant_app/screens/camera/components/home_camera_page.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: SafeArea(
      child: const MyBottomNavBar(currentIndex: 2),)
    );
  }
}