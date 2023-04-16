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
  String timeString = '0:00:00';
  bool running = false;
  bool enable = false;

  String timeFormat(int duration) {
    return Duration(seconds: times).toString().split('.')[0];
  }

  void changeTime({required int second}) {
    times += second;
    times = times < 0 ? 0 : times;
    setState(() {
      timeString = timeFormat(times);
    });
  }

  void timeStartStop() {
    if (!running && times > 0) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (times <= 0) {
            timer.cancel();
          } else {
            running = true;
            times--;
            timeString = timeFormat(times);
          }
        });
      });
    } else {
      running = false;
      timer.cancel();
      setState(() {
        timeString = timeFormat(times);
      });
    }
  }

  void timeReset() {
    setState(() {
      timer.cancel();
      running = false;
      timeString = '0:00:00';
      times = 0;
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
                    'My Simple Timer',
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
                      onTap: () => changeTime(second: 30),
                      child: const TimeButton(
                          icon: Icon(Icons.add_circle_outline),
                          second: '30',
                          color: Colors.cyan),
                    ),
                    GestureDetector(
                      onTap: () => changeTime(second: -30),
                      child: const TimeButton(
                          icon: Icon(Icons.remove_circle_outline_rounded),
                          second: '30',
                          color: Colors.orange),
                    ),
                    GestureDetector(
                      onTap: () => changeTime(second: -60),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !running
                    ? IconButton(
                        iconSize: 100,
                        disabledColor: Colors.grey,
                        alignment: Alignment.center,
                        onPressed: timeStartStop,
                        icon: const Icon(
                          Icons.play_circle_outline_outlined,
                          // size: 70,
                          color: Colors.pink,
                        ))
                    : IconButton(
                        iconSize: 100,
                        onPressed: timeStartStop,
                        icon: const Icon(
                          Icons.pause_circle_outline_outlined,
                          // size: 70,
                          color: Colors.pink,
                        )),
                const SizedBox(width: 30),
                IconButton(
                    iconSize: 100,
                    onPressed: timeReset,
                    icon: const Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.white,
                      // size: 70,
                    ))
              ],
            )
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
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [icon, Text(second)],
      ),
    );
  }
}
