import 'dart:io';
import 'package:flutter/material.dart';
import 'package:great_place/providers/great_places/great_places.dart';
import 'package:great_place/widget/image_input/image_input.dart';
import 'package:provider/provider.dart';

class PlaceFormPage extends StatefulWidget {
  const PlaceFormPage({Key? key}) : super(key: key);

  @override
  State<PlaceFormPage> createState() => _PlaceFormPageState();
}

class _PlaceFormPageState extends State<PlaceFormPage> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectedImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Lugar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 1.3,
                          color: Colors.grey,
                        ),
                      ),
                      child: TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ImageInput(_selectedImage),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ),
            child: ElevatedButton.icon(
              onPressed: _submitForm,
              icon: const Icon(Icons.add),
              label: const Text('Adicionar'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
