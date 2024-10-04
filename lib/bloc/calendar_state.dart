abstract class CalendarState {
  final Map<DateTime, Map<String, String>> events;

  const CalendarState({this.events = const {}});
}

class InitialCalendarState extends CalendarState {
  const InitialCalendarState() : super(events: const {});
}

class AddEventState extends CalendarState {
  AddEventState(DateTime date, String eventName, String eventTime)
      : super(events: {
    date: {
      'name': eventName,
      'time': eventTime,
    },
  });
}
