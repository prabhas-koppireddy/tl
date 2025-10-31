import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Form Example', 
      debugShowCheckedModeBanner: false, 
      theme: ThemeData( 
        inputDecorationTheme: InputDecorationTheme( 
          border: OutlineInputBorder( 
            borderRadius: BorderRadius.circular(12), 
          ), 
          filled: true, 
          fillColor: Colors.deepOrange[50], 
        ), 
      ), 
      home: MyForm(), 
    ); 
  } 
} 
 
class MyForm extends StatefulWidget { 
  @override 
  _MyFormState createState() => _MyFormState(); 
} 
 
class _MyFormState extends State<MyForm> { 
  final _formKey = GlobalKey<FormState>(); 
  final TextEditingController _nameController = TextEditingController(); 
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController(); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Colors.deepPurple[900], 
        foregroundColor: Colors.deepOrange[50], 
        title: Text('Form'), 
      ), 
      backgroundColor: Colors.amber.shade50, 
      body: Padding( 
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16), 
        child: Form( 
          key: _formKey, 
          child: Column( 
            children: <Widget>[ 
              TextFormField( 
                controller: _nameController, 
                decoration: InputDecoration( 
                  labelText: 'Name', 
                  prefixIcon: Icon(Icons.person, color: Colors.deepPurple[900]), 
                ), 
                validator: (value) { 
                  if (value == null || value.isEmpty) { 
                    return 'Please enter your name'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox(height: 16), 
 
              TextFormField( 
                controller: _emailController, 
                keyboardType: TextInputType.emailAddress, 
                decoration: InputDecoration( 
                  labelText: 'Email', 
                  prefixIcon: Icon(Icons.email, color: Colors.deepPurple[900]), 
                ), 
                validator: (value) { 
                  if (value == null || value.isEmpty) { 
                    return 'Please enter your email'; 
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$') 
                      .hasMatch(value)) { 
                    return 'Please enter a valid email address'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox(height: 16), 
 
              TextFormField( 
                controller: _passwordController, 
                obscureText: true, 
                decoration: InputDecoration( 
                  labelText: 'Password', 
                  prefixIcon: Icon(Icons.lock, color: Colors.deepPurple[900]), 
                ), 
                validator: (value) { 
                  if (value == null || value.isEmpty) { 
                    return 'Please enter your password'; 
                  } else if (value.length < 6) { 
                    return 'Password must be at least 6 characters long'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox(height: 24), 
 
              ElevatedButton.icon( 
                style: ElevatedButton.styleFrom( 
                  backgroundColor: Colors.deepPurple[900], 
                  minimumSize: Size(double.infinity, 50), 
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(12), 
                  ), 
                ), 
                onPressed: () { 
                  if (_formKey.currentState!.validate()) { 
                    print('Name: ${_nameController.text}'); 
                    print('Email: ${_emailController.text}'); 
                    print('Password: ${_passwordController.text}'); 
                    ScaffoldMessenger.of(context).showSnackBar( 
                      SnackBar( 
                        content: Text('Form submitted successfully!'), 
                        backgroundColor: Colors.green, 
                      ), 
                    ); 
                  } 
                }, 
                label: Text( 
                  'Submit', 
                  style: TextStyle(fontSize: 18, color: Colors.white), 
                ), 
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
} 
 
 
 
 
 
