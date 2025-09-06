import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_cis_training/core/helpers/app_colors.dart';
import 'package:men_store_cis_training/core/helpers/app_text_styles.dart';
import 'package:men_store_cis_training/features/home_nav/controller/category_cubit/category_cubit.dart';
import 'package:men_store_cis_training/features/home_nav/controller/product_cubit/product_cubit.dart';
import '../../../core/helpers/app_loading.dart';
part '../parts/all_categories.dart';
part '../parts/all_product_home_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
        create: (_) => ProductCubit()..getAllProducts(),),
        BlocProvider(
        create: (_) => CategoryCubit()..getCategoryProducts(),),
    ],
        child: Scaffold(
          appBar: AppBar(),
          backgroundColor: AppColors.scaffoldBackGroundColor,
          body: Column(
            children: [
              AllCategories(),
              AllProductHomePage(),
            ],
          ),
        ),

    );
  }
}
