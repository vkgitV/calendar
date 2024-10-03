
class Util {
  static List<DateTime> daysInMonth(DateTime date) {
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    DateTime lastDayOfMonth = DateTime(date.year, date.month + 1, 0);


    List<DateTime> days = [];


    for (int i = 1; i < 2; i++) {
      days.add(DateTime(firstDayOfMonth.year, firstDayOfMonth.month, 1 - 2));
      days.add(DateTime(firstDayOfMonth.year, firstDayOfMonth.month, 1 - 1));
    }


    for (int i = 0; i < lastDayOfMonth.day; i++) {
      days.add(DateTime(firstDayOfMonth.year, firstDayOfMonth.month, i + 1));
    }
    for (int i = 1; i <= 2; i++) {
      days.add(DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, i)); // First two days of next month
    }

    return days;
  }

  static const List<String> weekdays = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",

  ];

}