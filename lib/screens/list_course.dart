import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentomind/bloc/course/course_bloc.dart';
import 'package:mentomind/common/constant.dart';
import 'package:mentomind/model/course.dart';
import 'package:mentomind/repositories/course_repo.dart';
import 'package:mentomind/screens/create_course.dart';
import 'package:mentomind/widgets/button.dart';
import 'package:mentomind/widgets/card.dart';

import '../repositories/category_repo.dart';

class CourseList extends StatefulWidget {
  CourseList({Key? key}) : super(key: key);

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  final CourseBloc courseBloc = CourseBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    courseBloc.getCourses();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              AppConstants().title,
              style: TextStyle(
                  color: AppColors().blue, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 24.0, horizontal: size.width * 0.1),
              child: SizedBox(
                  height: size.height / 3,
                  width: size.width,
                  child: Image.asset("assets/images/test.png")),
            ),
            Button(
              btnName: AppConstants().create,
              width: size.width * 0.8,
              onPress: () {
                print("Clicked");
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => CreateCourse())));
              },
            ),
            Divider(
              color: AppColors().blue,
              thickness: 5.0,
            ),
            Expanded(
                child: StreamBuilder<List<Course>>(
                    stream: courseBloc.courses,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data!.length);
                        if (snapshot.data!.length > 0) {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Course course = snapshot.data![index];
                                return CourseCard(
                                    courseTitle: course.courseName,
                                    courseCreated: course.createdDate);
                              });
                        } else {
                          return Center(
                            child: Text(
                              "No Test created. \n Create New Test Asap",
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                      }
                      return CircularProgressIndicator();
                    }))
          ],
        ),
      ),
    );
  }
}
