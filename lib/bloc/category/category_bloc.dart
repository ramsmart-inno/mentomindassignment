import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mentomind/model/category.dart';
import 'package:mentomind/repositories/category_repo.dart';

import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo repo;

  CategoryBloc(this.repo) : super(CategoryLoadingState()) {
    on<LoadCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        List<Category>? model = await repo.getCategories();
        emit(CategoryLoadedState(model));
      } catch (e) {
        emit(CategoryErrorState(e.toString()));
      }
    });
  }
}
