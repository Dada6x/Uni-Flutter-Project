import 'package:flutter/material.dart';
import 'package:get/get.dart';

// this is button that takes string and width and function
class ProjectButton extends StatelessWidget {
  final String text;
  final double width;
  final Function? function;

  const ProjectButton({
    super.key,
    required this.text,
    required this.width,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Get.isDarkMode ? Colors.black : Colors.white,
          fixedSize: Size(width, 10)),
      onPressed: () {
        function!();
      },
      child: Text(text),
    );
  }
}
