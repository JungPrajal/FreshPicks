import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'product_details.dart'; // Import ProductDetails page

class GrocerySearchDelegate extends SearchDelegate<String> {
  final List<Map<String, dynamic>> groceryList = [
    {
      'name': 'Apples',
      'image': 'assets/apple.png',
      'description': 'Sweet and juicy apples',
      'nutrition': '100',
      'price': 5,
    },
    {
      'name': 'Avocado',
      'image': 'assets/avacado.png',
      'description': 'Healthy and creamy avocado',
      'nutrition': '150',
      'price': 8,
    },
    {
      'name': 'Cherry',
      'image': 'assets/cherry.png',
      'description': 'Fresh and delicious cherries',
      'nutrition': '120',
      'price': 6,
    },
    {
      'name': 'Lotus',
      'image': 'assets/lotus.png',
      'description': 'Exotic lotus fruit',
      'nutrition': '200',
      'price': 10,
    },
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      GestureDetector(
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.filter_list),
        ),
      ),
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search results for "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Map<String, dynamic>> suggestionList = query.isEmpty
        ? []
        : groceryList
            .where((item) =>
                item['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(suggestionList[index]['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description: ${suggestionList[index]['description']}'),
                Text('Nutrition: ${suggestionList[index]['nutrition']}'),
                Text('Price: Rs ${suggestionList[index]['price']}'),
              ],
            ),
            leading: Image.asset(
              suggestionList[index]['image'],
              width: 50,
              height: 50,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    name: suggestionList[index]['name'],
                    image: suggestionList[index]['image'],
                    price: suggestionList[index]['price'],
                    description: suggestionList[index]['description'],
                    nutrition: suggestionList[index]['nutrition'],
                    isFavorite: false,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
