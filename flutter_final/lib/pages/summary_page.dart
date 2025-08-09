import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final String name;
  final String city;
  final String age;
  final String nationallity;
  final List<String> hobbies;

  const SummaryPage({
    super.key,
    required this.name,
    required this.city,
    required this.age,
    required this.nationallity,
    required this.hobbies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: const TextStyle(fontSize: 18)),
            Text('City: $city', style: const TextStyle(fontSize: 18)),
            Text('Age: $age', style: const TextStyle(fontSize: 18)),
            Text('Nationallity: $nationallity',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text('Hobbies:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            hobbies.isEmpty
                ? const Text('No hobbies added')
                : Wrap(
                    spacing: 8.0,
                    children: hobbies
                        .map((hobby) => Chip(label: Text(hobby)))
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
