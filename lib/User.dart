class User { int _Id;
String _Username; String _Password;
User(this._Id, this._Username, this._Password);

int getId() => _Id;
set Id(id) => _Id = id;

String getUsername() {
  return _Username;
}

setUsername(String username) {
  _Username = username;
}

String getPassword() {
  return _Password;
}

setPassword(String password) {
  _Password = password;
}
}
