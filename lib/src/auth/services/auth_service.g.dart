// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthServiceStore on _AuthServiceStoreBase, Store {
  late final _$userAtom =
      Atom(name: '_AuthServiceStoreBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$signupWithEmailPasswordAsyncAction = AsyncAction(
      '_AuthServiceStoreBase.signupWithEmailPassword',
      context: context);

  @override
  Future<User?> signupWithEmailPassword(
      String name, String email, String password) {
    return _$signupWithEmailPasswordAsyncAction
        .run(() => super.signupWithEmailPassword(name, email, password));
  }

  late final _$signInWithEmailPasswordAsyncAction = AsyncAction(
      '_AuthServiceStoreBase.signInWithEmailPassword',
      context: context);

  @override
  Future<User?> signInWithEmailPassword(String email, String password) {
    return _$signInWithEmailPasswordAsyncAction
        .run(() => super.signInWithEmailPassword(email, password));
  }

  late final _$signInWithFacebookAsyncAction =
      AsyncAction('_AuthServiceStoreBase.signInWithFacebook', context: context);

  @override
  Future<User?> signInWithFacebook() {
    return _$signInWithFacebookAsyncAction
        .run(() => super.signInWithFacebook());
  }

  late final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthServiceStoreBase.signInWithGoogle', context: context);

  @override
  Future<User?> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  late final _$signOutAsyncAction =
      AsyncAction('_AuthServiceStoreBase.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$getCurrentUserAsyncAction =
      AsyncAction('_AuthServiceStoreBase.getCurrentUser', context: context);

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
