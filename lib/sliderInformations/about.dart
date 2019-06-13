import 'package:flutter/material.dart';
import 'package:lynight/widgets/slider.dart';
import 'package:lynight/authentification/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatefulWidget {
  About({this.onSignOut});

  final VoidCallback onSignOut;
  final BaseAuth auth = new Auth();

  void _signOut() async {
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

  Widget nous() {
    return Container(
      child: ListTile(
        title: Text(
          'Nous',
          style: TextStyle(fontSize: 30, color: Theme
              .of(context)
              .primaryColor, height: 1.2),
        ),
        subtitle: Text(
            ' \nBloon est une application mobile qui répertorie les boîtes de nuit à Paris.'
                + ' Des boîtes de nuit seront recommandées selon votre profil personnalisé,'
                + ' de plus, Bloon vous permet de réserver une place d\'entrée '
                + ''
        ,style: TextStyle(color: Colors.black,height: 1.2),textAlign: TextAlign.justify,),
      ),
    );
  }

  Widget confidentiality() {
    return Container(
      child: ListTile(
        title: Text(
          'Confidentialité',
          style: TextStyle(fontSize: 30, color: Theme
              .of(context)
              .primaryColor, height: 1.2),
        ),
        subtitle: Text(
            ' \nLes données que vous renseignez sont collectées dans une base de données: nom, prénom, adresse mail, numéro de téléphone, style de musique, date de naissance.'
            +'\n'+'Nous ne collectons aucune informations sur votre géolocalisation'
                + '\n' + 'L’application accède à votre stockage afin de modifié votre photo de profile.'
                + '\n' + 'Compte pro : Le scanner de QR Code ne récolte aucune données de la caméra.',
          style: TextStyle(color: Colors.black,height: 1.2,),textAlign: TextAlign.justify,
        ),
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
          style: TextStyle(fontSize: 30, color: Theme
              .of(context)
              .primaryColor),
        ),
        iconTheme: IconThemeData(color: Theme
            .of(context)
            .primaryColor),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          nous(),
          Divider(),
          confidentiality(),
        ],
      ),
      drawer: CustomSlider(
        userMail: userMail,
        signOut: widget._signOut,
        activePage: '/about',
      ),
    );
  }
}
