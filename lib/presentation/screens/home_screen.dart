import 'package:flutter/material.dart';
import '../widgets/store_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stores = [
      {'name': 'Willys Älvängen', 'location': 'Göteborg'},
      {'name': 'Lidl Backaplan', 'location': 'Göteborg'},
      {'name': 'ICA Majorna', 'location': 'Göteborg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Svinnsmart – Välj butik'),
      ),
      body: ListView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final store = stores[index];
          return StoreCard(
            name: store['name']!,
            location: store['location']!,
          );
        },
      ),
    );
  }
}
