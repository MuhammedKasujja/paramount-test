import "package:flutter/material.dart";
import "package:paramount_test/models/models.dart" show CourseState;

class ActionButton extends StatelessWidget {
  final CourseState courseState;
  const ActionButton({super.key, required this.courseState});

  @override
  Widget build(BuildContext context) {
    return courseState == CourseState.rejected
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 25),
            child: SizedBox(
              width: double.infinity,
              height: 51,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => {},
                child: Text.rich(
                  TextSpan(
                    text: courseState == CourseState.pending
                        ? 'Resume'
                        : courseState == CourseState.submitted
                            ? 'Edit'
                            : "View",
                    children: const [TextSpan(text: " Application")],
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
  }
}
