/* External dependencies */
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/* Local dependencies */
import 'package:bilimapp/core/common/common_widgets.dart';
import 'package:bilimapp/core/common/custom_text_field.dart';
import 'package:bilimapp/core/helpers/colors.dart';
import 'package:bilimapp/core/helpers/text_styles.dart';
import 'package:bilimapp/core/init/lang/locale_keys.g.dart';
import 'package:bilimapp/core/injection/injection.dart';
import 'package:bilimapp/features/app/data/models/user.dart';
import 'package:bilimapp/features/auth/bloc/auth_bloc.dart';

import '../../../../core/helpers/screen_util.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthBloc _authBloc = getIt<AuthBloc>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? emailErrorText;
  String? passwordErrorText;
  String? confirmErrorText;
  bool password1obscureText = true;
  bool password2obscureText = true;

  @override
  Widget build(BuildContext context) {
    MyScreenUtil.init(context);

    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state.successSignUp == true) {
          _authBloc.add(
            LoginEvent(
              user: User(
                email: emailController.text,
                password1: passwordController.text,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.createAnAccount.tr()),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: PrimaryButton(
              loading: state.loading,
              title: LocaleKeys.createAnAccount.tr(),
              onPressed: state.loading
                  ? null
                  : () {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(emailController.text)) {
                        setState(() {
                          emailErrorText = LocaleKeys.invalidEmail.tr();
                        });
                      } else if (emailController.text.isNotEmpty &&
                          (passwordController.text.isNotEmpty &&
                              passwordController.text.length >= 8) &&
                          confirmPasswordController.text ==
                              passwordController.text) {
                        setState(() {
                          emailErrorText = null;
                          passwordErrorText = null;
                          confirmErrorText = null;
                        });
                        _authBloc.add(SignUpEvent(
                            user: User(
                          email: emailController.text,
                          password1: passwordController.text,
                          password2: confirmPasswordController.text,
                        )));
                      } else if ((emailController.text.isEmpty &&
                          passwordController.text.isNotEmpty)) {
                        setState(() {
                          emailErrorText = LocaleKeys.invalidEmail.tr();
                          passwordErrorText = null;
                        });
                      } else if (emailController.text.isNotEmpty &&
                          (passwordController.text.isEmpty ||
                              passwordController.text.length < 8)) {
                        setState(() {
                          emailErrorText = null;
                          passwordErrorText =
                              LocaleKeys.typeAtLeast8Characters.tr();
                        });
                      } else if (emailController.text.isNotEmpty &&
                          (passwordController.text.isNotEmpty &&
                              passwordController.text.length >= 8) &&
                          confirmPasswordController.text !=
                              passwordController.text) {
                        setState(() {
                          confirmErrorText =
                              LocaleKeys.passwordsDoNotMatch.tr();
                        });
                      } else {
                        setState(() {
                          confirmErrorText =
                              LocaleKeys.passwordsDoNotMatch.tr();
                          emailErrorText = LocaleKeys.invalidEmail.tr();
                          passwordErrorText =
                              LocaleKeys.typeAtLeast8Characters.tr();
                        });
                      }
                    },
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/logo.svg',
                      width: 56.w,
                      height: 56.h,
                    ),
                    SizedBox(height: 40.h),
                    CustomTextField(
                      errorText: emailErrorText,
                      scrollPadding: EdgeInsets.only(bottom: 100.h),
                      hintText: 'name@example.com',
                      controller: emailController,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      errorText: passwordErrorText,
                      scrollPadding: EdgeInsets.only(bottom: 200.h),
                      hintText: LocaleKeys.password.tr(),
                      obscureText: password1obscureText,
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.visibility_off,
                          color: KodJazColors.blue3,
                        ),
                        onPressed: () {
                          setState(() {
                            password1obscureText = !password1obscureText;
                          });
                        },
                      ),
                      controller: passwordController,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      errorText: confirmErrorText,
                      scrollPadding: EdgeInsets.only(bottom: 100.h),
                      obscureText: password2obscureText,
                      hintText: LocaleKeys.confirmPassword.tr(),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.visibility_off,
                          color: KodJazColors.blue3,
                        ),
                        onPressed: () {
                          setState(() {
                            password2obscureText = !password2obscureText;
                          });
                        },
                      ),
                      controller: confirmPasswordController,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        // TODO: add link
                        onPressed: () {},
                        child: Text(
                          'Катталуу менен мен bilimapp\'тин Кызмат көрсөтүү саясаты жана Купуялык саясаты менен макулмун деп белгилейм.',
                          style: KodjazTextStyle.fS14FW400.copyWith(
                            color: KodJazColors.blue3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
