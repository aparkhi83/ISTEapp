import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign-in function
  Future<void> _signIn() async {
    try {
      // Get email and password from controllers
      String email = _emailController.text;
      String password = _passwordController.text;

      // Sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If sign-in is successful
      print("Signed in: ${userCredential.user!.email}");

      // Navigate to the home screen or another screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Replace with your next screen
      );
    } catch (e) {
      // If sign-in fails
      print("Error: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
              children: [
                Column(children:[Container(
                  padding: const EdgeInsets.only(left: 35, top: 130),
                  child: const Text('Welcome to ISTE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Times New Roman',
                        color: Colors.black,
                        fontSize:40),
                  ),
                ),
                  Container(
                    child: Image.asset('assets/images/iste.png', width: 200,height:200,alignment: Alignment.centerRight,),
                  ),]),
                SingleChildScrollView(
                    child:Container(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5, left: 35, right: 35),
                        child: Column(
                            children:[
                              TextField(
                                controller: _emailController,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email_outlined),
                                    fillColor: Colors.white.withOpacity(0.3),
                                    filled: true,
                                    hoverColor: Colors.white.withOpacity(0.6),
                                    hintText: 'Enter your Email', border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextField(
                                cursorColor: Colors.white,
                                obscureText: true,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    fillColor: Colors.white.withOpacity(0.3),
                                    filled: true,
                                    hintText: 'Enter the password', border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)
                                )
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(

                                  height: 40,
                                  width: 150,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.amberAccent,          // Background color of the button
                                    borderRadius: BorderRadius.circular(30),  // Curved edges (adjust the radius for more or less curve)
                                  ),
                                  child:ElevatedButton(onPressed: (){
                                    _signIn();
                                  },
                                    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.amberAccent
    ),
                                    child: Text(
                                      'Log In',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:15,
                                      )),
                                    )

    ),



                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: Text(
                                    'Log in with', style: TextStyle(
                                  fontFamily: 'Times New Roman',
                                    fontSize: 25
                                )
                                ),
                              ),
                              Container(
                                child: Image.asset('assets/images/g.png', width: 50,height:50,alignment: Alignment.center,),
                              )
                            ]
                        )
                    )
                )
              ]
          ),
        )
    );
  }
}