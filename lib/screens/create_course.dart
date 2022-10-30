import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentomind/bloc/course/course_bloc.dart';
import 'package:mentomind/common/constant.dart';
import 'package:mentomind/model/category.dart';
import 'package:mentomind/model/course.dart';
import 'package:mentomind/repositories/category_repo.dart';
import 'package:mentomind/repositories/course_repo.dart';
import 'package:mentomind/screens/list_course.dart';
import 'package:mentomind/widgets/button.dart';

import '../bloc/category/category_bloc.dart';
import '../bloc/category/category_event.dart';
import '../bloc/category/category_state.dart';

class CreateCourse extends StatefulWidget {
  CreateCourse({Key? key}) : super(key: key);

  @override
  State<CreateCourse> createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  final CourseBloc courseBloc = CourseBloc();
  TextEditingController courseNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.16,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: AppColors().blue),
          title: Text(
            AppConstants().create,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocProvider<CategoryBloc>(
          create: (context) =>
              CategoryBloc(RepositoryProvider.of<CategoryRepo>(context))
                ..add(LoadCategoryEvent()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: courseNameController,
                  onSubmitted: (value) {},
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(width: 1, color: AppColors().blue),
                    ),
                    prefixIcon:
                        Icon(Icons.menu_book_rounded, color: AppColors().blue),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors().blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    hintText: ' Test Name',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    AppConstants().topics,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppColors().blue),
                  ),
                ),
                BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                  if (state is CategoryErrorState) {
                    return Text(state.message);
                  } else if (state is CategoryLoadedState) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.model.length,
                          itemBuilder: (context, index) {
                            return Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                  maintainState: false,
                                  leading: Checkbox(
                                    value: state.model[index].selected,
                                    onChanged: (v) {
                                      print(v);
                                      state.model[index].selected = v!;
                                      setState(() {});
                                    },
                                    // focusColor: AppColors().blue,
                                    side: BorderSide(
                                        color: AppColors().blue, width: 2),
                                  ),
                                  title: Text(
                                    state.model[index].topicName.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  children: List.generate(
                                      state.model[index].concepts.length,
                                      (e) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 32.0),
                                            child: ListTile(
                                              leading: Checkbox(
                                                value: state.model[index]
                                                    .concepts[e].selected,
                                                onChanged: (v) {
                                                  print(v);
                                                  state.model[index].concepts[e]
                                                      .selected = v!;

                                                  setState(() {});
                                                },
                                                side: BorderSide(
                                                    color: AppColors().blue,
                                                    width: 2),
                                              ),
                                              title: Text(
                                                state.model[index].concepts[e]
                                                    .conceptName,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )).toList()),
                            );
                          }),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                }),
                Button(
                    btnName: AppConstants().createBtn,
                    width: size.width,
                    onPress: () async {
                      print(courseNameController.text);
                      if (courseNameController.text.isEmpty) {
                        return ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Test Name must be filled. Enter Test Name.")));
                      }
                      await courseBloc.addCourse(Course(
                          courseName: courseNameController.text,
                          courseCategories: "Selected Modules",
                          createdDate: DateTime.now().toString()));

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => CourseList()),
                          (route) => false);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
