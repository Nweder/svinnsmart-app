import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final String name;
  final String location;

  const StoreCard({
    super.key,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(location),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Sen: gå vidare till butikens produkter
        },
      ),
    );
  }
}
