import 'package:flutter/material.dart';
import 'bird.dart';
import 'pipe.dart';

final _pipeWidth = 80.0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.blue,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    alignment: const Alignment(-0.5, 0),
                    child: const Bird(
                      birdSize: 50,
                    ),
                  ),
                  Pipe(
                    pipeHeight: 150,
                    pipeWidth: _pipeWidth,
                    xPipeAlignment: 0.5,
                  ),
                  Pipe(
                    pipeHeight: 300,
                    pipeWidth: _pipeWidth,
                    xPipeAlignment: 0.5,
                    isBottomPipe: true,
                  ),
                  Container(
                    alignment: const Alignment(0, -0.3),
                    child: const Text(
                      'T A P  T O  P L A Y',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.brown,
          ),
        )
      ],
    );
  }
}
