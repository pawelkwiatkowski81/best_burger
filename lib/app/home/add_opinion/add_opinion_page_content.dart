import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    super.key,
  });

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

var restaurantName = '';
var burgerName = '';

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Add Place/Restaurant'),
            onChanged: (newValue) {
              setState(() {
                restaurantName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Add Burger'),
            onChanged: (newValue) {
              setState(() {
                burgerName = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('Restaurants').add({
                'name': restaurantName,
                'burger': burgerName,
                'rating': 5.0,
              });
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
