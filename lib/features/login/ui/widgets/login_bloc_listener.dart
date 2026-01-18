import 'package:advance_flutter_project/core/helpers/extensions.dart';
import 'package:advance_flutter_project/core/routing/routes.dart';
import 'package:advance_flutter_project/core/theming/colors.dart';
import 'package:advance_flutter_project/core/theming/styles.dart';
import 'package:advance_flutter_project/features/login/logic/cubit/login_cubit.dart';
import 'package:advance_flutter_project/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            // show loading
            showDialog(context: context, builder: (context) {
              return const Center(child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ));
            });
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
            // navigate to home screen
          },
          error: (error) {
            // show error
            context.pop();
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                icon: Icon(Icons.error, color: Colors.red, size: 32.0,),
                content: Text(error , style: TextStyles.font15DarkBlueMedium),
                actions: [
                  TextButton(onPressed: () {
                    context.pop();
                  }, child: Text('Go it', style: TextStyles.font14BlueSemiBold,))
                ],
              );
            });
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
