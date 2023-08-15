import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.pushReplacementNamed(context, 'home' );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(height: 50,),
            ClipRRect(borderRadius:BorderRadius.circular(30),child: Image.asset('assets/images/appicon.png',width:350)),
            SizedBox(height: 100,),
        SpinKitDualRing(
          color: Colors.grey,
          size: 50.0,
        ),


        ],

      ),
      )
    );
  }
}
