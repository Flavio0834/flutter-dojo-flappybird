import 'dart:async';

import 'package:flutter/material.dart';

import 'bird.dart';
import 'pipe.dart';
import 'score.dart';

final _pipeWidth = 80.0;
const _gravity = -4.9;
const _velocity = 2.5;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _birdY = 0.0;
  var _gameStarted = false;
  var initialPos = 0.0;
  var time = 0.0;
  var xPipeAlignment = 1.0;

  void _startGame() {
    _gameStarted = true;
    var height = 0.0;

    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      height = _gravity * time * time + _velocity * time;

      setState(() {
        _birdY = initialPos - height;
      });

      time += 0.01;
      xPipeAlignment -= 0.01;

      if (_birdIsDead()) {
        timer.cancel();
        _showGameOverDialog();
      }
    });
  }

  void _jump() {
    setState(() {
      time = 0;
      initialPos = _birdY;
    });
  }

  bool _birdIsDead() {
    return true ? (_birdY < -1 || _birdY > 1) : false;
  }

  void _showGameOverDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: Center(
              child: Text(
                'Game over!'.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              MaterialButton(
                color: Colors.grey[100],
                onPressed: () {
                  restartGame();
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.refresh,
                  color: Colors.brown,
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        });
  }

  void restartGame() {
    setState(() {
      _birdY = 0;
      time = 0;
      initialPos = 0;
      xPipeAlignment = 1;
      _gameStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _gameStarted ? _jump : _startGame,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment(-0.5, _birdY),
                      child: const Bird(
                        birdSize: 50,
                      ),
                    ),
                    Pipe(
                      pipeHeight: 150,
                      pipeWidth: _pipeWidth,
                      xPipeAlignment: xPipeAlignment,
                    ),
                    Pipe(
                      pipeHeight: 300,
                      pipeWidth: _pipeWidth,
                      xPipeAlignment: xPipeAlignment,
                      isBottomPipe: true,
                    ),
                    // display below container if game isn't started

                    if (!_gameStarted)
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
              child: const GameScore(),
            ),
          )
        ],
      ),
    );
  }
}
