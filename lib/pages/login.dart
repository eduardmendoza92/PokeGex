import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pokegex/behaviors/hiddenScrollBehavior.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pokegex/helpers/auth.dart';
import 'package:pokegex/models/user.dart';

class LoginPage extends StatefulWidget {
  final User state;
  final Widget child;

  LoginPage({
    @required this.child,
    this.state,
  });

  // Returns data of the nearest widget _StateDataWidget
  // in the widget tree.
  static _LoginPageState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_LoginDataWidget)
            as _LoginDataWidget)
        .data;
  }

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user;
  GoogleSignInAccount googleAccount;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

@override
  void initState() {
    super.initState();
    if (widget.state != null) {
      user = widget.state;
    } else {
      user = new User(isLoading: true);
      initUser();
    }
  }

  Future<Null> initUser() async {
    googleAccount = await getSignedInAccount(googleSignIn);
    if (googleAccount == null) {
      setState(() {
        user.isLoading = false;
      });
    } else {
      await signInWithGoogle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesion'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
          behavior: HiddenScrollBehavior(),
          child: Form(
            child: ListView(
              children: <Widget>[
                Image.asset(
                  'assets/valor.png',
                  width: 250.0,
                  height: 250.0,
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Iniciar Sesion con Google",
                  onPressed: () {
                    signInWithGoogle();
                  },
                ),
                SignInButton(
                  Buttons.Facebook,
                  text: "Iniciar Sesion con Facebook",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> signInWithGoogle() async {
    if (googleAccount == null) {
      googleAccount = await googleSignIn.signIn();
    }

    FirebaseUser firebaseUser = await signIntoFirebase(googleAccount);
    user.userData = firebaseUser;
    setState(() {
      user.isLoading = false;
      user.userData = firebaseUser;
    });
  }
}

class _LoginDataWidget extends InheritedWidget {
  final _LoginPageState data;

  _LoginDataWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  // Rebuild the widgets that inherit from this widget
  // on every rebuild of _StateDataWidget:
  @override
  bool updateShouldNotify(_LoginDataWidget old) => true;
}
