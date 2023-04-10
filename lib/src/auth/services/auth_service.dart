import 'package:chatapp/src/utils/firebase_utils.dart';
import 'package:chatapp/src/utils/log.dart';
import 'package:chatapp/src/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth_service.g.dart';

// ignore: library_private_types_in_public_api
class AuthServiceStore = _AuthServiceStoreBase with _$AuthServiceStore;

abstract class _AuthServiceStoreBase with Store {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @observable
  User? user;

  // @desc :  signup user with firebase email and password
  // @return : User [sucess], exception [error]
  @action
  Future<User?> signupWithEmailPassword(String name, String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      await user!.updateDisplayName(name);
      addDataToFireStore(user);
    } on FirebaseAuthException catch (e) {
      AppLog.error(e.message ?? "FirebaseAuthException on signupWithEmail");
      throw "${e.message}";
    } catch (e) {
      AppLog.error("signupWithEmail:  $e");
      throw e.toString();
    }
    return user;
  }

  // @desc :  sigin user with firebase email and password
  // @return : UserCredential [sucess], nuexceptionll [error]
  @action
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      addDataToFireStore(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppLog.error(e.code);
        displaySnackBar(e.code);
        rethrow;
      } else if (e.code == 'wrong-password') {
        AppLog.error(e.code);
        displaySnackBar(e.code);
        rethrow;
      }
    } catch (e) {
      AppLog.error("signInWithEmail:  $e");
      throw e.toString();
    }
    return user;
  }

  // @desc : Firebase credential with the Google token
  // @return : UserCredential [sucess], null [error]
  @action
  Future<User?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // Create a credential from the access token
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
        // Once signed in, return the UserCredential
        final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        user = userCredential.user;
        addDataToFireStore(user);
      } else {
        AppLog.error("Failed to sign in with Facebook");
        throw Exception('Failed to sign in with Facebook');
      }
    } catch (e) {
      AppLog.error("signInWithFacebook:  $e");
      throw e.toString();
    }
    return user;
  }

  // @desc : Firebase credential with the Google token
  // @return : UserCredential [sucess], null [error]
  @action
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    try {
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        user = userCredential.user;
        addDataToFireStore(user);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        AppLog.error("signInWithGoogle : ${e.code}");
      } else if (e.code == 'invalid-credential') {
        AppLog.error("signInWithGoogle : ${e.code}");
      }
    } catch (e) {
      AppLog.error("signInWithGoogle : $e");
      throw e.toString();
    }
    return user;
  }

  @action
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    // await FacebookAuth.instance.logOut();
    user = null;
  }

  @action
  Future<void> getCurrentUser() async {
    user = _firebaseAuth.currentUser;
  }
}
