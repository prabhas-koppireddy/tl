import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(const MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return const MaterialApp( 
      debugShowCheckedModeBanner: false, 
      home: HomeScreen(), 
    ); 
  } 
} 
 
// Custom Widget: Gradient Button 
class GradientButton extends StatelessWidget { 
  final String text; 
  final IconData icon; 
  final VoidCallback onPressed; 
 
  const GradientButton({ 
    super.key, 
    required this.text, 
    required this.icon, 
    required this.onPressed, 
  }); 
 
  @override 
  Widget build(BuildContext context) { 
    return GestureDetector( 
      onTap: onPressed, 
      child: Container( 
        margin: const EdgeInsets.symmetric(vertical: 10), 
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14), 
        width: 330, 
        decoration: BoxDecoration( 
          gradient: const LinearGradient( 
            colors: [Colors.purple, Colors.blue], 
            begin: Alignment.topLeft, 
            end: Alignment.bottomRight, 
          ), 
          borderRadius: BorderRadius.circular(20), 
          boxShadow: const [ 
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 2)), 
          ], 
        ), 
        child: Row( 
          mainAxisSize: MainAxisSize.min, 
          children: [ 
            Icon(icon, color: Colors.white, size: 24), 
            const SizedBox(width: 12), 
            Text( 
              text, 
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: 
FontWeight.bold), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
} 
 
// Home Screen 
class HomeScreen extends StatelessWidget { 
  const HomeScreen({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: Colors.grey[100], 
      appBar: AppBar(title: const Text("Custom Gradient Buttons")), 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            GradientButton( 
              text: "Login", 
              icon: Icons.login, 
              onPressed: () { 
                ScaffoldMessenger.of(context).showSnackBar( 
                  const SnackBar(content: Text("Login Clicked")), 
                ); 
              }, 
            ), 
            GradientButton( 
              text: "Sign Up", 
              icon: Icons.person_add, 
              onPressed: () { 
                ScaffoldMessenger.of(context).showSnackBar( 
                  const SnackBar(content: Text("Sign Up Clicked")), 
                ); 
              }, 
            ), 
            GradientButton( 
              text: "Settings", 
              icon: Icons.settings, 
              onPressed: () { 
                ScaffoldMessenger.of(context).showSnackBar( 
                  const SnackBar(content: Text("Settings Clicked")), 
                ); 
              }, 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
} 
 
