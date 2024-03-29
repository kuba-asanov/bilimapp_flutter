/* External dependencies */
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:bilimapp/core/common/common_widgets.dart';
import 'package:bilimapp/core/helpers/colors.dart';
import 'package:bilimapp/core/helpers/screen_util.dart';
import 'package:bilimapp/core/helpers/text_styles.dart';
import 'package:bilimapp/core/init/lang/locale_keys.g.dart';
import 'package:bilimapp/core/injection/injection.dart';

import '../../home/presentation/bloc/home_bloc.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyScreenUtil.init(context);

    final HomeBloc homeBloc = getIt<HomeBloc>();

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.myCourses.tr(),
                    style: KodjazTextStyle.fS20FW600,
                  ),
                  SizedBox(height: 8.h),
                  BlocBuilder<HomeBloc, HomeState>(
                    bloc: homeBloc,
                    buildWhen: (previous, current) =>
                        previous.listOfCourse != current.listOfCourse ||
                        previous.loading != current.loading,
                    builder: (context, state) {
                      if (state.loading) {
                        return const Spinner(color: KodJazColors.grey2);
                      }

                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.myListOfCourse.length,
                        itemBuilder: (context, index) => CourseWidget(
                          course: state.myListOfCourse[index],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    LocaleKeys.recommendationsForYou.tr(),
                    style: KodjazTextStyle.fS20FW600,
                  ),
                  SizedBox(height: 8.h),
                  BlocBuilder<HomeBloc, HomeState>(
                    bloc: homeBloc,
                    buildWhen: (previous, current) =>
                        previous.listOfCourse != current.listOfCourse ||
                        previous.loading != current.loading,
                    builder: (context, state) {
                      if (state.loading) {
                        return const Spinner(color: KodJazColors.grey2);
                      }

                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.listOfCourse.length,
                        itemBuilder: (context, index) => CourseWidget(
                          course: state.listOfCourse[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
