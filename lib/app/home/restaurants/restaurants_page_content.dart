import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestaurantPageContent extends StatelessWidget {
  const RestaurantPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('Restaurants')
          .orderBy('rating', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text('Please wait , Loading'));
        }

        final documents = snapshot.data!.docs;

        return ListView(
          children: [
            for (final document in documents) ...[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          document['name'],
                        ),
                        Text(
                          document['burger'],
                          style: const TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                    Text(document['rating'].toString()),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
