import 'package:flutter/material.dart';

class AnimatedSelector extends StatefulWidget {
  final int count;
  final double indicatorPosition;
  final PageController pageController;

  const AnimatedSelector(
      {Key? key,
      this.count = 10,
      this.indicatorPosition = 200,
      required this.pageController})
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PageView.builder(
              itemCount: widget.count,
              scrollDirection: Axis.vertical,
              controller: widget.pageController,
              itemBuilder: (BuildContext context, int index) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 37,
                    height: _height,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 87, 85, 85),
                      borderRadius: index == 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            )
                          : index == widget.count - 1
                              ? const BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                )
                              : const BorderRadius.all(Radius.circular(0)),
                    ),
                    child: Text('$index'),
                  ),
                ],
              ),
            ),
          ),

          // Circle
          Container(
            width: 47,
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
