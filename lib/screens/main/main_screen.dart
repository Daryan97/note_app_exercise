import 'package:flutter/material.dart';

import 'main_app_bar.dart';
import 'main_body.dart';
import 'main_float.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: MainBody(),
      floatingActionButton: MainFloat(),
    );
  }
}
