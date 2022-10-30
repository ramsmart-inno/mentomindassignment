import 'package:mentomind/model/course.dart';
import '../dao/dao.dart';

class CourseRepository {
  final courseDao = CourseDao();

  Future getAllCourses() => courseDao.getCourses();

  Future insertCourse(Course course) => courseDao.createCourse(course);
}
