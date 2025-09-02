import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_cis_training/core/networking/dio_helper.dart';
import 'package:men_store_cis_training/core/networking/end_points.dart';
import 'package:men_store_cis_training/models/product_model.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  getProducts() async {
    try {
      emit(ProductLoading());
      final Response response =
          await DioHelper.getRequest(endPoint: AppEndPoints.allProducts);
      if (response.statusCode == 200) {

        final list = List<ProductModel>.from(
            (response.data as List).map((e) => ProductModel.fromJson(e)));
        emit(ProductSuccess(list));
      }
    } on DioException {
      emit(ProductFailure());
    } catch (e) {
      emit(ProductFailure());
    }
  }
}
