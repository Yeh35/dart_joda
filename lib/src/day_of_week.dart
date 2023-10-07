
import 'date_time_exception.dart';

/// An enum representing the days of the week.
enum DayOfWeek {

  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  factory DayOfWeek.of(int dayOfWeek) {
    if (dayOfWeek < 1 || dayOfWeek > 7) {
      throw DateTimeException("Invalid value for DayOfWeek: $dayOfWeek");
    }
    return values[dayOfWeek - 1];
  }

  DayOfWeek plus(int days) {
    int amount = days % 7;
    return values[(index + (amount + 7)) % 7];
  }

  DayOfWeek minus(int days) {
    return plus(-(days % 7));
  }

}

