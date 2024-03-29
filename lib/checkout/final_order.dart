import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomTimelineTile(
            isFirst: true,
            isLast: false,
            isPast: true,
            children: [
              Text("Order Placed"),
            ],
          ),
          CustomTimelineTile(
            isFirst: false,
            isLast: false,
            isPast: true,
            children: [
              Text("Shipping"),
            ],
          ),
          CustomTimelineTile(
            isFirst: false,
            isLast: true,
            isPast: false,
            children: [
              Text("Order Delivered"),
              SizedBox(height: 8.0),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final List<Widget> children;

  const CustomTimelineTile({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast ? Colors.green : Colors.green.shade100,
        ),
        indicatorStyle: IndicatorStyle(
          width: 20,
          color: isPast ? Colors.green : Colors.green.shade100,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.white : Colors.green.shade100,
          ),
        ),
        endChild: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
