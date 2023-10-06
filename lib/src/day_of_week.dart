
/// An enum representing the days of the week.
enum DayOfWeek {
  monday(ordinal: 0, name: "Monday"),
  tuesday(ordinal: 1, name: "Tuesday"),
  wednesday(ordinal: 2, name: "Wednesday"),
  thursday(ordinal: 3, name: "Thursday"),
  friday(ordinal: 4, name: "Friday"),
  saturday(ordinal: 5, name: "Saturday"),
  sunday(ordinal: 6, name: "Sunday");

  const DayOfWeek({
    required this.ordinal,
    required this.name,
  });

  final int ordinal;
  final String name;
}

