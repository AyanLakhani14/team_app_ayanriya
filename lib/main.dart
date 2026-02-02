feature/theme-switcher

import 'dart:math';
main
import 'package:flutter/material.dart';

// Theme options
final Map<String, MaterialColor> appThemes = {
  'Purple': Colors.purple,
  'Blue': Colors.blue,
  'Green': Colors.green,
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentTheme = 'Purple';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Awesome App',
      theme: ThemeData(
        primarySwatch: appThemes[_currentTheme],
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(
        currentTheme: _currentTheme,
        onThemeChanged: (theme) {
          setState(() {
            _currentTheme = theme;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String currentTheme;
  final ValueChanged<String> onThemeChanged;

  const HomePage({
    super.key,
    required this.currentTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter is Fun!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Theme: '),
                DropdownButton<String>(
                  value: currentTheme,
                  items: appThemes.keys
                      .map(
                        (theme) => DropdownMenuItem(
                          value: theme,
                          child: Text(theme),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      onThemeChanged(value);
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            const ProfileCard(
              name: 'Riya Dinani',
              major: 'Computer Science',
            ),

            const SizedBox(height: 20),

            const Text(
              'Welcome to My App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text(
              "Let's learn Flutter together",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

feature/theme-switcher
            
            // Styled button + rotates quotes
main
            ElevatedButton(
              onPressed: () {
                debugPrint('Pressed!');
              },
              child: const Text('Press Here!'),
            ),

feature/theme-switcher
            const SizedBox(height: 30),

            const Text('Created by: Riya Dinani'),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String major;

  const ProfileCard({
    super.key,
    required this.name,
    required this.major,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.person, size: 50),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Major: $major',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],

            // Icon Gallery (Row of 4–5 icons)
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.sports_soccer, size: 32),
                Icon(Icons.music_note, size: 32),
                Icon(Icons.code, size: 32),
                Icon(Icons.flight, size: 32),
                Icon(Icons.fitness_center, size: 32),
              ],
            ),

            const SizedBox(height: 12),

            // Signature line
            const Text(
              'Created by: Ayan Lakhani',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
main
            ),
          ],
        ),
      ),
    );
  }
}
