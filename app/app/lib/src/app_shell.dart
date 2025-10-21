import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'features/home/home_screen.dart';
import 'features/planner/planner_screen.dart';
import 'features/fitness/fitness_screen.dart';
import 'features/money/money_screen.dart';

class AppShell extends ConsumerStatefulWidget {
  const AppShell({super.key});
  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  int _index = 0;
  final _tabs = const [
    HomeScreen(),
    PlannerScreen(),
    FitnessScreen(),
    MoneyScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.schedule), label: 'Planner'),
          NavigationDestination(icon: Icon(Icons.fitness_center), label: 'Fitness'),
          NavigationDestination(icon: Icon(Icons.currency_rupee), label: 'Money'),
        ],
      ),
    );
  }
}
