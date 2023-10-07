
import 'date_time_exception.dart';

enum Month {

  /// The singleton instance for the month of January with 31 days.
  /// This has the numeric value of {@code 1}.
  january,

  /// The singleton instance for the month of February with 28 days, or 29 in a leap year.
  /// This has the numeric value of {@code 2}.
  february,

  /// The singleton instance for the month of March with 31 days.
  /// This has the numeric value of {@code 3}.
  march,

  /// The singleton instance for the month of April with 30 days.
  /// This has the numeric value of {@code 4}.
  april,

  /// The singleton instance for the month of May with 31 days.
  /// This has the numeric value of {@code 5}.
  may,

  /// The singleton instance for the month of June with 30 days.
  /// This has the numeric value of {@code 6}.
  june,

  /// The singleton instance for the month of July with 31 days.
  /// This has the numeric value of {@code 7}.
  july,

  /// The singleton instance for the month of August with 31 days.
  /// This has the numeric value of {@code 8}.
  august,

  /// The singleton instance for the month of September with 30 days.
  /// This has the numeric value of {@code 9}.
  september,

  /// The singleton instance for the month of October with 31 days.
  /// This has the numeric value of {@code 10}.
  october,

  /// The singleton instance for the month of November with 30 days.
  /// This has the numeric value of {@code 11}.
  november,

  /// The singleton instance for the month of December with 31 days.
  /// This has the numeric value of {@code 12}.
  december;

  factory Month.of(int month) {
    if (month < 1 || month > 12) {
      throw DateTimeException("Invalid value for MonthOfYear: $month");
    }
    return values[month - 1];
  }

  Month plus(int months) {
    int amount = months % 12;
    return values[(index + (amount + 12)) % 12];
  }

  Month minus(int months) {
    return plus(-(months % 12));
  }

  int minLength() {
    switch (this) {
      case february:
        return 28;
      case april:
      case june:
      case september:
      case november:
        return 30;
      default:
        return 31;
    }
  }

  int maxLength() {
    switch (this) {
      case february:
        return 29;
      case april:
      case june:
      case september:
      case november:
        return 30;
      default:
        return 31;
    }
  }

  int firstDayOfYear(bool leapYear) {
    int leap = leapYear ? 1 : 0;
    switch (this) {
      case january:
        return 1;
      case february:
        return 32;
      case march:
        return 60 + leap;
      case april:
        return 91 + leap;
      case may:
        return 121 + leap;
      case june:
        return 152 + leap;
      case july:
        return 182 + leap;
      case august:
        return 213 + leap;
      case september:
        return 244 + leap;
      case october:
        return 274 + leap;
      case november:
        return 305 + leap;
      case december:
      default:
        return 335 + leap;
    }
  }

}

