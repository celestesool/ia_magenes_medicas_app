import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  File? _image;

  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // Aquí luego se podria enviar la imagen al backend o procesarla localmente con IA
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Skin IA - Panel Principal")),
      body: Center(
        child: _image == null
            ? const Text("Toca el botón para escanear una imagen")
            : Image.file(_image!, width: 250),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _pickImageFromCamera,
        label: const Text("Escanear piel"),
        icon: const Icon(Icons.camera_alt),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
