import 'package:flutter/material.dart';

import '../widgets/board.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MONOPOLY',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                playerButton(() {}, 'Player 4'),
                playerButton(() {}, 'Player 3'),
              ],
            ),
            const SizedBox(
              height: 370,
              child: Board(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                playerButton(() {}, 'Player 1'),
                playerButton(() {}, 'Player 2'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget playerButton(void Function()? onPressed, String name) {
    return TextButton(
      onPressed: onPressed,
      style: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.black),
          side: MaterialStatePropertyAll(BorderSide(style: BorderStyle.solid))),
      child: Text(name),
    );
  }
}
