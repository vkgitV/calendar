import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utlis/calendar_utlis.dart';
import '../widgets/date_container.dart';
import '../widgets/month_year_header.dart';



class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  CustomCalendarState createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar'),),
      body: Column(
        children: [
        MonthYearHeader(
        selectedDate: selectedDate,
      ),


          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            childAspectRatio: 2,
            physics: const NeverScrollableScrollPhysics(),
            children: Util.weekdays.map((day) => Center(child: Text(day))).toList(),
          ),

          const DateContainer()
        ],
      ),
    );
  }
}
