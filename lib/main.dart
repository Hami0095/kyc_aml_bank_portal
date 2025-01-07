import 'package:windows_11_check/screens/kyc_setup_screen.dart';
import 'package:windows_11_check/screens/transaction_monitoring_screen.dart';

import '../screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/user_management_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BankPortalApp());
}

class BankPortalApp extends StatelessWidget {
  const BankPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/recentTransactions': (context) => TransactionMonitoringScreen(),
        '/kycDatabase': (context) => KYCSetupScreen(),
        '/userManagement': (context) => UserManagementScreen(),
      },
    );
  }
}
