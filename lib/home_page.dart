import 'package:flutter/material.dart';
import 'bird.dart';

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
                alignment: const Alignment(-0.5, 0),
                child: const Bird(birdSize: 50),
              )),
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
