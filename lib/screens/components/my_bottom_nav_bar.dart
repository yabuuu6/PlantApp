import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/screens/camera/camera_screen.dart';
import 'package:plant_app/screens/home/home_screen.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/maps/maps_screen.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;
  const MyBottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;

    late final Widget target;
    switch (index) {
      case 0:
        target = const HomeScreen();
        break;
      case 2:
        target = const CameraScreen();
        break;
      case 3:
        target = const MapsScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
  context,
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => target,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // Tidak ada animasi sama sekali
    },
    transitionDuration: Duration.zero, // Durasi nol = instan
  ),
);

  }

  @override
  Widget build(BuildContext context) {
    final List<String> icons = [
      "assets/icons/flower.svg",
      "assets/icons/heart-icon.svg",
      "assets/icons/camera.svg",
      "assets/icons/location.svg",
      "assets/icons/user-icon.svg",
    ];

    return Container(
      height: 43,
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -1),
            blurRadius: 20,
            color: kPrimaryColor.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          final bool isActive = index == currentIndex;

          return Expanded(
            child: AnimatedSlide(
              offset: Offset(0, isActive ? -0.3 : 0),
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              child: GestureDetector(
                onTap: () => _navigate(context, index),
                behavior: HitTestBehavior.translucent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isActive
                            ? Colors.white.withOpacity(1)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        icons[index],
                        height: 24,
                        color: isActive ? kPrimaryColor : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}