import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        title: const Text('Svinnsmart - Välj butik'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Admin Login knapp
          ElevatedButton(
            onPressed: () => context.go('/admin-login'),
            child: const Text('Admin Login'),
          ),

          const SizedBox(height: 10),

          // Kund Login knapp
          ElevatedButton(
            onPressed: () => context.go('/customer-login'),
            child: const Text('Kund Login'),
          ),

          const SizedBox(height: 20),

          const Divider(),

          const Text(
            'Butiker',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // Expanded lista med butiker
          Expanded(
            child: ListView.builder(
              itemCount: stores.length,
              itemBuilder: (context, index) {
                final store = stores[index];
                return StoreCard(
                  name: store['name']!,
                  location: store['location']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
