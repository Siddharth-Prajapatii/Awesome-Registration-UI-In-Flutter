import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'signup.dart';

void main(){
  runApp(new myapp());
}

// ignore: camel_case_types
class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title:"EzVote",
        debugShowCheckedModeBanner: false,
        home:MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formkey=GlobalKey<FormState>();

  String email;
  String pw;

  bool passwordVisible=false;
  bool obscuretextval=true;

  String validateEmail(value){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    }
    else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }
    else{
      return null;
    }
  }

  String validatePW(value){
    String pattern = r'^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})';
    RegExp regExp = new RegExp(pattern);
    if(value.length == 0){
      return "Password Is Required";
    }
    else if(!regExp.hasMatch(value)){
      return "Invalid Password";
    }

    else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.purple[50],
        body: LayoutBuilder(
          // ignore: missing_return
          builder:(BuildContext context, BoxConstraints constraints){
            // ignore: missing_return
            if(constraints.maxHeight>685){
              return LargeMobile();
            }
            else{
              return SmallMobile();
            };
          }
        )
    );
  }

  Widget LargeMobile(){
    return Form(
        key: _formkey,
        child:Column(
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                //----------LOGO------------------------------------------------

                Padding(
                  padding: EdgeInsets.only(top: 40.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/Logo.png",height: 120,),
                  ),
                ),

                //--------------------------------------------------------------


                //------------Login Box-----------------------------------------
                Padding(

                  padding: EdgeInsets.fromLTRB(20.00, 37.00, 20.00, 0.00),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0),
                        ]),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.fromLTRB(10,5,10,0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Login",style: TextStyle(
                                  color: Colors.deepPurple[400],
                                  fontSize: 38,
                                  fontWeight: FontWeight.w800,
                                  fontFamily:"Pacifico" ),
                              ),
                            )
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(10,10,10,0),
                          child: Text("Email",style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Poppins"
                          ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(10,0,10,0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Email",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple,width: 2.5),
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,fontSize: 14,
                                ),
                            ),
                              validator: (value)=>validateEmail(value),
                              onSaved: (String val){email = val;}
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(10,10,10,0),
                          child: Text("Password",style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Poppins"
                          ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(10,0,10,0),
                          child: TextFormField(
                            obscureText: obscuretextval,
                            decoration: InputDecoration(
                                hintText: "Password",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple,width: 2.5),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color:Colors.purple /*Theme.of(context).primaryColorDark*/,
                                  ),
                                  onPressed: () {

                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                      obscuretextval=!obscuretextval;
                                    });
                                  },
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,fontSize: 14,
                                )
                            ),
                            validator: (value)=>validatePW(value),
                            onSaved: (value)=>{pw=value,},
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.fromLTRB(10,25,10,30),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              child: Text("New User",
                                style: TextStyle(
                                    color: Colors.blue[300],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: "Poppins"
                                ),
                              ),

                              //----------New User----------------------

                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> signup() ),
                                );
                              },
                            ),
                          ),
                        ),

                        //--------------------------------------------------------------


                      ],
                    ),
                  ),
                ),

                //-------------------------Signin-------------------------------

                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.00, 35.00, 20.00, 0.00),

                      //--------------Gradient SIGN IN Button-------------------
                      child: InkWell(
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          child:Align(alignment:Alignment.center,child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.purple[300],
                                  Colors.blue[400],
                                ]
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),

                        //------------Sign In Method-----------------------

                        onTap: ()=>{
                          if(_formkey.currentState.validate()){
                            _formkey.currentState.save(),
                            print("Email $email"),
                            print("Pw $pw"),
                          }
                        },

                      ),
                    )
                  ],
                ),

                //--------------------------------------------------------------



                //----------------Social Login Text-----------------------------

                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(28.00,40.00, 20.00,0.00),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 1,
                            color: Colors.black26.withOpacity(.2),
                          ),

                          Text("        Social Login        ",style: TextStyle(fontSize: 16,fontFamily: "Poppins")),

                          Container(
                            width: 40,
                            height: 1,
                            color: Colors.black26.withOpacity(.2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),


                //--------------------------------------------------------------



                //------------------Google Sign In------------------------------

                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(28.00,15.00, 20.00,0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10000.00,),
                        child: InkWell(

                          //------------Google Sign In Method----------------------

                          onTap: (){
                          },
                          child:Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.purple[50],
                                      Colors.purple[50],
                                    ]
                                )
                            ),
                            child: Row(
                              children: <Widget>[
                                Align(alignment:Alignment.centerLeft,child: Padding(padding: EdgeInsets.fromLTRB(0,0,0,0),child: Image.asset("assets/images/icon_google.png",width: 40,),),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )



              ],
            ),
          ],
        ),

    );
  }

  Widget SmallMobile(){
    return Form(
      key: _formkey,
      child:Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              //----------LOGO------------------------------------------------

              Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/Logo.png",height: 120,),
                ),
              ),

              //--------------------------------------------------------------


              //------------Login Box-----------------------------------------
              Padding(

                padding: EdgeInsets.fromLTRB(20.00, 15.00, 20.00, 0.00),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0),
                            blurRadius: 15.0),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, -10.0),
                            blurRadius: 10.0),
                      ]),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(10,5,10,0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Login",style: TextStyle(
                                color: Colors.deepPurple[400],
                                fontSize: 38,
                                fontWeight: FontWeight.w800,
                                fontFamily:"Pacifico" ),
                            ),
                          )
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10,10,10,0),
                        child: Text("Email",style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins"
                        ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10,0,10,0),
                        child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple,width: 2.5),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,fontSize: 14,
                              ),
                            ),
                            validator: (value)=>validateEmail(value),
                            onSaved: (String val){email = val;}
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10,20,10,0),
                        child: Text("Password",style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins"
                        ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10,0,10,0),
                        child: TextFormField(
                          obscureText: obscuretextval,
                          decoration: InputDecoration(
                              hintText: "Password",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple,width: 2.5),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color:Colors.purple /*Theme.of(context).primaryColorDark*/,
                                ),
                                onPressed: () {

                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                    obscuretextval=!obscuretextval;
                                  });
                                },
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,fontSize: 14,
                              )
                          ),
                          validator: (value)=>validatePW(value),
                          onSaved: (value)=>{pw=value,},
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10,15,10,30),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: Text("New User",
                              style: TextStyle(
                                  color: Colors.blue[300],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: "Poppins"
                              ),
                            ),

                            //----------New User----------------------

                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> signup() ),
                              );
                            },
                          ),
                        ),
                      ),

                      //--------------------------------------------------------------


                    ],
                  ),
                ),
              ),

              //-------------------------Signin-------------------------------

              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.00, 25.00, 20.00, 0.00),

                    //--------------Gradient SIGN IN Button-------------------
                    child: InkWell(
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        child:Align(alignment:Alignment.center,child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.purple[300],
                                Colors.blue[400],
                              ]
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),

                      //------------Sign In Method-----------------------

                      onTap: ()=>{
                        if(_formkey.currentState.validate()){
                          _formkey.currentState.save(),
                          print("Email $email"),
                          print("Pw $pw"),
                        }
                      },

                    ),
                  )
                ],
              ),

              //--------------------------------------------------------------



              //----------------Social Login Text-----------------------------

              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(28.00,25.00, 20.00,0.00),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 1,
                          color: Colors.black26.withOpacity(.2),
                        ),

                        Text("        Social Login        ",style: TextStyle(fontSize: 16,fontFamily: "Poppins")),

                        Container(
                          width: 40,
                          height: 1,
                          color: Colors.black26.withOpacity(.2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),


              //--------------------------------------------------------------



              //------------------Google Sign In------------------------------

              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(28.00,10.00, 20.00,0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.00,),
                      child: InkWell(

                        //------------Google Sign In Method----------------------

                        onTap: (){
                        },
                        child:Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.purple[50],
                                    Colors.purple[50],
                                  ]
                              )
                          ),
                          child: Row(
                            children: <Widget>[
                              Align(alignment:Alignment.centerLeft,child: Padding(padding: EdgeInsets.fromLTRB(0,0,0,0),child: Image.asset("assets/images/icon_google.png",width: 40,),),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )



            ],
          ),
        ],
      ),

    );
  }
}