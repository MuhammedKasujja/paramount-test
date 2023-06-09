import 'package:flutter/material.dart';
import 'package:paramount_test/models/models.dart';

import 'action_button.dart';

class CourseCard extends StatelessWidget {
  final InstituteCourse instituteCourse;
  const CourseCard({super.key, required this.instituteCourse});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Container(
                        width: 134,
                        height: 174,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              instituteCourse.institute.backgroundImage,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        // child: BackdropFilter(
                        //   filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 9),
                          color: const Color.fromARGB(100, 22, 44, 33),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  "${instituteCourse.course.scholarshipPecentage ?? 'No'}",
                              children: [
                                TextSpan(
                                    text: instituteCourse
                                                .course.scholarshipPecentage !=
                                            null
                                        ? '%'
                                        : ''),
                                const TextSpan(text: ' Scholarship')
                              ],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // decoration: BoxDecoration(
                        //   gradient: LinearGradient(
                        //     colors: [
                        //       Colors.white.withOpacity(0.9),
                        //       Colors.white.withOpacity(0.9),
                        //     ],
                        //     begin: AlignmentDirectional.topStart,
                        //     end: AlignmentDirectional.bottomEnd,
                        //   ),
                        //   borderRadius: BorderRadius.all(Radius.circular(10)),
                        //   border: Border.all(
                        //     width: 1.5,
                        //     color: Colors.white.withOpacity(0.2),
                        //   ),
                        // ),
                        // child: Text('10'),
                        // ),
                        // ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  instituteCourse.institute.icon,
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      instituteCourse.institute.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "${instituteCourse.institute.city},${instituteCourse.institute.country}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            (instituteCourse.course.state ==
                                        CourseState.pending ||
                                    instituteCourse.course.state ==
                                        CourseState.submitted)
                                ? InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.delete,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          instituteCourse.course.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.4),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                instituteCourse.course.studyLocation,
                                style: const TextStyle(fontSize: 8),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.4),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                "${instituteCourse.course.duration} (${instituteCourse.course.ects} ETCS)",
                                style: const TextStyle(fontSize: 8),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$${instituteCourse.course.costPerYearOld} / Year",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "\$${instituteCourse.course.costPerYear} / Year",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.transparent,
                                    shadows: const [
                                      Shadow(
                                          color: Colors.black,
                                          offset: Offset(0, -10))
                                    ],
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        Theme.of(context).primaryColorLight,
                                    decorationThickness: 3,
                                  ),
                                ),
                              ],
                            ),
                            instituteCourse.course.state == CourseState.rejected
                                ? const SizedBox.shrink()
                                : Row(
                                    children: [
                                      const Text(
                                        "On",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 4.0),
                                        width: 6.0,
                                        height: 6.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0Xff39B549),
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    ],
                                  )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            instituteCourse.course.state == CourseState.rejected
                ? const SizedBox.shrink()
                : ActionButton(courseState: instituteCourse.course.state),
          ],
        ),
      ),
    );
  }
}
