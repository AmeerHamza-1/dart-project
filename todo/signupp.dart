import 'dart:io';

// void login() {
//   stdout.write('Enter username: ');
//   String? username = stdin.readLineSync();
//   stdout.write('Enter password: ');
//   String? password = stdin.readLineSync();

//   if (username == 'admin' && password == 'admin') {
//     print('Login successful.');
//   } else {
//     print('Invalid username or password.');
//     // exit(0);
//     login();
//   }
// }

String userfilepath = "users.txt";
void signup(String username, String Password) {
  File file = File(userfilepath);
  List<String> lines;
  if (file.existsSync()) {
    lines = file.readAsLinesSync();
  } else {
    lines = [];
  }
  for (var line in lines) {
    var users = line.split(":");
    if (users[0] == username) {
      print("Username Already exist");
      return;
    }
  }

  file.writeAsStringSync("$username:$Password\n", mode: FileMode.append);
  print("Signup Successful.");
}

bool Login(String username, String Password) {
  File file = File("users.txt");
  if (!file.existsSync()) {
    print("No user exist");
    return false;
  }

  var lines = file.readAsLinesSync();
  for (var line in lines) {
    var users = line.split(":");
    if (users[0] == username && users[1] == Password) {
      print("Login Successful");
      return true;
    }
  }
  print("Invalid username or password.");
  return false;
}
