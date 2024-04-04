import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
