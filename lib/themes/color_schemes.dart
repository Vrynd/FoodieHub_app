import 'package:flutter/material.dart';

enum RestaurantColors {
  primary("green", Color(0xFF48672E));

  const RestaurantColors(this.name, this.color);

  final String name;
  final Color color;
}
