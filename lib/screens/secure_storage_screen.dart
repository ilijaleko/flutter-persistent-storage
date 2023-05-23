import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/util/secure_storage_keys.dart';

class SecureStorageScreen extends StatefulWidget {
  const SecureStorageScreen({Key? key}) : super(key: key);

  @override
  State<SecureStorageScreen> createState() => _SecureStorageScreenState();
}

class _SecureStorageScreenState extends State<SecureStorageScreen> {
  final storage = const FlutterSecureStorage();
  final TextEditingController _textEditingController = TextEditingController();
  String? storedValue;

  @override
  void initState() {
    super.initState();
    _loadStoredValue();
  }

  Future<void> _loadStoredValue() async {
    storedValue = await storage.read(key: SecureStorageKeys.securedValue);
    setState(() {});
  }

  Future<void> _saveValue() async {
    final value = _textEditingController.text;
    await storage.write(key: SecureStorageKeys.securedValue, value: value);
    _loadStoredValue();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Secure storage'),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Enter a value',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveValue,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade900),
                ),
                child: const Text('Save'),
              ),
              const SizedBox(height: 200.0),
              Column(
                children: [
                  const Text(
                    'Stored stored value: ',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Text(
                    storedValue ?? '',
                    style: const TextStyle(fontSize: 40.0),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
