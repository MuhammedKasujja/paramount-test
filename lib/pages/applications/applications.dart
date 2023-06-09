import 'package:flutter/material.dart';
import 'package:paramount_test/models/models.dart';

import 'widgets/course_list.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            tabs: const [
              Tab(text: "Pending"),
              Tab(text: "Submitted"),
              Tab(text: "Approved"),
              Tab(text: "Rejected"),
            ],
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            padding: const EdgeInsets.only(bottom: 10),
          ),
          title: const Text('Applications'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            CourseList(courseType: CourseState.pending),
            CourseList(courseType: CourseState.submitted),
            CourseList(courseType: CourseState.approved),
            CourseList(courseType: CourseState.rejected),
          ],
        ),
      ),
    );
  }
}
