import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final String eventName;
  final String eventTime;

  const EventTile({
    super.key,
    required this.eventName,
    required this.eventTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.fiber_manual_record,
            color: Colors.white,
            size: 4.0,
          ),
          Expanded(
            child: Text(
              eventName,
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
          Text(
            eventTime,
            style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
