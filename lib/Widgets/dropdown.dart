import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: DropdownButton<String>(
        value: _selectedItem,
        onChanged: (String? newValue) {
          setState(() {
            _selectedItem = newValue;
            // Perform actions based on selected item
            // For now, just print the selected item
            print(_selectedItem);
          });
        },
        items: <String>[
          'Price: High to Low',
          'Price: Low to High',
          'Category: Fruits',
          'Category: Vegetables',
          'Category: Dairy',
          'Category: Exotic Fruits',
          'Category: Exotic Vegetables',
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class MyTabbedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            'Custom Dropdown Example',
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontSize: 18),
            unselectedLabelStyle: TextStyle(fontSize: 18),
            padding: EdgeInsets.all(2),
            tabs: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Single selection',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Multi selection'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const DropDown(), // Include your DropDown widget here
                const SizedBox(height: 16),
                // Add other widgets as needed
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // Add widgets for multi-selection tab if needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
