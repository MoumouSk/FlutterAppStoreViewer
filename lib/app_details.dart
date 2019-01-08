import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'top_apps_json_parser.dart';

class AppDetails extends StatelessWidget {
  final Entry app;

  AppDetails({Key key, @required this.app}) : super(key: key);

  Widget titleRow() {
    return Container(
      padding: EdgeInsets.all(10.00),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.black,
            offset: new Offset(0.00, 1.00),
            blurRadius: 5.00,
          )
        ],
      ),
      child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 13.00),
              child: Column(children: <Widget>[
                Image.network(app.imImage[1].label),
              ]),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(app.imName.label, overflow: TextOverflow.clip),
                    //FlatButton(onPressed: _launchURL,
                    //padding: EdgeInsets.all(00.00),
                    //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //color: Colors.red,
                    //child:
                    InkWell(
                      onTap: () {
                        print('couilles');
                        //_launchURL(app.imArtist.attributes.href);
                      },
                      child: Text(app.imArtist.label,
                          style: TextStyle(color: Colors.blueAccent)),
                    ),
                    Text(app.imPrice.label),
                  ]),
            ),
            Column(children: <Widget>[
              RaisedButton(
                onPressed: _launchURL,
                child: Text('VOIR'),
              )
            ]),
          ]),
    );
  }

  Widget summary() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.all(15.00),
      child: Text(app.summary.label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: <Widget>[
            titleRow(),
            summary(),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    String url = app.imArtist.attributes.href;
    debugPrint(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
