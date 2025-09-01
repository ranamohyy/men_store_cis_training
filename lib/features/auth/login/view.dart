import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_cis_training/core/helpers/app_buttom.dart';
import 'package:men_store_cis_training/core/helpers/app_colors.dart';
import 'package:men_store_cis_training/core/helpers/app_field.dart';
import 'package:men_store_cis_training/core/helpers/app_text_styles.dart';
import 'package:men_store_cis_training/core/helpers/snack_bar.dart';
import 'package:men_store_cis_training/features/auth/login/cubit.dart';
import 'package:men_store_cis_training/features/auth/login/state.dart';
import 'package:men_store_cis_training/features/screens/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackGroundColor,
        body: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginFailure) {
              mySnackBar(
                  msg: state.msg,
                  type: AnimatedSnackBarType.error,
                  context: context);
            }
            if (state is LoginSuccess) {
              mySnackBar(
                  msg: "Login Success",
                  type: AnimatedSnackBarType.success,
                  context: context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            }
          },
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            if (state is LoginLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24, top: 70, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Login to your account",
                    style: AppTextStyles.kHeadTextStyle32,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "It’s great to see you again.",
                    style: AppTextStyles.kTextStyle16Grey,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "User Name",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  AppField(
                    hintText: "Enter Your Name",
                    controller: cubit.nameController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Password",
                    style: AppTextStyles.kTextStyle16MediumBlack,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  AppField(
                    showEyeIcon: true,
                    obscureText: cubit.obscureText,
                    eyeWidget:IconButton(
                      onPressed: (){
                       cubit.toggleEye();
                      },
                    icon:Icon(
                        cubit.obscureText?Icons.visibility_off:
                        Icons.visibility_outlined
                    )
                      ,color: Colors.grey,) ,
                    hintText: "Enter your user password",
                    controller: cubit.passwordController,
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  AppButtom(
                    text: "Login",
                    onPressed: () => cubit.login(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
