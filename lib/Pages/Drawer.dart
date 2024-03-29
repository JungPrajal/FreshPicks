import 'package:flutter/material.dart';
import 'package:keyboard/Login/LOgin.dart';
import 'package:keyboard/checkout/final_order.dart';

import 'package:keyboard/drawerwidget/details.dart';
import 'package:keyboard/drawerwidget/location.dart';
import 'package:keyboard/drawerwidget/orders.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width * 0.6, // Adjust the width as needed
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Prajal Jung Kunwar"),
              accountEmail: Text("prajaljungkunwar@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset("assets/pjk.png"),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/green.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Details"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyDetails()),
                );
                print("My Details");
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Delivery Address"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddressWidget()),
                );
                print("My Location");
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Payment Method"),
              onTap: () => print("Payment"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text("Promo Code"),
              onTap: () => print("Promo code"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              leading: ImageIcon(
                AssetImage("assets/order.png"),
              ),
              title: Text("My Orders"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Orders()));
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              onTap: () => print("Help"),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Logout"),
                        content: Text("Are you sure you want to logout?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage())); // Navigate to login page
                            },
                            child: Text("Logout"),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  padding: EdgeInsets.only(left: 100, right: 100),
                  textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
