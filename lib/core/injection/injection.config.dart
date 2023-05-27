// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kodjaz/core/client/client.dart' as _i3;
import 'package:kodjaz/core/injection/register_module.dart' as _i17;
import 'package:kodjaz/core/navigation/auto_route.gr.dart' as _i5;
import 'package:kodjaz/features/app/presentation/bloc/app_bloc.dart' as _i4;
import 'package:kodjaz/features/articles/presentation/bloc/article_bloc.dart'
    as _i6;
import 'package:kodjaz/features/auth/bloc/auth_bloc.dart' as _i14;
import 'package:kodjaz/features/auth/repository/auth_repository.dart' as _i7;
import 'package:kodjaz/features/auth/repository/auth_repository_impl.dart'
    as _i8;
import 'package:kodjaz/features/home/presentation/bloc/home_bloc.dart' as _i15;
import 'package:kodjaz/features/home/repository/home_repository.dart' as _i9;
import 'package:kodjaz/features/home/repository/home_repository_impl.dart'
    as _i10;
import 'package:kodjaz/features/lesson/presentation/bloc/lesson_bloc.dart'
    as _i16;
import 'package:kodjaz/features/lesson/repository/lesson_repository.dart'
    as _i11;
import 'package:kodjaz/features/lesson/repository/lesson_repository_impl.dart'
    as _i12;
import 'package:kodjaz/features/quiz/bloc/test_cubit.dart' as _i13;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Api>(_i3.Api());
    gh.lazySingleton<_i4.AppBloc>(() => _i4.AppBloc());
    gh.lazySingleton<_i5.AppRouter>(() => registerModule.router);
    gh.lazySingleton<_i6.ArticleBloc>(() => _i6.ArticleBloc());
    gh.factory<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl());
    gh.factory<_i9.HomeRepository>(() => _i10.HomeRepositoryImpl());
    gh.factory<_i11.LessonRepository>(
        () => _i12.LessonRepositoryImpl(gh<_i3.Api>()));
    gh.lazySingleton<_i13.TestCubit>(() => _i13.TestCubit());
    gh.singleton<_i14.AuthBloc>(_i14.AuthBloc(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i15.HomeBloc>(
        () => _i15.HomeBloc(gh<_i9.HomeRepository>()));
    gh.lazySingleton<_i16.LessonBloc>(
        () => _i16.LessonBloc(gh<_i11.LessonRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
