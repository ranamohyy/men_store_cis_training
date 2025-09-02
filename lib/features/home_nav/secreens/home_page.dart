import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_cis_training/core/helpers/app_colors.dart';
import 'package:men_store_cis_training/core/helpers/app_text_styles.dart';
import 'package:men_store_cis_training/features/home_nav/controller/product_cubit/product_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit()..getProducts(),
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.scaffoldBackGroundColor,
        body: BlocBuilder<ProductCubit, ProductState>(
  builder: (context, state) {
    if(state is ProductLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is ProductSuccess){
    return GridView.builder(
          itemCount: state.model.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8, mainAxisSpacing: 6, crossAxisSpacing: 12
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child:
                  Image.network(state.model[index].image??""),),
                  Text(
                    state.model[index].title??"",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                    maxLines: 1,),
                  Text(r"$"+state.model[index].price.toString(),
                    style: AppTextStyles.kTextStyle16Grey,
                    textAlign: TextAlign.start,
                  ),

                ],
              ),);
          },
        );
    }
    else{
      return Container( );
    }
  },
),
      ),
    );
  }
}

