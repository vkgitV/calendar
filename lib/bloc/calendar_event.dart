
abstract class CalendarEvent {
}

class AddEvent extends CalendarEvent {
  final DateTime date;
  final String eventName;
  final String eventTime;

  AddEvent(this.date, this.eventName, this.eventTime);

}