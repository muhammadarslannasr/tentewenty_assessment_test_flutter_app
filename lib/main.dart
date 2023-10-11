import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty_assessmen_test/utils/constants.dart';
import 'package:tentwenty_assessmen_test/view_model/tabs_view_model.dart';
import 'package:tentwenty_assessmen_test/view_model/watch_view_model.dart';
import 'package:tentwenty_assessmen_test/views/tabs/tabs_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabsViewModel()),
        ChangeNotifierProvider(create: (_) => WatchViewModel()),
      ],
      child: MaterialApp(
        title: Constants.tenTwentyAssessmentTestTxt,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const TabsView(),
        // home: const Tabbed(),
      ),
    );
  }
}
