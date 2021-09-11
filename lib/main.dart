import 'package:flutter/material.dart';

import './pages/home.page.dart';

void main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter2",
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}
