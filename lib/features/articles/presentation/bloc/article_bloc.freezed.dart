// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleState {
  bool get loading => throw _privateConstructorUsedError;
  List<Article> get listOfArticles => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleStateCopyWith<ArticleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleStateCopyWith<$Res> {
  factory $ArticleStateCopyWith(
          ArticleState value, $Res Function(ArticleState) then) =
      _$ArticleStateCopyWithImpl<$Res, ArticleState>;
  @useResult
  $Res call({bool loading, List<Article> listOfArticles, String? error});
}

/// @nodoc
class _$ArticleStateCopyWithImpl<$Res, $Val extends ArticleState>
    implements $ArticleStateCopyWith<$Res> {
  _$ArticleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? listOfArticles = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      listOfArticles: null == listOfArticles
          ? _value.listOfArticles
          : listOfArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleStateCopyWith<$Res>
    implements $ArticleStateCopyWith<$Res> {
  factory _$$_ArticleStateCopyWith(
          _$_ArticleState value, $Res Function(_$_ArticleState) then) =
      __$$_ArticleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<Article> listOfArticles, String? error});
}

/// @nodoc
class __$$_ArticleStateCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$_ArticleState>
    implements _$$_ArticleStateCopyWith<$Res> {
  __$$_ArticleStateCopyWithImpl(
      _$_ArticleState _value, $Res Function(_$_ArticleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? listOfArticles = null,
    Object? error = freezed,
  }) {
    return _then(_$_ArticleState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      listOfArticles: null == listOfArticles
          ? _value._listOfArticles
          : listOfArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ArticleState implements _ArticleState {
  _$_ArticleState(
      {this.loading = false,
      final List<Article> listOfArticles = const [],
      this.error})
      : _listOfArticles = listOfArticles;

  @override
  @JsonKey()
  final bool loading;
  final List<Article> _listOfArticles;
  @override
  @JsonKey()
  List<Article> get listOfArticles {
    if (_listOfArticles is EqualUnmodifiableListView) return _listOfArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfArticles);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'ArticleState(loading: $loading, listOfArticles: $listOfArticles, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._listOfArticles, _listOfArticles) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading,
      const DeepCollectionEquality().hash(_listOfArticles), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleStateCopyWith<_$_ArticleState> get copyWith =>
      __$$_ArticleStateCopyWithImpl<_$_ArticleState>(this, _$identity);
}

abstract class _ArticleState implements ArticleState {
  factory _ArticleState(
      {final bool loading,
      final List<Article> listOfArticles,
      final String? error}) = _$_ArticleState;

  @override
  bool get loading;
  @override
  List<Article> get listOfArticles;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleStateCopyWith<_$_ArticleState> get copyWith =>
      throw _privateConstructorUsedError;
}
