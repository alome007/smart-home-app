import 'package:flutter/material.dart';

import '../constants.dart';

class Chips extends StatelessWidget {
  final count;
  final isActive;
  final label;
  const Chips({Key? key, this.count, this.isActive, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? KPrimaryBlue : Colors.white,
          border: !isActive ? Border.all(color: Colors.grey) : null,
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.grey[600],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.grey[500],
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        count,
                        style: TextStyle(
                            color: isActive ? KPrimaryBlue : Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
