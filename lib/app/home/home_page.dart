import 'package:best_burger/app/home/add_opinion/add_opinion_page_content.dart';
import 'package:best_burger/app/home/my_account/my_account_page_content.dart';
import 'package:best_burger/app/home/restaurants/restaurants_page_content.dart';
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
      appBar: AppBar(
        title: Builder(builder: (context) {
          if (currentIndex == 1) {
            return const Text('Add next burger place');
          }
          if (currentIndex == 2) {
            return const Text('Your account');
          }
          return const Text('Best Burger In Netherlands');
        }),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const RestaurantPageContent();
        }
        if (currentIndex == 1) {
          return const AddOpinionPageContent();
        }
        return MyAccountPageContent(email: widget.user.email);
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
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add more'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2), label: 'My account'),
        ],
      ),
    );
  }
}
