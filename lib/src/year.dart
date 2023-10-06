
class Year {
  final int year;

  Year(this.year);

  factory Year.now() {
    return Year(DateTime.now().year);
  }

  factory Year.of(int isoYear) {

    return Year(isoYear);
  }

  bool isLeap() {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

}