import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final isOnline;
  const StatusIndicator({Key? key, this.isOnline}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, right: 10.0),
      width: 10.0,
      height: 8.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isOnline ? Colors.green[400] : Colors.grey),
    );
  }
}
