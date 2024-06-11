import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Piano());
}

class Piano extends StatelessWidget {
  const Piano({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              buildButton('music1.wav', "Do", Colors.red),
              buildButton('music2.wav', "Re", Colors.orange),
              buildButton('music3.wav', "Mi", Colors.yellow),
              buildButton('music4.wav', "Fa", Colors.green),
              buildButton('music5.wav', "Sol", Colors.blue),
              buildButton('music6.wav', "La", Colors.indigo),
              buildButton('music7.wav', "Ti", Colors.purple),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String path, String txt, Color colour) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final player = AudioPlayer();
          await player.play(AssetSource(path));
        },
        child: Container(
          decoration: BoxDecoration(
            color: colour,
          ),
          child: Center(
            child: Text(
              txt,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
