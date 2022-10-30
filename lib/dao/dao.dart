import 'dart:async';

import 'package:mentomind/common/constant.dart';

import '../database/database.dart';
import '../model/course.dart';

class CourseDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Todo records
  Future<int> createCourse(Course course) async {
    final db = await dbProvider.database;
    var result = db.insert(DbConstants().tableName, course.toDatabaseJson());
    return result;
  }

  //Get All Todo items
  //Searches if query string was passed
  Future<List<Course>> getCourses() async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;

    result = await db.query(DbConstants().tableName);

    List<Course> courses = result.isNotEmpty
        ? result.map((item) => Course.fromDatabaseJson(item)).toList()
        : [];
    return courses;
  }
}
