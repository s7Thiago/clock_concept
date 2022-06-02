import 'dart:async';

import 'package:clock_concept/widgets/clock/animated_selector.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    debugPrint('agora: $now');

    return Container(
      //color: Colors.blueGrey,
      width: MediaQuery.of(context).size.width * .93,
      height: MediaQuery.of(context).size.height * .87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Dezena Horas
          AnimatedSelector(
            count: 3,
            indicatorPosition: 38 + (36 * 7) + ((now.hour ~/ 10) * 36.0),
          ),

          // Unidade Horas
          AnimatedSelector(
            indicatorPosition: 38 + ((now.hour % 10) * 36.0),
          ),

          // Dezena Minutos
          AnimatedSelector(
            count: 6,
            indicatorPosition: 38 + (36 * 4) + ((now.minute ~/ 10) * 36.0),
          ),

          // Unidade Minutos
          AnimatedSelector(
            indicatorPosition: 38 + ((now.minute % 10) * 36.0),
          ),

          // Dezena Segundos
          AnimatedSelector(
            count: 6,
            indicatorPosition: 38 + (36 * 4) + ((now.second ~/ 10) * 36.0),
          ),

          // Unidade segundos
          AnimatedSelector(
            indicatorPosition: 38 + ((now.second % 10) * 36.0),
          ),
        ],
      ),
    );
  }
}
