

import 'package:flutter/material.dart';
import 'package:pet_care/CommunityScreen.dart';
import 'package:pet_care/ForgotPassword.dart';
import 'package:pet_care/GoogleNavBar.dart';
import 'package:pet_care/HomePage.dart';
import 'package:pet_care/LoginPage.dart';
import 'package:pet_care/PaymentForm.dart';
import 'package:pet_care/ProfilePage.dart';
import 'package:pet_care/SignUpPage.dart';
import 'package:pet_care/SignUpPageForm.dart';
import 'package:pet_care/SplashScreen.dart';
import 'package:pet_care/TrackingPet.dart';
import 'package:pet_care/phoneAuthentication.dart';

class checkFiles extends StatefulWidget {
  const checkFiles({super.key});

  @override
  State<checkFiles> createState() => _checkFilesState();
}

class _checkFilesState extends State<checkFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Files"),
      ),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Center(child: ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),)), child: Text("Login"))),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpForm(),)), child: Text("Signup")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Tests(),)), child: Text("Google NavBar")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)), child: Text("HomePage")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentForm( ),)), child: Text("Payment Form")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword(),)), child: Text("Forgot PassWord")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneAuthentication(),)), child: Text("Phone Authentication")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),)), child: Text("Profile Page")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen(),)), child: Text("Splash Screen")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),)), child: Text("SignUp Page")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => trackingPet(),)), child: Text("Pet Track")),
            ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => communityScreen(),)), child: Text("Community Screen")),
            ElevatedButton(onPressed: ()=> ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Paid Successfully"))), child: Text("Click")),



          ],
        ),
      ),
    );
  }
}
