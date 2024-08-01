import 'package:expenses/screens/main_page.dart';
import 'package:expenses/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final bool isHasData;

  const Wrapper({super.key, required this.isHasData});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.isHasData ? const MainPage() : const OnboardingScreen();
  }
}
