import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_avanzado/pages/login/login_page.dart';
import 'package:flutter_ui_avanzado/utils/dialogs.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Auth {
  Auth._internal();
  static Auth get instance => Auth._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> get user async { 
    return (await _firebaseAuth.currentUser());
  }

  Future<FirebaseUser> facebook(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == 200) {
        print('facebook login ok');
        // final userData = await FacebookAuth.instance.getUserData();
        // print(userData);

        final AuthCredential credential =  FacebookAuthProvider.getCredential(accessToken: result.accessToken.token,);

        final AuthResult authResult =
          await _firebaseAuth.signInWithCredential(credential);

        final FirebaseUser user = authResult.user;
        print("username: ${user.displayName}");
        progressDialog.dismiss();
        return user;
      } else if (result.status == 403) {
        print('facebook login cancelled');
      } else {
        print('facebook login failed');
      }
      progressDialog.dismiss();
      return null;
    } catch (e) {
      print(e);
      progressDialog.dismiss();
      return null;
    }
  }

  Future<FirebaseUser> google(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final GoogleSignInAccount googleUSer = await _googleSignIn.signIn();
      final GoogleSignInAuthentication authentication =
          await googleUSer.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      final AuthResult result =
          await _firebaseAuth.signInWithCredential(credential);

      final FirebaseUser user = result.user;

      print("username: ${user.displayName}");
      progressDialog.dismiss();
      return user;
    } catch (e) {
      print(e);
      progressDialog.dismiss();
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async
  {
    final List<UserInfo> providers = (await user).providerData;
    String providerId = 'firebase';
    for (final p in providers){
      if(p.providerId != 'firebase'){
        providerId = p.providerId;
        break;
      }
    }

    print("providerId $providerId");
    switch(providerId){
      case "facebook.com":
        await FacebookAuth.instance.logOut();
        break;
      case "google.com":
        await _googleSignIn.signOut();
        break;
      case "password":
        break;
      case "phone":
        break;
    }
    await _firebaseAuth.signOut();

    Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, (_) => false);
  }
}
