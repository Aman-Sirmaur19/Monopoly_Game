import 'dart:math';

import 'package:flutter/material.dart';

import '../models/piece.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final randomizer = Random();
  int index = 0;
  int currentDiceRoll = 2;
  List<MonopolyPiece> pieces = [
    MonopolyPiece(name: 'Car', color: Colors.red),
    MonopolyPiece(name: 'Hat', color: Colors.blue),
    MonopolyPiece(name: 'Dog', color: Colors.green),
    MonopolyPiece(name: 'Boot', color: Colors.yellow),
  ];

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      movePiece();
    });
  }

  void movePiece() {
    setState(() {
      pieces[index].move(currentDiceRoll);
    });
  }

  @override
  Widget build(BuildContext context) {
    int gridSize = 10;
    return Stack(
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridSize,
          ),
          itemBuilder: (context, index) {
            bool isBorder = (index < gridSize) ||
                (index >= gridSize * (gridSize - 1)) ||
                (index % gridSize == 0) ||
                (index % gridSize == gridSize - 1);
            MonopolyPiece? pieceOnSpace;
            for (var piece in pieces) {
              if (piece.position == index) {
                pieceOnSpace = piece;
                break;
              }
            }
            return isBorder
                ? BoardSpace(index, pieceOnSpace)
                : const SizedBox();
          },
          itemCount: gridSize * gridSize,
        ),
        Center(
          child: GestureDetector(
            onTap: rollDice,
            child: Image.asset(
              'assets/images/$currentDiceRoll.png',
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}

class BoardSpace extends StatelessWidget {
  final Map<int, dynamic> positionName = {
    90: [
      'Start',
      Colors.white,
    ],
    91: [
      'Pune',
      Colors.deepPurple.shade200,
    ],
    92: [
      'Varanasi',
      Colors.deepPurple.shade200,
    ],
    93: [
      'Post',
      Colors.white,
    ],
    94: [
      'Bhopal',
      Colors.deepPurple.shade200,
    ],
    95: [
      'Goa',
      Colors.amber,
    ],
    96: [
      'Transport',
      Colors.white,
    ],
    97: [
      'Agra',
      Colors.amber,
    ],
    98: [
      'Kolkata',
      Colors.amber,
    ],
    99: [
      'Jail Rs.500',
      Colors.white,
    ],
    89: [
      'Haryana',
      Colors.blue.shade200,
    ],
    79: [
      'Aero',
      Colors.white,
    ],
    69: [
      'Hyderabad',
      Colors.blue.shade200,
    ],
    59: [
      'Bengaluru',
      Colors.blue.shade200,
    ],
    49: [
      'Delhi',
      Colors.yellow.shade200,
    ],
    39: [
      'Chance',
      Colors.white,
    ],
    29: [
      'Telengana',
      Colors.yellow.shade200,
    ],
    19: [
      'Shimla',
      Colors.yellow.shade200,
    ],
    9: [
      'Rest',
      Colors.white,
    ],
    8: [
      'Assam',
      Colors.green.shade200,
    ],
    7: [
      'Chennai',
      Colors.green.shade200,
    ],
    6: [
      'Railway',
      Colors.white,
    ],
    5: [
      'Raipur',
      Colors.green.shade200,
    ],
    4: [
      'Kanpur',
      Colors.brown.shade200,
    ],
    3: [
      'Tax',
      Colors.white,
    ],
    2: [
      'Surat',
      Colors.brown.shade200,
    ],
    1: [
      'Mumbai',
      Colors.brown.shade200,
    ],
    0: [
      'Take Rs.500',
      Colors.white,
    ],
    10: [
      'Chittor',
      Colors.orange.shade300,
    ],
    20: [
      'Prayagraj',
      Colors.orange.shade300,
    ],
    30: [
      'Lucky Draw',
      Colors.white,
    ],
    40: [
      'Mathura',
      Colors.orange.shade300,
    ],
    50: [
      'Amritsar',
      Colors.pink.shade200,
    ],
    60: [
      'Gwalior',
      Colors.pink.shade200,
    ],
    70: [
      'Dairy',
      Colors.white,
    ],
    80: [
      'Jaipur',
      Colors.pink.shade200,
    ],
  };
  final int index;
  final MonopolyPiece? piece;

  BoardSpace(this.index, this.piece, {super.key});

  @override
  Widget build(BuildContext context) {
    String title = positionName[index][0];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: positionName[index][1],
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
            ),
          ),
          if (piece != null)
            Center(
              child: CircleAvatar(
                radius: 10,
                backgroundColor: piece!.color,
              ),
            ),
        ],
      ),
    );
  }
}
