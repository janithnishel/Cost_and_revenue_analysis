import 'package:expenses/constant/colors.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
          width: 100,
        ),
        const SizedBox(height: 10),
        const Text(
          "Expenz",
          style: TextStyle(
            color: kMainColor,fontSize: 40,fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }
}
