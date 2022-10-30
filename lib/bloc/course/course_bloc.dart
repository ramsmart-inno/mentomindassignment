import 'dart:async';
import 'package:mentomind/model/course.dart';
import '../../repositories/course_repo.dart';

class CourseBloc {
  final CourseRepository repo = CourseRepository();

  final _courseController = StreamController<List<Course>>.broadcast();

  Stream<List<Course>> get courses => _courseController.stream;

  CourseBloc() {
    getCourses();
  }

  void getCourses() async {
    List<Course> data = await repo.getAllCourses();
    _courseController.sink.add(data);
  }

  addCourse(Course course) async {
    await repo.insertCourse(course);
    getCourses();
  }
}
