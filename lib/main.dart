import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Timer timer;
  int times = 0;
  String timeString = '00:00:00';

  void changeTime({required int second}) {
    times += second;
    setState(() {
      timeString = Duration(seconds: times).toString().split('.')[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    'My timer',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => changeTime(second: 60),
                      child: const TimeButton(
                          icon: Icon(Icons.add_circle_outline),
                          second: '60',
                          color: Colors.blue),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: const TimeButton(
                          icon: Icon(Icons.add_circle_outline),
                          second: '30',
                          color: Colors.cyan),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: const TimeButton(
                          icon: Icon(Icons.remove_circle_outline_rounded),
                          second: '30',
                          color: Colors.orange),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: const TimeButton(
                          icon: Icon(Icons.remove_circle_outline_rounded),
                          second: '60',
                          color: Colors.red),
                    ),
                  ],
                )),
            Flexible(
                flex: 1,
                child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        timeString,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ))),
            Flexible(
                child: Container(
              child: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.play_circle_outline_outlined,
                    size: 40,
                    color: Colors.pink,
                  )),
            ))
          ],
        ),
      ),
    );
  }
}

class TimeButton extends StatelessWidget {
  final Icon icon;
  final String second;
  final Color color;
  const TimeButton({
    super.key,
    required this.icon,
    required this.second,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Row(
        children: [icon, Text(second)],
      ),
    );
  }
}
