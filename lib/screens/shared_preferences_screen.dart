import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/util/shared_preferences_keys.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesScreen> createState() =>
      _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  int _sharedPreferencesCounter = 0;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadSharedPreferencesCounter();
  }

  void _loadSharedPreferencesCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _sharedPreferencesCounter =
          (sharedPreferences.getInt(SharedPrefKeys.counter) ?? 0);
    });
  }

  void _incrementSharedPreferencesCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _sharedPreferencesCounter++;
      sharedPreferences.setInt(
          SharedPrefKeys.counter, _sharedPreferencesCounter);
    });
  }

  void _resetSharedPreferencesCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _sharedPreferencesCounter = 0;
      sharedPreferences.remove(SharedPrefKeys.counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Shared preferences'),
            backgroundColor: Colors.lightBlue.shade900),
        body: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  children: [
                    const Text(
                      'Shared Preferences counter',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$_sharedPreferencesCounter',
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _incrementSharedPreferencesCounter,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlue.shade900),
                      ),
                      child: const Text(
                        'Increment shared preferences counter',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _resetSharedPreferencesCounter,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade700),
                      ),
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  children: [
                    const Text(
                      'Widget state counter',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$_counter',
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => setState(() => _counter++),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlue.shade900),
                      ),
                      child: const Text('Increment widget counter'),
                    ),
                    ElevatedButton(
                      onPressed: () => setState(() => _counter = 0),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade700),
                      ),
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
