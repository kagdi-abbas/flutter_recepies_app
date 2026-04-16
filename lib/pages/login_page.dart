import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:recepies_app/services/auth_service.dart';
// import 'package:status_alert/status_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _loginFormKey = GlobalKey();

  String? username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),
      ),
      body: SafeArea(
        child: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm(),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      "Recip Book",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _loginForm(){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: "emilys",
              onSaved:(value) {
                setState(() {
                  username = value;                  
                });
              },
              validator:(value) {
                if(value == null || value.isEmpty){
                  return "Enter a username";
                }
              },
              decoration: InputDecoration(
                hintText: "Username",
              ),
            ),
            TextFormField(
              initialValue: "emilyspass",
              obscureText: true,
              onSaved:(value) {
                setState(() {
                  password = value;                  
                });
              },
              validator:(value) {
                if(value == null || value.length < 5){
                  return "Enter a valid password";
                }
              },
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton(){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
        onPressed: () async {
          if(_loginFormKey.currentState?.validate() ?? false){
            _loginFormKey.currentState?.save();
            // we are certain that username and password values are set becuase of our validation
            bool result = await AuthService().login(
              username!, 
              password!
            );
            if(result){
              Navigator.pushReplacementNamed(context, "/home");
            }
            else{
              // StatusAlert.show(
              //   context, 
              //   duration: Duration(seconds: 2),
              //   title: "Login Failed",
              //   subtitle: "Please try again",
              //   configuration: const IconConfiguration(icon: Icons.error,),
              //   maxWidth: 260,
              // );
              CherryToast.error(title: Text("Login Failed")).show(context);
            }
          }
        }, 
        child: const Text(
          "Login"
        ),
      ),
    );
  }
}
