

import 'date_time_exception.dart';

class LocalTime {
  LocalTime._(this.hour, this.minute, this.second, this.nano);

  /// The hour.
  final int hour;
  /// The minute.
  final int minute;
  /// The second.
  final int second;
  /// The nanosecond.
  final int nano;

  factory LocalTime.now() {
    final now = DateTime.now();
    return LocalTime._(now.hour, now.minute, now.second, now.millisecond * 1000000);
  }

  factory LocalTime.of(int hour, int minute, {int second = 0, int nano = 0}) {
    if (hour < 0 || hour > 23) {
      throw DateTimeException("Invalid value for HourOfDay field, value $hour is not valid");
    }
    if (minute < 0 || minute > 59) {
      throw DateTimeException("Invalid value for MinuteOfHour field, value $minute is not valid");
    }
    if (second < 0 || second > 59) {
      throw DateTimeException("Invalid value for SecondOfMinute field, value $second is not valid");
    }
    if (nano < 0 || nano > 999999999) {
      throw DateTimeException("Invalid value for NanoOfSecond field, value $nano is not valid");
    }
    return LocalTime._(hour, minute, second, nano);
  }

  LocalTime copyWith({
    int? hour,
    int? minute,
    int? second,
    int? nano,
  }) {
    return LocalTime.of(
      hour ?? this.hour,
      minute ?? this.minute,
      second: second ?? this.second,
      nano: nano ?? this.nano,
    );
  }

  LocalTime withHour(int hour) {
    return copyWith(hour: hour);
  }

  LocalTime withMinute(int minute) {
    return copyWith(minute: minute);
  }

  LocalTime withSecond(int second) {
    return copyWith(second: second);
  }

  LocalTime withNano(int nano) {
    return copyWith(nano: nano);
  }

  // todo plus minus methods

  @override
  bool operator ==(Object other) => identical(this, other) || other is LocalTime && runtimeType == other.runtimeType && hour == other.hour && minute == other.minute && second == other.second && nano == other.nano;

  @override
  int get hashCode => hour.hashCode ^ minute.hashCode ^ second.hashCode ^ nano.hashCode;

  @override
  String toString() {
    return '$hour:$minute:$second.$nano';
  }

}