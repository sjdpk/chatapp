// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on AppStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'AppStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$showAtom = Atom(name: 'AppStoreBase.show', context: context);

  @override
  bool get show {
    _$showAtom.reportRead();
    return super.show;
  }

  @override
  set show(bool value) {
    _$showAtom.reportWrite(value, super.show, () {
      super.show = value;
    });
  }

  late final _$initialLineAtom =
      Atom(name: 'AppStoreBase.initialLine', context: context);

  @override
  int get initialLine {
    _$initialLineAtom.reportRead();
    return super.initialLine;
  }

  @override
  set initialLine(int value) {
    _$initialLineAtom.reportWrite(value, super.initialLine, () {
      super.initialLine = value;
    });
  }

  late final _$isLoginAtom =
      Atom(name: 'AppStoreBase.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  void setLoading({required bool loading}) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setLoading');
    try {
      return super.setLoading(loading: loading);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShow(bool? show) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setShow');
    try {
      return super.setShow(show);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setinitialLine({int? line}) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setinitialLine');
    try {
      return super.setinitialLine(line: line);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogin() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setLogin');
    try {
      return super.setLogin();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
show: ${show},
initialLine: ${initialLine},
isLogin: ${isLogin}
    ''';
  }
}
