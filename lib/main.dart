import 'package:flutter/material.dart';
import 'login_form_screen.dart'; // Import หน้าจอฟอร์ม

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginFormScreen(), // ตั้ง LoginFormScreen เป็น home
    );
  }
}


class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  // ตัวแปร State และเมธอดต่างๆ จะอยู่ที่นี่
  final _formKey = GlobalKey<FormState>(); // Key สำหรับฟอร์ม
  late final TextEditingController _emailController; // ตัวควบคุมสำหรับช่องกรอกอีเมล
  late final TextEditingController _passwordController; // ตัวควบคุมสำหรับช่องกรอกรหัสผ่าน
  
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // โครงสร้าง UI จะอยู่ที่นี่
    return Scaffold( // โครงสร้างพื้นฐาน
      appBar: AppBar(title: const Text('ฟอร์มล็อกอิน')),
      body: Padding(
        key: _formKey,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'กรุณากรอกข้อมูลล็อกอิน', 
                style: TextStyle(fontSize: 20)
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(  
                  labelText: 'อีเมล',
                  hintText: 'you@example.com',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกอีเมล';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'รหัสผ่าน',
                  hintText: 'กรุณากรอกรหัสผ่าน',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
          
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกรหัสผ่าน';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}

