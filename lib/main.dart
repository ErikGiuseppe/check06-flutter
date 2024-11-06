import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/providers/task_group_provider.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vrxtecerxpjaadkidcbg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZyeHRlY2VyeHBqYWFka2lkY2JnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0MzQ2NTIsImV4cCI6MjA0NDAxMDY1Mn0.s_mYRCJFMLKXfizBqO7fSTlD5hdrxcRNpsOMUhXvdx4',
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => TaskGroupProvider()..listTaskGroups(),
      ),
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task APP',
          themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
