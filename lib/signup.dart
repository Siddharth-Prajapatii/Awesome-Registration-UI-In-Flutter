import 'package:flutter/material.dart';
import 'package:myapp/main.dart';


// ignore: camel_case_types
class signup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:"Sign Up",
      debugShowCheckedModeBanner: false,
      home:Mysignup(title: 'Flutter Demo Home Page'),
    );
  }
}



class Mysignup extends StatefulWidget {
  Mysignup({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MysignupState createState() => _MysignupState();
}



class _MysignupState extends State<Mysignup> {

  final pwController = new TextEditingController();
  final cpwController = new TextEditingController();
  String currentPW;
  String currentCPW;

  void initState() {
    super.initState();

    // Start listening to changes.
    pwController.addListener(_saveLatestPWValue);
    cpwController.addListener(_saveLatestCPWValue);
  }

  _saveLatestPWValue(){currentPW=pwController.text;print(currentPW);}
  _saveLatestCPWValue(){currentCPW=cpwController.text;print(currentCPW);}

  final _formkey = GlobalKey<FormState>();


  String email;
  String pw;
  String cpw;
  String name;

  bool passwordVisible=false;
  bool obscuretextval=true;

  String validateName(value){
    if (value.length==0){
      return "Name Is Required";
    }
    else if (value.length<2){
      return "Invalid Name";
    }
    else{
      return null;
    }
  }

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

  String validateCPW(value){
    String pattern = r'^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})';
    RegExp regExp = new RegExp(pattern);
    if(value.length == 0){
      return "Confirm Password Is Required";
    }

    else if(!regExp.hasMatch(value)){
      return "Invalid Confirm Password";
    }

    else if(currentPW!=currentCPW){
      return"Please Make Sure Password Match";
    }

    else {
      return null;
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue[50],
      body: LayoutBuilder(
        // ignore: missing_return
          builder:(BuildContext context, BoxConstraints constraints){
            // ignore: missing_return
            if(constraints.maxHeight>715){
              if(constraints.maxHeight>770){
                return LargeMobile();
              }
              else {
                return MediumMobile();
              }
            }
            else{
              return SmallMobile();
            }
          }
      )
    );
  }

  Widget LargeMobile(){
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20,110,20,0),
            child:Container(
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
                  ]
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                        padding: EdgeInsets.fromLTRB(10,10,10,10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Sign Up",style: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 38,
                              fontWeight: FontWeight.w800,
                              fontFamily:"Pacifico" ),
                          ),
                        )
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child: Text(
                        "Name",
                        style: TextStyle(
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
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                color: Colors.grey,fontSize: 14,
                              )
                          ),
                          validator: (value)=>validateName(value),
                          onSaved: (String val){name = val;}
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,15,10,0),
                      child: Text(
                        "Email",
                        style: TextStyle(
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
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.grey,fontSize: 14,
                              )
                          ),
                          validator: (value)=>validateEmail(value),
                          onSaved: (String val){email = val;}
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,15,10,0),
                      child: Text(
                        "Password",
                        style: TextStyle(
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
                        controller: pwController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:Theme.of(context).primaryColorDark,
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
                      padding: EdgeInsets.fromLTRB(10,15,10,0),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins"
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,0,10,40),
                      child: TextFormField(
                        obscureText: obscuretextval,
                        controller: cpwController,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:Theme.of(context).primaryColorDark,
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
                        validator: (value)=>validateCPW(value),
                        onSaved: (value)=>{cpw=value,},
                      ),
                    ),
                  ]
              ),
            ),
          ),


          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.00, 37.00, 20.00, 0.00),

                //--------------Gradient SIGN UP Button-------------------
                child: InkWell(
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    child:Align(alignment:Alignment.center,child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.blue[400],
                            Colors.green[400],
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


        ],
      ),
    );
  }

  Widget MediumMobile(){
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20,90,20,0),
            child:Container(
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
                  ]
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                        padding: EdgeInsets.fromLTRB(10,10,10,10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Sign Up",style: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 38,
                              fontWeight: FontWeight.w800,
                              fontFamily:"Pacifico" ),
                          ),
                        )
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child: Text(
                        "Name",
                        style: TextStyle(
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
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                color: Colors.grey,fontSize: 14,
                              )
                          ),
                          validator: (value)=>validateName(value),
                          onSaved: (String val){name = val;}
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,15,10,0),
                      child: Text(
                        "Email",
                        style: TextStyle(
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
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.grey,fontSize: 14,
                              )
                          ),
                          validator: (value)=>validateEmail(value),
                          onSaved: (String val){email = val;}
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,15,10,0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins"
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,5,10,0),
                      child: TextFormField(
                        obscureText: obscuretextval,
                        controller: pwController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:Theme.of(context).primaryColorDark,
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
                      padding: EdgeInsets.fromLTRB(10,15,10,0),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins"
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,5,10,40),
                      child: TextFormField(
                        obscureText: obscuretextval,
                        controller: cpwController,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:Theme.of(context).primaryColorDark,
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
                        validator: (value)=>validateCPW(value),
                        onSaved: (value)=>{cpw=value,},
                      ),
                    ),
                  ]
              ),
            ),
          ),


          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.00, 37.00, 20.00, 0.00),

                //--------------Gradient SIGN UP Button-------------------
                child: InkWell(
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    child:Align(alignment:Alignment.center,child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.blue[400],
                            Colors.green[400],
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


        ],
      ),
    );
  }

  Widget SmallMobile(){
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20,110,20,0),
            child:Container(
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
                  ]
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                        padding: EdgeInsets.fromLTRB(10,10,10,10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Sign Up",style: TextStyle(
                              color: Colors.blue[400],
                              fontSize: 38,
                              fontWeight: FontWeight.w800,
                              fontFamily:"Pacifico" ),
                          ),
                        )
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                      child: Text(
                        "Name",
                        style: TextStyle(
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
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                color: Colors.grey,fontSize: 14,
                              )
                          ),
                          validator: (value)=>validateName(value),
                          onSaved: (String val){name = val;}
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,15,10,0),
                      child: Text(
                        "Email",
                        style: TextStyle(
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
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.grey,fontSize: 14,
                              )
                          ),
                          validator: (value)=>validateEmail(value),
                          onSaved: (String val){email = val;}
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,15,10,0),
                      child: Text(
                        "Password",
                        style: TextStyle(
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
                        controller: pwController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:Theme.of(context).primaryColorDark,
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
                      padding: EdgeInsets.fromLTRB(10,15,10,0),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Poppins"
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(10,0,10,40),
                      child: TextFormField(
                        obscureText: obscuretextval,
                        controller: cpwController,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:Theme.of(context).primaryColorDark,
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
                        validator: (value)=>validateCPW(value),
                        onSaved: (value)=>{cpw=value,},
                      ),
                    ),
                  ]
              ),
            ),
          ),


          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.00, 37.00, 20.00, 0.00),

                //--------------Gradient SIGN UP Button-------------------
                child: InkWell(
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    child:Align(alignment:Alignment.center,child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.blue[400],
                            Colors.green[400],
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


        ],
      ),
    );
  }


}