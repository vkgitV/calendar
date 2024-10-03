import 'package:flutter/material.dart';

import 'event_tile.dart';

class CalendarDayWithEvent extends StatelessWidget {
  final DateTime day;
  final bool hasEvent;

  final Map<String, String>? eventDetails;

  const CalendarDayWithEvent({
    super.key,
    required this.day,

    this.hasEvent = false,
    this.eventDetails,
  });

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    bool isToday = day.day == DateTime.now().day &&
        day.month == DateTime.now().month &&
        day.year == DateTime.now().year;
    bool isCurrentMont =day.month == selectedDate.month;
    bool isSunday = day.weekday == DateTime.sunday;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
        color: isSunday?Colors.grey.shade100 : Colors.white
      ),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            right: 5,
            child: isToday
                ? Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${day.day}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                : Text(
              '${day.day}',
              style: TextStyle(
                color: isCurrentMont ? Colors.black : Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),


          if (hasEvent)
            Positioned(
              top: 35,
              right: 2,
              left: 5,
              child: EventTile(
                eventName: eventDetails?['name'] ?? '',
                eventTime: eventDetails?['time'] ?? '',
              ),
            ),
        ],
      ),
    );
  }
}
