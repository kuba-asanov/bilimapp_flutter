/* External dependencies */
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* Local dependencies */
import 'package:bilimapp/core/common/common_widgets.dart';
import 'package:bilimapp/core/helpers/text_styles.dart';
import 'package:bilimapp/core/init/lang/locale_keys.g.dart';
import 'package:bilimapp/core/injection/injection.dart';
import 'bloc/home_bloc.dart';
import 'package:bilimapp/features/home/presentation/widgets/banner_widget.dart';
import '../../../core/helpers/screen_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = getIt<HomeBloc>();

  @override
  void initState() {
    homeBloc.add(GetLessonsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyScreenUtil.init(context);

    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeBannerWidget(),
                SizedBox(height: 40.h),
                Text(
                  LocaleKeys.recommendationsForYou.tr(),
                  style: KodjazTextStyle.fS20FW600,
                ),
                SizedBox(height: 16.h),
                BlocBuilder<HomeBloc, HomeState>(
                  bloc: homeBloc,
                  buildWhen: (previous, current) =>
                      previous.listOfCourse != current.listOfCourse ||
                      previous.loading != current.loading,
                  builder: (context, state) {
                    if (state.loading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: const Center(
                          child: Spinner(),
                        ),
                      );
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
      ),
    );
  }
}
