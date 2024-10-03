import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calendar_bloc.dart';
import '../bloc/calendar_event.dart';
import '../bloc/calendar_state.dart';
import '../screens/event_input_page.dart';
import 'calendar_dayWith_event.dart';

class AdEvent extends StatelessWidget {
   const AdEvent({super.key,required this.day});
  final DateTime day;



  @override
  Widget build(BuildContext context) {

    return   BlocBuilder<CalendarBloc,CalendarState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventInputPage(selectedDate: day),
                ),
              );

              if (result != null) {
                context.read<CalendarBloc>().add(AddEvent(day, result['name'], result['time']));
              }
            },
            child: CalendarDayWithEvent(
              day:day,
              hasEvent: state.events.containsKey(day),
              eventDetails: state.events[day],
            ),
          );
        }
    );
  }
}

