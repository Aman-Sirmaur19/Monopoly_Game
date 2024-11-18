import 'package:flutter/material.dart';

class MonopolyPiece {
  final String name;
  final Color color;
  int position;

  MonopolyPiece({
    required this.name,
    required this.color,
    this.position = 90,
  });

  // Method to move the piece
  void move(int steps) {
    if (steps == 0) return;
    if (position >= 90 && position < 99) {
      position = (position + 1) % 100;
    } else if (position <= 9 && position > 0) {
      position = (position - 1) % 100;
    } else if ((position + 1) % 10 == 0) {
      position = (position - 10) % 100;
    } else {
      position = (position + 10) % 100;
    }
    move(steps - 1);
  }
}
