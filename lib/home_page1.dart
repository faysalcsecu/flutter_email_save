// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class HomePage1 extends StatefulWidget {
//   const HomePage1({super.key});
//
//   @override
//   State<HomePage1> createState() => _HomePage1State();
// }
//
// class _HomePage1State extends State<HomePage1> {
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedCredentials();
//   }
//
//   // Load saved email and password from SharedPreferences
//   _loadSavedCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       emailController.text = prefs.getString('email') ?? '';
//       passwordController.text = prefs.getString('password') ?? '';
//     });
//   }
//
//   // Save email and password to SharedPreferences
//   _saveCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('email', emailController.text);
//     await prefs.setString('password', passwordController.text);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Email Login",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black,fontWeight: FontWeight.bold),),
//         backgroundColor: Colors.orangeAccent,
//       ),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.account_circle, size: 300, color: Colors.grey),
//               SizedBox(height: 20),
//
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//
//               ElevatedButton(
//                 onPressed: () {
//                   _saveCredentials();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Login Successful & Data Saved!')),
//                   );
//                 },
//                 child: Text('LOG IN', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }
// }
//
//


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  // Load saved email and password from SharedPreferences
  _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailController.text = prefs.getString('email') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
    });
  }

  // Save email and password to SharedPreferences
  _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);
  }

  // Function to validate email format
  bool _isValidEmail(String email) {
    String emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  // Function to handle login validation
  void _handleLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar("⚠️ Email and Password cannot be empty!");
    } else if (!_isValidEmail(email)) {
      _showSnackBar("❌ Invalid Email Format! Example: user@example.com");
    } else {
      _saveCredentials();
      _showSnackBar("✅ Login Successful & Data Saved!");
    }
  }

  // Function to show snackbar messages
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.orangeAccent,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Email Login",
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, size: 100, color: Colors.grey),
              SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _handleLogin,
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



















