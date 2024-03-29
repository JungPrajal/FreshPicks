import 'package:flutter/material.dart';
import 'package:keyboard/Pages/search.dart';
import '../Widgets/BestSelling.dart';
import '../Widgets/Carousel.dart';
import '../Widgets/Exotic.dart';
import '../Widgets/Navbar.dart';
import '../Widgets/ProductWidget.dart';
import '../Pages/Drawer.dart';
import '../Widgets/dropdown.dart'; // Import the Drawer page
// Import the GrocerySearchDelegate file

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // Use AppBarWidget as the appBar
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                // Search bar
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      final selected = await showSearch(
                        context: context,
                        delegate: GrocerySearchDelegate(),
                      );
                      // Handle the selected item here if needed
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ), // Add some space between icon and text field
                            Expanded(
                              child: Text(
                                "Search Your Groceries",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Show the filter dropdown dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: DropDown(),
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.filter_list),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Carousel Widget
                MySlider(),
                // Exotic Items
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Exotic Items",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                ExoticItemWidget(),
                // Best Selling
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                BestSelling(),
                // Our Products
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Discount Price",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                ProductItemWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(),
      drawer: Drawer(
        // Specify the Drawer widget directly in the Scaffold's drawer property
        child: CustomDrawer(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
