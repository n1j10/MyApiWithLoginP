import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapi/calss.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController login = TextEditingController();
  TextEditingController sinup = TextEditingController();
  bool visibilityOffOrNot =true;
  Crud _crud = Crud();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            color: Colors.white70,
            height: MediaQuery.of(context).size.height /5,
            width: MediaQuery.of(context).size.width /2,
            child: Image.asset(
              "images/login.png",
            ),
          ),
          SizedBox(height: 15.0,),
          Center(
            child: Text("Log In",style: TextStyle(
                color: Colors.blue[400],
                fontSize: 35,fontWeight: FontWeight.bold
            ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 12.0),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                fillColor: Colors.blue,
                filled: true,
                prefixIcon:  Icon(Icons.email),
                prefixIconColor: Colors.deepOrange[400],
                hintText: "Email adress",
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 12.0),
            child: TextFormField(
              controller: pass,
              obscureText: visibilityOffOrNot,
              decoration: InputDecoration(
                fillColor: Colors.blue,
                filled: true,
                hintText: "Password",
                prefixIcon:  Icon(Icons.lock),
                prefixIconColor: Colors.deepOrange[400],
                suffixIcon: Icon(Icons.visibility_off),
                suffixIconColor: Colors.deepOrange,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 12.0),
            child: TextFormField(
              controller: login,
              decoration: InputDecoration(
                fillColor: Colors.blue,
                filled: true,
                prefixIcon:  Icon(Icons.email),
                prefixIconColor: Colors.deepOrange[400],
                hintText: "Name",
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.only(left: 30.0,right: 30.0,top: 12.0),
            child: TextFormField(
              controller: sinup,
              decoration: InputDecoration(
                fillColor: Colors.blue,
                filled: true,
                prefixIcon:  Icon(Icons.email),
                prefixIconColor: Colors.deepOrange[400],
                hintText: "Age",
                ),
              ),
            ),
          SizedBox(height: 25,),
          Column(
            children: [
              //padding: EdgeInsets.all(20.0),
              ElevatedButton(
                onPressed: (){
                  if (email.text.isNotEmpty) {
                    _crud.postRequest(email.text);
                  } else {
                    print("Wrong Info");
                  }
                },
                child: Text("Log In",
                  style: TextStyle(color: Colors.white,
                    fontSize: 30, fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  padding: EdgeInsets.symmetric(horizontal: 135.0,vertical: 10.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 135,),
              Text("Dont have an account?"),
              Padding(padding: EdgeInsets.all(10),
              ),
              TextButton(
                onPressed: () {
                  if (pass.text.isNotEmpty){
                    _crud.getProducts(pass.text);
                  }else{
                    print("Error");
                  }
                },
                child: Text("Sign Up",
                  style: TextStyle(color: Colors.amber[900],fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              ElevatedButton.icon(onPressed: (){
                if (login.text.isNotEmpty){
                  _crud.putProducts(login.text);
                }else{
                  print("Wrong Info");
                }
              },
                label: Text("Continue with Facebook",style:
                TextStyle(color: Colors.white,),
                ),
                icon: Icon(Icons.facebook_outlined,size: 30,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: EdgeInsets.symmetric(horizontal: 83.0,vertical: 17.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              ElevatedButton.icon(onPressed: (){

                if(sinup.text.isNotEmpty){
                  _crud.deleteProducts(sinup.text);
                }else{
                  print("Wrong Info");
                }
              }, //del
                label: Text("Continue With Google",style: TextStyle(color: Colors.grey[700]),),
                icon: Icon(Icons.g_mobiledata_rounded,color: Colors.orange,size: 40,),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[15],
                  padding: EdgeInsets.symmetric(horizontal: 83.0,vertical: 11.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
