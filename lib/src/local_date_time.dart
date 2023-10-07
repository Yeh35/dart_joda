

import 'local_date.dart';
import 'local_time.dart';

class LocalDateTime {
  LocalDateTime._(this.date, this.time);

  final LocalDate date;
  final LocalTime time;

  factory LocalDateTime.now() {
    return LocalDateTime._(LocalDate.now(), LocalTime.now());
  }

  factory LocalDateTime.of(LocalDate date, LocalTime time) {
    return LocalDateTime._(date, time);
  }

  factory LocalDateTime.ofInt(int year, int month, int dayOfMonth, int hour, int minute, {int second = 0, int nano = 0}) {
    return LocalDateTime.of(LocalDate.ofInt(year, month, dayOfMonth), LocalTime.of(hour, minute, second: second, nano: nano));
  }

  // Todo more factory constructors and more methods

  LocalDateTime copyWith({
    LocalDate? date,
    LocalTime? time,
  }) {
    return LocalDateTime.of(
      date ?? this.date,
      time ?? this.time,
    );
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is LocalDateTime && runtimeType == other.runtimeType && date == other.date && time == other.time;

  @override
  int get hashCode => date.hashCode ^ time.hashCode;

  @override
  String toString() {
    return '$date $time';
  }
}