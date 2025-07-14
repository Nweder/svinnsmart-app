import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({super.key});

  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
  try {
    await _auth.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    print('Inloggad som: ${_auth.currentUser?.email}');
    if (context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    }
  } catch (e) {
    String errorMessage = 'Ett fel uppstod';
    if (e is FirebaseAuthException) {
      errorMessage = e.message ?? 'Okänt fel (Auth)';
    } else if (e is FirebaseException) {
      errorMessage = e.message ?? 'Okänt fel (Firebase)';
    } else {
      errorMessage = e.toString();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kund Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-post'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Lösenord'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text('Logga in'),
            ),
            TextButton(
              onPressed: () => context.go('/customer-register'),
              child: const Text('Inget konto? Skapa här'),
            ),
          ],
        ),
      ),
    );
  }
}
