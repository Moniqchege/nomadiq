import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/destination.dart';

class DestinationDetailScreen extends StatefulWidget {
  final Destination destination;

  const DestinationDetailScreen({super.key, required this.destination});

  @override
  // ignore: library_private_types_in_public_api
  _DestinationDetailScreenState createState() => _DestinationDetailScreenState();
}
// ignore: library_private_types_in_public_api
class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  String _selectedBudget = 'Budget';

  @override
  Widget build(BuildContext context) {
    final tourPlan = widget.destination.tourPlans[_selectedBudget]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.name),
        actions: [
          DropdownButton<String>(
            value: _selectedBudget,
            items: ['Budget', 'Mid-range', 'Luxury']
                .map((budget) => DropdownMenuItem(
              value: budget,
              child: Text(budget),
            ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedBudget = value!;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.destination.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://via.placeholder.com/200',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ).animate().fadeIn(duration: 400.ms),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ).animate().slideY(begin: 0.1, end: 0.0, duration: 300.ms),
                  const SizedBox(height: 8),
                  Text(widget.destination.description)
                      .animate()
                      .fadeIn(duration: 400.ms),
                  const SizedBox(height: 8),
                  Text('Location: ${widget.destination.location}')
                      .animate()
                      .fadeIn(duration: 400.ms),
                  const SizedBox(height: 16),
                  Text(
                    'Tour Plan (${_selectedBudget} - KSh ${tourPlan.budget.toStringAsFixed(0)}, ${tourPlan.duration} days)',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ).animate().fadeIn(duration: 400.ms),
                  const SizedBox(height: 8),
                  _buildTourPlanTable(tourPlan),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTourPlanTable(TourPlan tourPlan) {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      children: [
        _buildTableRow('Accommodations', tourPlan.accommodations.join(', ')),
        _buildTableRow('Dining', tourPlan.dining.join(', ')),
        _buildTableRow('Entertainment', tourPlan.entertainment.join(', ')),
      ],
    ).animate().fadeIn(duration: 400.ms);
  }

  TableRow _buildTableRow(String title, String content) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(content),
        ),
      ],
    );
  }
}