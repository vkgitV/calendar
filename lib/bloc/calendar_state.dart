class CalendarState  {
  final Map<DateTime, Map<String, String>> events;
  const CalendarState({this.events = const {}});
  addEvent(DateTime date, String eventName, String eventTime)  {
    final newEvents = Map<DateTime, Map<String, String>>.from(events);
    newEvents[date] = {
      'name': eventName,
      'time': eventTime,
    };
    return CalendarState(events: newEvents);
  }
}