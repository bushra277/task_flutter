import 'package:flutter/material.dart';
import 'package:flutter_final/pages/summary_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userCityController = TextEditingController();
  TextEditingController userAgeController = TextEditingController();
  TextEditingController userNationallityController = TextEditingController();

  List<String> hobbies = [];

  String? selectedHobby;
  final List<String> hobbyOptions = [
    'Reading',
    'Sports',
    'Traveling',
    'Cooking',
    'Music'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'The user name'),
                controller: userNameController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'The user city'),
                controller: userCityController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'The user age'),
                controller: userAgeController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration:
                    const InputDecoration(labelText: 'The user nationality'),
                controller: userNationallityController,
              ),
              const SizedBox(height: 20),

              // Dropdown
              DropdownButton<String>(
                value: selectedHobby,
                hint: const Text("Select a hobby"),
                items: hobbyOptions.map((String hobby) {
                  return DropdownMenuItem<String>(
                    value: hobby,
                    child: Text(hobby),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedHobby = value;
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (selectedHobby != null &&
                      !hobbies.contains(selectedHobby)) {
                    setState(() {
                      hobbies.add(selectedHobby!);
                    });
                  }
                },
                child: const Text("Add Hobby"),
              ),

              const SizedBox(height: 20),

              Wrap(
                spacing: 8.0,
                children: hobbies
                    .map((hobby) => Chip(
                          label: Text(hobby),
                          onDeleted: () {
                            setState(() {
                              hobbies.remove(hobby);
                            });
                          },
                        ))
                    .toList(),
              ),

              const SizedBox(height: 100),

              ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  final userName = userNameController.text.trim();
                  final userCity = userCityController.text.trim();
                  final userAge = userAgeController.text.trim();
                  final userNationallity =
                      userNationallityController.text.trim();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryPage(
                        name: userName,
                        city: userCity,
                        age: userAge,
                        nationallity: userNationallity,
                        hobbies: hobbies,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

