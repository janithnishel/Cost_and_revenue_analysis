import 'package:expenses/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final double? width;
  final double? height;
  final double? radius;

  const CustomButton({
    super.key,
    required this.title,
    this.color,
    this.width,
    this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 100),
        color: color ?? kMainColor,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: kWhite,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
