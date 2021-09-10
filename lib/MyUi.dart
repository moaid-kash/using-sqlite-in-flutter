
import 'package:back/AddEditUI.dart';
import 'package:back/User.dart';
import 'package:back/UserAPI.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget { @override
State<StatefulWidget> createState() {
// TODO: implement createState
  return new _MyList();
}
}

class _MyList extends State<MyListView> {
  List Users = new List();

  @override
  void initState() {
    super.initState();
    UserAPI.GetAllUser().then((usrs) {
      setState(() {
        usrs.forEach((usr) {
          Users.add(usr);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Scaffold(
        floatingActionButton: new FloatingActionButton(
            onPressed: () => _NavigateToAdd(context),
            child: new Icon(Icons.add),
            backgroundColor: Colors.blue),
        appBar: new AppBar(
          iconTheme: new IconThemeData(color: Colors.green,
          ),
          title: new Text('AppBar Title'), backgroundColor: Colors.greenAccent,
        ),
        body: new Column(children: <Widget>[
          new TextField(
              decoration: new InputDecoration(hintText:
              "Search")),
          new Expanded(
              child: new ListView.builder(itemCount: Users.length,
                  itemBuilder: (BuildContext context, int
                  position) {
                    return new Card(
                        color: Colors.white,
                        child: new ListTile(title: new Text(

                            "${Users[position]["Username"]}"),
                            subtitle:
                            new Text("Id:${Users[position]["Id"]}"),
                            trailing: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new IconButton(onPressed: () {
                                  _NavigateToEdit(context,
                                      position);
                                },
                                    icon: new Icon(Icons.edit, color:
                                    Colors.lightBlue)),
                                new IconButton(onPressed: () =>
                                    _deleteUser(context,
                                        position),
                                    icon: new Icon(Icons.delete, color:
                                    Colors.redAccent)),
                              ],
                            )));
                  }))
        ],
        )
    )
    );
  }

  void _NavigateToEdit(BuildContext context, int position) async {
    String result = await Navigator.push(
        context, MaterialPageRoute(
        builder: (context) =>
            AddEditUI("Edit", new User(Users[position]["Id"],Users[position]["Username"], Users[position]["Password"]))));
    RefreshList();
  }

  void _NavigateToAdd(BuildContext context) async {
    String result = await Navigator.push(
        context, MaterialPageRoute(
      builder: (context) => AddEditUI("Add", new User(0, "",""))));
    RefreshList();
  }

  void RefreshList() {
    Users.clear();
    UserAPI.GetAllUser().then((usrs) {
      setState(() {
        usrs.forEach((usr) {
          Users.add(usr);
        });
      });
    });
  }

  void _deleteUser(BuildContext context, int position) {
    UserAPI.DeleteUser(Users[position]["Id"]);
    setState(() {
      Users.removeAt(position);
    });
  }

  void AddUser(BuildContext context, int position) {
    UserAPI.DeleteUser(Users[position]["Id"]);
    setState(() {
      Users.removeAt(position);
    });
  }

  void EditUser(BuildContext context, int position) {
    UserAPI.DeleteUser(Users[position]["Id"]);
    setState(() {
      Users.removeAt(position);
    });
  }

}


