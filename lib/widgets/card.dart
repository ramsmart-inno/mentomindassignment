import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:mentomind/common/constant.dart';

class CourseCard extends StatelessWidget {
  const CourseCard(
      {super.key, required this.courseTitle, required this.courseCreated});
  final String courseTitle;
  final String courseCreated;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 48),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: AppColors().blue,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    courseTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Spacer()
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    '${AppConstants().createdOn}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' ${DateFormat('MMM d, yyyy h:mm a').format(DateTime.now())}',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
