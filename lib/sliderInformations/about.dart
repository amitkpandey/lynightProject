import 'package:flutter/material.dart';
import 'package:lynight/widgets/slider.dart';
import 'package:lynight/authentification/auth.dart';
class About extends StatefulWidget {

  About({this.onSignOut});
  final VoidCallback onSignOut;
  final BaseAuth auth = new Auth();

  void _signOut() async{
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AboutState();
  }
}

class _AboutState extends State<About> {
  String userMail = 'userMail';

  @override
  void initState() {
    super.initState();
    widget.auth.userEmail().then((mail) {
      setState(() {
        userMail = mail;
      });
    });
  }

  Widget nous(){
    return ListTile(
      title: Text('Nous',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 25),),
      subtitle: Text(
        'bonjour'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'À propos',
          style: TextStyle(fontSize: 30, color: Theme.of(context).primaryColor),
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
      ),
      body: nous(),
      drawer: CustomSlider(
        userMail: userMail,
        signOut: widget._signOut,
        activePage: '/about',
      ),
    );
  }
}
