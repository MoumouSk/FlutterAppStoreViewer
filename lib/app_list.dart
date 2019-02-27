import 'package:flutter/material.dart';

import 'network_services.dart';
import 'top_apps_json_parser.dart';
import 'app_details.dart';
import 'database.dart';

class AppList extends StatefulWidget {
  @override
  AppListState createState() => AppListState();
}

class AppListState extends State<AppList> {
  List<TopApps> data;
  List<Entry> apps;

  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  int multiplier = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          multiplier < 4) {
        _fetchMoreData();
        multiplier += 1;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _fetchMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      await fetch(multiplier);
      for (var i = 0; i < apps.length; i++) {
        apps[i].dbId = i;
        DBProvider.db.newEntry(apps[i]);
      }
      setState(() {
        isPerformingRequest = false;
      });
    }
  }

  Widget appList() {
    return FutureBuilder(
      future: fetch(multiplier),
      builder: (context, AsyncSnapshot<TopApps> snapshot) {
        if (!snapshot.hasData) return new Container();
        apps = snapshot.data.feed.entry;
        for (var i = 0; i < apps.length; i++) {
          apps[i].dbId = i + 1;
          DBProvider.db.newEntry(apps[i]);
        }
        //DBProvider.db.deleteAll();
        //DBProvider.db.printDb();
        //DBProvider.db.dropAllDb();
        return new ListView.builder(
          controller: _scrollController,
          itemCount: apps.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppDetails(app: apps[index]),
                      fullscreenDialog: true),
                );
              },
              child: Container(
                padding: EdgeInsets.all(5.00),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      offset: new Offset(0.00, 1.00),
                      blurRadius: 2.00,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 10.00),
                      child: Column(
                        children: <Widget>[
                          Image.network('${apps[index].imImage[0].label}'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${apps[index].imName.label}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          Text('${apps[index].summary.label}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: Colors.blueGrey))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return appList();
  }
}
