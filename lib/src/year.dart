
import 'month_day.dart';

class Year {
  final int year;

  static bool isLeapInt(int year) => year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

  Year._(this.year);

  factory Year.now() {
    return Year._(DateTime.now().year);
  }

  factory Year.of(int isoYear) {
    return Year._(isoYear);
  }

  bool isLeap() => Year.isLeapInt(year);
  bool isValidMonthDay(MonthDay monthDay) => monthDay.isValidYear(year);
  int length() => isLeap() ? 366 : 365;

  Year plus(int years) {
    return Year.of(year + years);
  }

  Year minus(int years) {
    return Year.of(year - years);
  }

  bool isAfter(Year other) {
    return year > other.year;
  }

  bool isBefore(Year other) {
    return year < other.year;
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is Year && runtimeType == other.runtimeType && year == other.year;

  @override
  int get hashCode => year.hashCode;
}