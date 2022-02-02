import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guru/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (){
       return MaterialApp(
          title: 'Guru',
         debugShowCheckedModeBanner:false,
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
          ),
          themeMode: ThemeMode.system,
          home: const SplashScreen(),
        );
      },
    );
  }
}


