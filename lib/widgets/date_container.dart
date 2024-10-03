import 'package:flutter/material.dart';

import '../utlis/calendar_utlis.dart';
import 'add_event.dart';


class DateContainer extends StatefulWidget {
  const DateContainer({super.key,required this.selectedDate});
  final DateTime selectedDate ;


  @override
  State<DateContainer> createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    List<DateTime> daysInMonth = Util.daysInMonth(selectedDate);
    return Expanded(
      child:
           GridView.builder(
            itemCount: daysInMonth.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              DateTime day =  daysInMonth[index];
              return AdEvent(day:day );
            },
          ),
    );
  }
}

