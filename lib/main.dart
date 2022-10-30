import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentomind/repositories/category_repo.dart';
import 'package:mentomind/repositories/course_repo.dart';
import 'package:mentomind/screens/list_course.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => CategoryRepo(),
      child: MaterialApp(
        title: 'Mento Mid',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CourseList(),
      ),
    );
  }
}
