import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final IconData icon;
  final Color backgroundColor;
  final int itemCount;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    this.backgroundColor = const Color(0xFFE9F5EC),
    this.itemCount = 24,
  });
}
