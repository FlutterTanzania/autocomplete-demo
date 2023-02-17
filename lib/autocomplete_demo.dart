import 'package:flutter/material.dart';
import 'countries.dart';

class AutocompleteDemo extends StatefulWidget {
  const AutocompleteDemo({super.key});

  @override
  _AutocompleteDemoState createState() => _AutocompleteDemoState();
}

class _AutocompleteDemoState extends State<AutocompleteDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autocomplete Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return countries.where((country) => country
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()));
            },
            onSelected: (String selection) {
              print('You selected $selection');
            },
          ),
        ),
      ),
    );
  }
}
