import 'package:flutter_bloc/flutter_bloc.dart';

import 'calendar_event.dart';
import 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(const CalendarState()) {
    on<AddEvent>((event, emit) {

      emit(state.addEvent(event.date, event.eventName, event.eventTime));
    });
  }
}
