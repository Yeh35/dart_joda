
import 'package:dart_joda/src/year.dart';

import 'month.dart';

class YearMonth {
  final int yearInt;
  final int monthInt;

  Year year() => Year.of(yearInt);
  Month month() => Month.of(monthInt);

  YearMonth._(this.yearInt, this.monthInt);


  factory YearMonth.now() {
    final now = DateTime.now();
    return YearMonth._(now.year, now.month);
  }

  factory YearMonth.of(Year year, Month month) {
    return YearMonth._(year.year, month.index + 1);
  }

  factory YearMonth.ofInt(int year, int month) {
    return YearMonth.of(Year.of(year), Month.of(month));
  }

  YearMonth withYear(Year year) {
    return YearMonth.of(year, Month.of(monthInt));
  }

  YearMonth withMonth(Month month) {
    return YearMonth.of(Year.of(yearInt), month);
  }

  YearMonth plus(YearMonth other) {
    return YearMonth.ofInt(yearInt + other.yearInt, monthInt + other.monthInt);
  }

  YearMonth plusYears(int years) {
    return YearMonth.ofInt(yearInt + years, monthInt);
  }

  YearMonth plusMonths(int months) {
    return YearMonth.ofInt(yearInt, monthInt + months);
  }

  YearMonth minus(YearMonth other) {
    return YearMonth.ofInt(yearInt - other.yearInt, monthInt - other.monthInt);
  }

  YearMonth minusYears(int years) {
    return YearMonth.ofInt(yearInt - years, monthInt);
  }

  YearMonth minusMonths(int months) {
    return YearMonth.ofInt(yearInt, monthInt - months);
  }

  int compareTo(YearMonth other) {
    if (yearInt == other.yearInt) {
      return monthInt.compareTo(other.monthInt);
    }
    return yearInt.compareTo(other.yearInt);
  }

  bool isAfter(YearMonth other) {
    return compareTo(other) > 0;
  }

  bool isBefore(YearMonth other) {
    return compareTo(other) < 0;
  }

  @override
  String toString() {
    return '$yearInt-$monthInt';
  }

  YearMonth copyWith({
    int? year,
    int? month,
  }) {
    return YearMonth.ofInt(
      year ?? yearInt,
      month ?? monthInt,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is YearMonth && runtimeType == other.runtimeType && yearInt == other.yearInt && monthInt == other.monthInt;

  @override
  int get hashCode => yearInt.hashCode ^ monthInt.hashCode;
}