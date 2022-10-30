class Course {
  int? id;
  String courseName;
  String courseCategories;
  String createdDate;
  Course(
      {this.id,
      required this.courseName,
      required this.courseCategories,
      required this.createdDate});
  factory Course.fromDatabaseJson(Map<String, dynamic> data) => Course(
      id: data['id'],
      courseName: data['courseName'],
      courseCategories: data['courseCategories'],
      createdDate: data['createdDate']);
  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "courseName": this.courseName,
        "courseCategories": this.courseCategories,
        "createdDate": this.createdDate
      };
}
