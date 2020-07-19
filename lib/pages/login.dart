import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading;
  bool isLogedin = false;

  @override
  void initState(){
    super.initState();
    isSignedIn();
  }
  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if(isLogedin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }
  Future handleSignIn() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    AuthCredential credential = await GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken
    ); // AuthCredential === firebase of tutor
    AuthResult firebaseUser = (await firebaseAuth.signInWithCredential(credential));
    //FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if(FirebaseUser != null){
      final QuerySnapshot result = await Firestore.instance.collection("users").where("id", isEqualTo: FirebaseUser).getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if(documents.length == 0){
        Firestore.instance.collection("user").document(firebaseUser.user.uid).setData({
          "id" : firebaseUser.user.uid,
          "username": firebaseUser.user.displayName,
          "profilePicture": firebaseUser.user.photoUrl,
        });
        await preferences.setString("id",firebaseUser.user.uid);
        await preferences.setString("username", firebaseUser.user.displayName);
        await preferences.setString("photoUrl", firebaseUser.user.displayName);//errpr
      } else{
      await preferences.setString("id", documents[0]['id']);
      await preferences.setString("username", documents[0]['username']);
      await preferences.setString("photoUrl", documents[0]['photoUrl']);
    }
      Toast.show("Logged in Successful", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      setState(() {
        loading = false;
      });
    }else{Toast.show("Login Failed", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: <Widget>[
        Image.asset('images/back.jpg',
          fit: BoxFit.cover,
        width: double.infinity,
          ),
        Container(
        alignment: Alignment.topCenter,
          child: Image.asset('images/logo.png'
          width: 150.0,
          height: 150.0,
          ),
        ),
        Visibility(
          visible: loading ?? true,
          child: Center(
            child: Container(
              alignment: Alignment.center,
               color: Colors.white.withOpacity(0.7),
              child: CircularProgressIndicator(
                valueColor:  AlwaysStoppedAnimation<Color>(Colors.red),
              )
            ),
          ),
        )
      ],
    ),
      bottomNavigationBar: Container(
          child: Padding(
            padding: const EdgeInsets.only(left:12.0, right:12.0, top:8.0, bottom:12.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: (){
                handleSignIn();
              }, child: Text("Sign In"),
            ),
          ),
      ) ,
    );
}
}

