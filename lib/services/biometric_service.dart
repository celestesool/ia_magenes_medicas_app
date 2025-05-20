// ignore_for_file: avoid_print

import 'package:local_auth/local_auth.dart';

class BiometricService {
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> authenticateUser() async {
    try {
      // Verifica si el dispositivo soportara la  biometría
      final bool isDeviceSupported = await _auth.isDeviceSupported();
      final bool canCheckBiometrics = await _auth.canCheckBiometrics;

      if (!isDeviceSupported || !canCheckBiometrics) {
        print('El dispositivo no soporta biometría');
        return false;
      }

      // Lista de métodos disponibles: huella, rostro
      final List<BiometricType> availableBiometrics =
          await _auth.getAvailableBiometrics();

      if (availableBiometrics.isEmpty) {
        print('No hay biometría registrada en el dispositivo');
        return false;
      }

      // popup autenticar
      final didAuthenticate = await _auth.authenticate(
        localizedReason: 'Autentícate con tu huella o rostro',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );

      return didAuthenticate;
    } catch (e) {
      print('Error en la autenticación biométrica: $e');
      return false;
    }
  }
}
