import 'package:http/http.dart' as http;
import 'dart:convert';

import 'top_apps_json_parser.dart';

Future<TopApps> fetch(int multiplier) async {
  final response = await http.get(
      'https://itunes.apple.com/fr/rss/toppaidapplications/limit=${50 * multiplier}/json');
  return TopApps.fromJson(json.decode(response.body));
}
