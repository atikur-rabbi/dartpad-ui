import 'package:flutter/material.dart';

var nameroute = {
 '/': (context) => MainScreen(),
 '/pass': (context) => PassArgumentsScreen(title: "Pass", message: "Message",),
};

void main() => runApp(Routes());

class Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      title: 'Named Routing',
    //  onGenerateRoute: generateRoute
      initialRoute: '/',
      routes:nameroute
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
          ListitemUi(itemText: "Pass", itemicon: Icon(Icons.ac_unit), itemTap: ()=>{ Navigator.pushNamed(context, '/pass') }),
          ListitemUi(itemText: "Tap", itemicon: Icon(Icons.ac_unit), itemTap: listTap),
          ListitemUi(itemText: "Tesr Another", itemicon: Icon(Icons.ac_unit), itemTap: ()=>{ tapPrint("Test Another") }),
      ])),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  final String title;
  final String message;
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class ListitemUi extends StatelessWidget {
  final String itemText;
  final Icon itemicon;
  final void Function() itemTap;
  

  const ListitemUi({
    Key key,
    @required this.itemText,
    this.itemicon,
    this.itemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(itemText),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(itemText),
          trailing: itemicon,
          onTap: itemTap,
        ),
      ),
    );
  }
}

void listTap() {
  print("Tap");
}

void tapPrint(String data) {
  print(data);
}
