import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: Text("Mini Cricket"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      body: PlayGame(),
    );
  }
}

class PlayGame extends StatefulWidget {
  const PlayGame({super.key});

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  int runs = 0;
  int balls = 6;
  int lastRun = 0;
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 160,
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset("assets/img/cricket-bat.jpg"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Runs",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    runs.toString(),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 160,
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset("assets/img/cricket-ball.jpg"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Balls",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    balls.toString(),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 40),

        Column(
          children: [
            if (balls != 6)
              Text(
                "Runs: ${lastRun.toString()}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (balls > 0) {
                    int runScored = random.nextInt(6) + 1;
                    runs += runScored;
                    balls--;
                    lastRun = runScored;
                  } else {
                    runs = 0;
                    balls = 6;
                    lastRun = 0;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: balls > 0 ? Colors.blue[900] : Colors.red[900],
                foregroundColor: Colors.white,
              ),
              child: Text(
                balls > 0 ? "Bat" : "Restart",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
