import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_cis_training/core/networking/app_end_points.dart';
import 'package:men_store_cis_training/core/networking/dio_helper.dart';
import 'package:men_store_cis_training/models/cart_model.dart';
import 'package:men_store_cis_training/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  getUserCart(id) async {
    try {
      emit(CartLoading());
      final Response response = await DioHelper.getRequest(
          endPoint: "${AppEndPoints.getUserCart}$id");

      if (response.statusCode == 200) {
        final list = List<CartModel>.from(
            (response.data as List).map((e) => CartModel.fromJson(e)));
        emit(CartSuccess(list));
      } else {
        emit(CartFailure(response.data.toString()));
      }
    } on DioException catch (e) {
      log("==========${e.toString()}");
      emit(CartFailure(e.toString()));
    } catch (e) {
      log("==========${e.toString()}");
      emit(CartFailure(e.toString()));
    }
  }

  addToCart() async {
    try {
      emit(AddToCartLoading());
      final Response response = await DioHelper.postRequest(
        endPoint: AppEndPoints.addToCart,
      );
      if (response.statusCode == 201) {
        emit(AddToCartSuccess());
      } else {
        emit(AddToCartFailure("Can not add to cart"));
      }
    } on DioException catch (e) {
      emit(AddToCartFailure(e.response?.data ?? e.toString()));
    } catch (e) {
      emit(AddToCartFailure(e.toString()));
    }
  }
}
