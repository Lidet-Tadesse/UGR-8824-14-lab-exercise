import 'package:flutter/material.dart';
import 'main.dart';
import 'Lists.dart';
import 'courselist.dart';
import 'coursedetail.dart';

class CourseApp extends StatefulWidget {
  @override
  State<CourseApp> createState() => _CourseAppState();
}

class _CourseAppState extends State<CourseApp> {
  Course? _selectedCourse;

  List<Course> courses = [
    Course(
      code: "SiTE-001",
      title: "Introduction To Programming",
      description: "Computer Organization, Architecture, Programming"),
    
    Course(
      code: "SiTE-002",
      title: "Mobile App",
      description: "Computer Organization, Architecture, Programming"),

];

  

void _tabHandler(Course course) {
  setState( () {
    _selectedCourse = course;
  });
}
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('CourseListScreen'),
            child: CoursesListScreen(
              courses: courses,
              onTapped: _tabHandler,
            ),
          ),
            if (_selectedCourse != null)
              MaterialPage(
                  key: ValueKey(_selectedCourse),
                  child: CoursesDetailScreen(course: _selectedCourse!,))

       ],
     ),
   );
 }
}