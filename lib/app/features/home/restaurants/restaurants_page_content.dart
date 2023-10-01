import 'package:best_burger/app/features/home/restaurants/cubit/restaurants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantPageContent extends StatelessWidget {
  const RestaurantPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantsCubit()..start(),
      child: BlocBuilder<RestaurantsCubit, RestaurantsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text('Something went wrong: ${state.errorMessage}'),
            );
          }
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

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
      ),
    );
  }
}
