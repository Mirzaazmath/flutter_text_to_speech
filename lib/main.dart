import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_textto_speech/screens/home_screen.dart';
void main(){
  /// Ensuring the device is in portrait mode always
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}
