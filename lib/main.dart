import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: LoadingScreen(),
        git);
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VR-RC',
          style: TextStyle(color: Colors.yellowAccent),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SpinKitThreeBounce(
              color: Colors.yellowAccent,
              size: 100.0,
            ),
          ),
          GestureDetector(
            child: Container(
              child: Center(
                child: Text(
                  'Press here to continue',
                  style: TextStyle(color: Colors.yellowAccent),
                ),
              ),
              color: Colors.white10,
              height: 80.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputPage();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
