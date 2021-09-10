
import 'package:back/User.dart';
import 'package:back/UserAPI.dart';
import 'package:flutter/material.dart';

class AddEditUI extends StatefulWidget { User user;
String command; AddEditUI(this.command, this.user); @override
State<StatefulWidget> createState() {
// TODO: implement createState
  return new _AddEditUI(command, user);
}
}

class _AddEditUI extends State<AddEditUI> {
  User user;
  String command;

  _AddEditUI(this.command, this.user);

  final _txtUsername = new TextEditingController();
  final _txtPassword = new TextEditingController();

  @override
  void initState() {
    super.initState();

    if (command == "Edit") {
      setState(() {
        _txtUsername.text = user.getUsername();
        _txtPassword.text = user.getPassword();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Scaffold(
      appBar: new AppBar(
        title: new Text(command), backgroundColor: Colors.greenAccent,
      ),
      body: new Center(child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
        ),
        new Text("Username:", style: TextStyle(
          fontSize: 25,
        ),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.all(5),
        ),
        new TextField(
          controller: _txtUsername,
          decoration: new InputDecoration(hintText: "Username"),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Padding(
          padding: EdgeInsets.all(5),
        ),
        Padding(
          padding: EdgeInsets.all(5),
        ),
        new Text("Password:", style: TextStyle(
          fontSize: 25,
        ),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: EdgeInsets.all(5),
        ),
        new TextField(
          controller: _txtPassword,
          decoration: new InputDecoration(hintText: "Password"),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        Padding(
          padding: EdgeInsets.all(5),
        ),
        new RaisedButton(
          onPressed: () => AddOrEdit(),
          child: new Text(command),
          color: Colors.greenAccent,
        )
      ],
      ),
      ),
    ));
  }



void AddOrEdit() {
  if (_txtUsername.text.length > 0 && _txtPassword.text.length > 0) {
    if (command == "Add") {
      UserAPI.AddUser(new User(0, _txtUsername.text,
          _txtPassword.text));
    } else { UserAPI.EditUser(
        new User(user.getId(), _txtUsername.text,
            _txtPassword.text));
    }
    Navigator.pop(context);
  }
}
}





