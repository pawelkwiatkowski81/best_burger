import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const Center(
            child: Text('One'),
          );
        }
        if (currentIndex == 1) {
          return const Center(
            child: Text('Two'),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You are logged in as ${widget.user.email}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text('Log Out'),
              )
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.reviews_sharp), label: 'Reviews'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Dodaj'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2), label: 'Moje konto'),
        ],
      ),
    );
  }
}
