class Institute {
  final String name;
  final String city;
  final String country;
  final String icon;
  final String backgroundImage;

  Institute({
    required this.name,
    required this.city,
    required this.country,
    required this.icon,
    required this.backgroundImage,
  });
}

enum CourseState {
  pending,
  submitted,
  approved,
  rejected,
}

class Course {
  final String name;
  final CourseState state;
  final String duration;
  final String costPerYearOld;
  final String costPerYear;
  final int ects;
  final double? scholarshipPecentage;
  final String studyLocation;

  Course({
    required this.name,
    required this.state,
    required this.costPerYearOld,
    required this.costPerYear,
    required this.duration,
    required this.ects,
    this.scholarshipPecentage,
     required this.studyLocation,
  });
}

class InstituteCourse {
  final Institute institute;
  final Course course;

  InstituteCourse({required this.institute, required this.course});
}
