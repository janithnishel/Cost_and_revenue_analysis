import 'package:expenses/constant/colors.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double width;

  const SharedOnboardingScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: width,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: kBlack,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGrey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
