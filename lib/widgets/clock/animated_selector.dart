import 'package:flutter/material.dart';

class AnimatedSelector extends StatefulWidget {
  final int count;
  final double indicatorPosition;

  const AnimatedSelector(
      {Key? key, this.count = 10, this.indicatorPosition = 200})
      : super(key: key);

  @override
  State<AnimatedSelector> createState() => _AnimatedSelectorState();
}

class _AnimatedSelectorState extends State<AnimatedSelector> {
  @override
  Widget build(BuildContext context) {
    double _height = 36.0 * widget.count;

    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            bottom: widget.indicatorPosition,
            curve: Curves.easeOutCubic,
            child: Container(
              width: 37,
              height: _height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 87, 85, 85),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                children: List.generate(
                    widget.count,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text('$index'),
                        )).toList(),
              ),
            ),
          ),

          // Circle
          Container(
            width: 52,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black45,
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(.5),
                      offset: const Offset(-2, -2),
                      blurRadius: 1,
                      spreadRadius: 1)
                ]),
          )
        ],
      ),
    );
  }
}
