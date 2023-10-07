import 'package:dart_joda/src/year_month.dart';

import 'month.dart';
import 'month_day.dart';
import 'year.dart';

class LocalDate {
  LocalDate._(this.yearInt, this.monthInt, this.dayInt);

  final int yearInt;
  final int monthInt;
  final int dayInt;

  Year year() => Year.of(yearInt);

  Month month() => Month.of(monthInt);

  YearMonth yearMonth() => YearMonth.ofInt(yearInt, monthInt);

  MonthDay monthDay() => MonthDay.ofInt(monthInt, dayInt);

  factory LocalDate.now() {
    final now = DateTime.now();
    return LocalDate._(now.year, now.month, now.day);
  }

  factory LocalDate.of(Year year, Month month, int dayOfMonth) {
    return LocalDate._(year.year, month.index + 1, dayOfMonth);
  }

  factory LocalDate.ofInt(int year, int month, int dayOfMonth) {
    return LocalDate.of(Year.of(year), Month.of(month), dayOfMonth);
  }

  LocalDate withYear(Year year) {
    return LocalDate.of(year, month(), dayInt);
  }

  LocalDate withMonth(Month month) {
    return LocalDate.of(year(), month, dayInt);
  }

  LocalDate withDayOfMonth(int dayOfMonth) {
    return LocalDate.of(year(), month(), dayOfMonth);
  }

  LocalDate plus(YearMonth other) {
    return LocalDate.ofInt(yearInt + other.yearInt, monthInt + other.monthInt, dayInt);
  }

  LocalDate plusYears(int years) {
    return LocalDate.ofInt(yearInt + years, monthInt, dayInt);
  }

  LocalDate plusMonths(int months) {
    return LocalDate.ofInt(yearInt, monthInt + months, dayInt);
  }

  LocalDate plusDays(int days) {
    return LocalDate.ofInt(yearInt, monthInt, dayInt + days);
  }

  LocalDate minus(YearMonth other) {
    return LocalDate.ofInt(yearInt - other.yearInt, monthInt - other.monthInt, dayInt);
  }

  LocalDate minusYears(int years) {
    return LocalDate.ofInt(yearInt - years, monthInt, dayInt);
  }

  LocalDate minusMonths(int months) {
    return LocalDate.ofInt(yearInt, monthInt - months, dayInt);
  }

  LocalDate minusDays(int days) {
    return LocalDate.ofInt(yearInt, monthInt, dayInt - days);
  }

  int compareTo(LocalDate other) {
    if (yearInt == other.yearInt) {
      if (monthInt == other.monthInt) {
        return dayInt.compareTo(other.dayInt);
      }
      return monthInt.compareTo(other.monthInt);
    }
    return yearInt.compareTo(other.yearInt);
  }

  bool isAfter(LocalDate other) {
    return compareTo(other) > 0;
  }

  bool isBefore(LocalDate other) {
    return compareTo(other) < 0;
  }

  DateTime toDateTime() {
    return DateTime(yearInt, monthInt, dayInt);
  }

  LocalDate copyWith({
    int? year,
    int? month,
    int? day,
  }) {
    // todo validate
    return LocalDate.ofInt(
      year ?? yearInt,
      month ?? monthInt,
      day ?? dayInt,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is LocalDate && runtimeType == other.runtimeType && yearInt == other.yearInt && monthInt == other.monthInt && dayInt == other.dayInt;

  @override
  int get hashCode => yearInt.hashCode ^ monthInt.hashCode ^ dayInt.hashCode;

  @override
  String toString() {
    return '$yearInt-$monthInt-$dayInt';
  }
}
