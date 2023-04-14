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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    'My timer',
                    style: TextStyle(fontSize: 30),
                  ),
                )),
            Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    TimeButton(
                        icon: Icon(Icons.add_circle_outline),
                        second: '60',
                        color: Colors.blue),
                    TimeButton(
                        icon: Icon(Icons.add_circle_outline),
                        second: '30',
                        color: Colors.blueAccent)
                  ],
                )),
            Flexible(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(color: Colors.brown),
                    child: const Center(
                      child: Text(
                        '00:00:00',
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                    ))),
            Flexible(
                child: Container(
              child: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.play_circle_outline_outlined,
                    size: 40,
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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [icon, Text(second)],
      ),
    );
  }
}
