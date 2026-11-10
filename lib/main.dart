import 'package:flutter/material.dart';

// Colours used in the app
const Color black = Colors.black;
const Color darkBlue = Color(0xFF0D47A1);
const Color lightBlue = Color(0xFF64B5F6);

void main() {
  runApp(const App());
}

void doSomething() {
  debugPrint('Menu button pressed');
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // hides the red DEBUG ribbon
      home: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: doSomething,
            icon: const Icon(Icons.menu),
          ),
          backgroundColor: darkBlue,
          foregroundColor: Colors.white,
          title: const Text("Profile"),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile picture with a light blue ring
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightBlue,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/raccoon.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Bong Bong",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              // "Student" pill badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: darkBlue,
                  borderRadius: BorderRadius.circular(88.888),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.school, size: 17, color: lightBlue),
                    SizedBox(width: 4),
                    Text(
                      "Student",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Skill card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: darkBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.code, size: 38, color: lightBlue),
                          SizedBox(height: 10),
                          Text(
                            "80%",
                            style: TextStyle(
                              color: lightBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Web Dev",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
