

import 'date_time_exception.dart';
import 'month.dart';
import 'year.dart';

class MonthDay {
  final int month;
  final int day;

  MonthDay._(this.month, this.day);

  factory MonthDay.now() {
    final now = DateTime.now();
    return MonthDay._(now.month, now.day);
  }

  factory MonthDay.of(Month month, int dayOfMonth) {
    if (dayOfMonth > month.maxLength()) {
      throw DateTimeException("Illegal value for DayOfMonth field, value $dayOfMonth is not valid for month ${month.name}");
    }
    return MonthDay._(month.index + 1, dayOfMonth);
  }

  factory MonthDay.ofInt(int month, int dayOfMonth) {
    return MonthDay.of(Month.of(month), dayOfMonth);
  }

  MonthDay withMonth(Month month) {
    return MonthDay.of(month, day);
  }

  MonthDay withDayOfMonth(int dayOfMonth) {
    return MonthDay.of(Month.of(month), dayOfMonth);
  }

  int compareTo(MonthDay other) {
    if (month == other.month) {
      return day.compareTo(other.day);
    }
    return month.compareTo(other.month);
  }

  bool isAfter(MonthDay other) {
    return compareTo(other) > 0;
  }

  bool isBefore(MonthDay other) {
    return compareTo(other) < 0;
  }

  bool isValidYear(int year) => (day == 29 && month == 2 && Year.isLeapInt(year) == false) == false;

  MonthDay copyWith({
    int? month,
    int? day,
  }) {
    return MonthDay.ofInt(
      month ?? this.month,
      day ?? this.day,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is MonthDay && runtimeType == other.runtimeType && month == other.month && day == other.day;

  @override
  int get hashCode => month.hashCode ^ day.hashCode;

  /// Example: MonthDay.of(1, 1) return 01-01
  @override
  String toString() {
    return '${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
}