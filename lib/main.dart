import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wlfhtjmtwxzaeqjwiyen.supabase.co',
    publishableKey: 'sb_publishable_cqWgz1x_gTmGWzeL4KaV7g_N3rR0ibP',
  );

  runApp(const RagibAliApp());
}

class RagibAliApp extends StatelessWidget {
  const RagibAliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ragib Ali',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF126B4F)),
        scaffoldBackgroundColor: const Color(0xFFF6F8F6),
      ),
      home: const HomePage(),
    );
  }
}
