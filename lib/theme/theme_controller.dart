import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamamia_uniproject/theme/themes.dart';

class ThemeController extends GetxController {
  bool isDarkMode = Get.isDarkMode;

  void toggleTheme() {
    if (isDarkMode) {
      Get.changeTheme(Themes().lightMode);
    } else {
      Get.changeTheme(Themes().darkMode);
    }
    isDarkMode = !isDarkMode;
    update(); 
  }
}

// should be in the components shit not here
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return ListTile(
          onTap: controller.toggleTheme,
          title: Text(
            controller.isDarkMode ? "Light Mode".tr : "Dark Mode".tr,
          ),
          leading: Icon(
              controller.isDarkMode ? Icons.sunny : Icons.nightlight_round,
              color: Theme.of(context).colorScheme.primary),
        );
      },
    );
  }
}

class ThemeToggleButtonIcon extends StatelessWidget {
  const ThemeToggleButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return IconButton(
          onPressed: controller.toggleTheme,
          icon: Icon(
              controller.isDarkMode ? Icons.sunny : Icons.nightlight_round,
              color: Theme.of(context).colorScheme.primary),
        );
      },
    );
  }
}
