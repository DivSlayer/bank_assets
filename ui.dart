import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.blue),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بانک ملت',
      theme: ThemeData(
        fontFamily: 'Vazir', // Use a Persian font
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('همراه بانک ملت'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'خدمات تسهیلات'),
              Tab(text: 'خدمات سپرده'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Loan Services Tab
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildAccountSection('کوتاه مدت'),
                    const SizedBox(height: 20),
                    _buildAccountSection('بلند مدت'),
                  ],
                ),
              ),
            ),
            // Deposit Services Tab
            const Center(child: Text('Deposit Services Content')),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSection(String title) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            _buildInfoRow('موجودی', '۱۲,۵۴۰,۰۰۰ ریال'),
            _buildInfoRow('مانده موجودی', '۱۰,۰۰۰,۰۰۰ ریال'),
            const SizedBox(height: 16),
            _buildServicesTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildServicesTable() {
    return Table(
      border: TableBorder.all(),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
      },
      children: const [
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('گروش حساب', textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('سرویس ها', textAlign: TextAlign.center),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('فرض الحسنه'),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('FFV, 1VP'),
            ),
          ],
        ),
      ],
    );
  }
}

// Login Screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('بانک ملت')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('نام کاربری', textAlign: TextAlign.right),
            const TextField(),
            const SizedBox(height: 20),
            const Text('رمز ورود', textAlign: TextAlign.right),
            const TextField(obscureText: true),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(value: true, onChanged: (v) {}),
                const Text('ذخیره نام کاربری'),
              ],
            ),
            ElevatedButton(onPressed: () {}, child: const Text('ورود')),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: const Text('ورود با اثر انگشت', 
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: const Text('بازنشانی رمزعبور',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
