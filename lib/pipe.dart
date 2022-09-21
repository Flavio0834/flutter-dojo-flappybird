import 'package:flutter/material.dart';

class Pipe extends StatelessWidget {
  const Pipe(
      {Key? key,
      required this.pipeHeight,
      required this.pipeWidth,
      required this.xPipeAlignment,
      this.isBottomPipe = false})
      : super(key: key);

  final double pipeHeight;
  final double pipeWidth;
  final bool isBottomPipe;
  final double xPipeAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(xPipeAlignment, isBottomPipe ? 1 : -1),
      child: Container(
        width: pipeWidth,
        height: pipeHeight,
        color: Colors.green,
      ),
    );
  }
}
