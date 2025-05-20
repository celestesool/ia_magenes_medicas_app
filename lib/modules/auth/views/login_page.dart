// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously
//import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'register_page.dart';
import '../../dashboard/dashboard_page.dart';
import '../../../services/biometric_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController ciController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void _handleBiometricLogin() async {
      final success = await BiometricService.authenticateUser();

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Autenticación biométrica exitosa')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Falló la autenticación biométrica')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Iniciar sesión")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: ciController,
              decoration: const InputDecoration(labelText: "CI"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí iriá la lógica para validar contra el backend
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const DashboardPage()));
              },
              child: const Text("Ingresar con CI y contraseña"),
            ),
            ElevatedButton.icon(
              onPressed: _handleBiometricLogin,
              icon: const Icon(Icons.fingerprint),
              label: const Text("Autenticarse con biometría"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RegisterPage())),
              child: const Text("¿No tienes cuenta? Regístrate"),
            )
          ],
        ),
      ),
    );
  }
}
