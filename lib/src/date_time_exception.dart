

class DateTimeException implements Exception {
  final String message;

  DateTimeException(this.message);

  @override
  String toString() => message;
}

