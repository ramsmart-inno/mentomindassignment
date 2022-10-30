import 'package:mentomind/model/category.dart';

abstract class CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryErrorState extends CategoryState {
  final String message;
  CategoryErrorState(this.message);
}

class CategoryLoadedState extends CategoryState {
  final List<Category> model;
  CategoryLoadedState(this.model);
}
