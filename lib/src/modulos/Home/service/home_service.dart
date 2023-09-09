import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_money/src/modulos/Home/repositories/home_repository.dart';
import 'package:my_money/src/modulos/registro_pessoas/model/registro_pessoas_model.dart';
import 'package:my_money/src/shared/model/expense_model.dart';
import 'package:my_money/src/shared/storage/app_keys.dart';
import 'package:my_money/src/shared/storage/app_secure_store.dart';

class HomeService {
  HomeRepository repository = HomeRepository();

  Future<List<ExpenseModel>> getExpenses() async {
    try {
      List<ExpenseModel> expenses = [];

      String? userId = await AppSecureStorage.readItem(Appkeys.user_id);

      Response<List<dynamic>> responseList =
          await repository.getExpenses(userId!);

      responseList.data?.forEach((response) {
        expenses.add(ExpenseModel.fromJson(response));
      });

      return expenses;
    } catch (ex) {
      debugPrint(ex.toString());
      throw Exception(ex);
    }
  }

  Future<double> getGoalValue() async {
    try {
      String? userId = await AppSecureStorage.readItem(Appkeys.user_id);

      Response<Map<String, dynamic>> response =
          await repository.getGoal(userId!);

      PersonalRegisterModel personalRegister =
          PersonalRegisterModel.fromJson(response.data!);

      AppSecureStorage.addItem(
        Appkeys.goal_value,
        personalRegister.limitValue.toString(),
      );

      return personalRegister.limitValue;
    } catch (ex) {
      debugPrint(ex.toString());
      throw Exception(ex);
    }
  }
}
