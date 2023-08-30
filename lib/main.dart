import 'package:flutter/material.dart';
import 'screen/bottomNavigationBar.dart';
// import 'screen/loading2.dart';
// import 'screen/test999.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      initialRoute: '/loading1',
      routes: {
        '/loading1': (context) => const bottomNavigationBar(),
      },
    ),
  );
}