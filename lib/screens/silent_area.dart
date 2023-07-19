import 'package:flutter/material.dart';
import 'package:flutter_1/screens/intro.dart';

class silent_area extends StatefulWidget {
  const silent_area({Key? key}) : super(key: key);

  @override
  _silent_areaState createState() => _silent_areaState();
}

class _silent_areaState extends State<silent_area> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('SILENT AREA')),
        body: Center(
            child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const intro())),
          child: const Text('intro'),
        )));
  }
}
