import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/LoginScreen/LoginScreen.dart';

import '../customtextfiled/customtextfiled.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  TextEditingController ConfirmPasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white, // اللون الرمادي الخفيف للخلفية
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            const Text(
              "Sign up",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color(0xffADE0EB),
              ),
            ),
            SizedBox(height: height/6,),

            Center(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Be a one of",
                      style: TextStyle(
                        fontSize: 26,fontWeight: FontWeight.bold,
                        color: Color(0xff46919B),
                      ),
                    ),
                    const SizedBox(height: 25),
                    RichText(

                      text: const TextSpan(
                        style: TextStyle(fontSize: 30, color: Colors.black),

                        children: [
                          TextSpan(
                            text: "Volunteers ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          TextSpan(

                            text: "+ 3.5M\n",
                            style: TextStyle(color: Color(0xff358089),fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "Help Seeker ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "+ 1.5M",
                            style: TextStyle(color: Color(0xff358089),fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(height: height,text:" your email address" ,icon:const Icon(Icons.email) ,controller: emailcontroller,),
                    const SizedBox(height: 16),
                    CustomTextField(height: height,text:" your Password" ,icon:const Icon(Icons.lock) ,controller: Passwordcontroller,isPassword: true,),
                    const SizedBox(height: 16),
                    CustomTextField(height: height,text:"Confirm Password " ,icon:const Icon(Icons.lock) ,controller: ConfirmPasswordcontroller,isPassword: true,),
                    const SizedBox(height: 36),

                    ElevatedButton(

                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(

                        backgroundColor: const Color(0xffADE0EB),
                        fixedSize: const Size(220, 45),

                        shadowColor: Colors.black,
                        elevation: 8,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),

                        ),
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 26, color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),

                        InkWell(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=>loginScreen()));
                        },child: const Text("Login",style: TextStyle(color: Color(0xff3D7279)),)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
