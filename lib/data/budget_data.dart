import 'package:flutter/material.dart';

class BudgetOption {
  final String title;
  final String price;
  final int days;
  final Color color;

  BudgetOption({
    required this.title,
    required this.price,
    required this.days,
    required this.color,
  });
}

final List<BudgetOption> budgetOptions = [
  BudgetOption(
    title: 'Luxury',
    price: '\$1500',
    days: 5,
    color: Colors.blueAccent,
  ),
  BudgetOption(
    title: 'Midrange',
    price: '\$800',
    days: 3,
    color: Colors.green,
  ),
  BudgetOption(
    title: 'Budget',
    price: '\$400',
    days: 2,
    color: Colors.orange,
  ),
];