import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    super.key,
    required this.onSave,
  });

  final Function onSave;

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

var restaurantName = '';
var burgerName = '';
var rating = 3.0;

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration:
                  const InputDecoration(hintText: 'Add Place/Restaurant'),
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
            Slider(
              value: rating,
              onChanged: (newValue) {
                setState(() {
                  rating = newValue;
                });
              },
              min: 0.0,
              max: 10.0,
              divisions: 20,
              label: rating.toString(),
            ),
            ElevatedButton(
              onPressed: restaurantName.isEmpty || burgerName.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('Restaurants').add({
                        'name': restaurantName,
                        'burger': burgerName,
                        'rating': rating,
                      });
                      widget.onSave();
                    },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
