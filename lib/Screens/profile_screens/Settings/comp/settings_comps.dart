import 'package:flutter/material.dart';

class SettingsComps extends StatelessWidget {
  final String title;
  final Icon? icon;
  final Function destination;
  final Widget? trailing;
  const SettingsComps(
      {super.key,
      required this.title,
      this.icon,
      required this.destination,
      this.trailing});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0.0),
      child: ListTile(
        onTap: () => destination(),
        title: Text(
          title,
          style: const TextStyle(),
        ),
        leading: icon,
        trailing: trailing,
      ),
    );
  }
}