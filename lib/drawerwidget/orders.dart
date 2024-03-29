import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../checkout/final_order.dart'; // Assuming Order class is defined here
// Importing OrderTimeline widget

enum Action { delete }

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order> orders = allOrders; // Assuming allOrders is defined somewhere

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your orders'),
      ),
      body: Container(
        // Wrap SingleChildScrollView with Container
        height: MediaQuery.of(context).size.height *
            0.8, // Example height, adjust as needed
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return GestureDetector(
                    onTap: () => _showOrderDetails(context, order),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: StretchMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: "Delete",
                            onPressed: (context) =>
                                _onDismissed(index, Action.delete),
                          ),
                        ],
                      ),
                      child: buildOrderListTile(order),
                    ),
                  );
                },
              ),
              Divider(thickness: 1),
              SizedBox(
                height: 20,
              ),
              OrderTimeline(),
              Divider(
                thickness: 2,
              ),
              // Add section for displaying total price and purchase date
            ],
          ),
        ),
      ),
    );
  }

  void _onDismissed(int index, Action action) {
    setState(() {
      if (action == Action.delete) {
        orders.removeAt(index);
      }
    });
  }

  Widget buildOrderListTile(Order order) => ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(order.name),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(order.imageAsset),
        ),
      );

  void _showOrderDetails(BuildContext context, Order order) {
    String deliveryTime;
    double price;
    String location = ''; // Initialize location to an empty string

    switch (order.name) {
      case 'Order 1':
        deliveryTime = '2 days';
        price = 10.99;
        location = 'Pokhara';
        break;
      case 'Order 2':
        deliveryTime = '3 days';
        price = 15.49;
        location = 'Butwal';
        break;
      case 'Order 3':
        deliveryTime = '1 day';
        price = 8.99;
        location = 'Kathmandu';
        break;
      default:
        deliveryTime = 'Unknown';
        price = 0.0;
        break;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(order.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price: Rs ${price.toStringAsFixed(2)}'),
              SizedBox(height: 10),
              Text('Delivery Time: $deliveryTime'),
              SizedBox(height: 10),
              Text("Location: $location"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class Order {
  final String name;
  final String imageAsset;
  final double price; // Add price field to Order class

  Order(this.name, this.imageAsset, this.price);
}

final List<Order> allOrders = [
  Order('Order 1', "assets/5.png", 10.99),
  Order('Order 2', "assets/7.png", 15.49),
  Order('Order 3', "assets/apple.png", 8.99),
];
