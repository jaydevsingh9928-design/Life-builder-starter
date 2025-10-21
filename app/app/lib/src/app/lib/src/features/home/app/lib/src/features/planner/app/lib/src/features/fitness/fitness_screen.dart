import 'package:flutter/material.dart';

class FitnessScreen extends StatelessWidget {
  const FitnessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fitness')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(title: Text('Program'), subtitle: Text('Upper/Lower • Week 3/12')),
          ListTile(title: Text('Today'), subtitle: Text('Bench 4x6 @ RPE8 • Row 4x8 • Dips 3xAMRAP')),
        ],
      ),
    );
  }
}
