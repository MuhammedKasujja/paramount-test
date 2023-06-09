import 'package:flutter/material.dart';
import 'package:paramount_test/models/models.dart';

import 'course_card.dart';

class CourseList extends StatefulWidget {
  final CourseState courseType;
  const CourseList({super.key, required this.courseType});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  // @override
  // void initState() {
  //   // TODO: fecth data based on the selected course Tab state [CourseState] from the API
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //
    // simulating single item data from the API
    //
    final InstituteCourse instituteCourse = InstituteCourse(
      institute: Institute(
          name: "University Of Alberta",
          city: "Toronto",
          country: "Canada",
          icon:
              "https://i1.rgstatic.net/ii/institution.image/AS%3A411548435664900%401475132201614_l",
          backgroundImage:
              "https://neoslibraries.ca/wp-content/uploads/2/files/sites/2/2023/02/2021-report-teaser.jpg"),
      course: Course(
          name: "Bachelor of Science in Civil and Environmental Engineering",
          state: widget.courseType,
          costPerYearOld: "23,732",
          costPerYear: "19,832",
          duration: "4 Years",
          ects: 240,
          studyLocation: 'On Campus',
          scholarshipPecentage: 10),
    );

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return CourseCard(instituteCourse: instituteCourse);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
