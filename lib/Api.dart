import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_project/model/Video.dart';

const YOUTUBE_API_KEY = "AIzaSyCnYVaOXJcIj7FONAwfMiCV2kQAUbyOYOE";
const CHANNEL_ID = "UCKy4Q7H-Dcn6vm5-7XELajw";
const BASE_URL = "https://www.googleapis.com/youtube/v3";

class Api {

  Future< List<Video> > search(String label) async {
    http.Response response = await http.get(
      BASE_URL + "/search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$YOUTUBE_API_KEY"
      "&channelId=$CHANNEL_ID"
      "&q=$label"
    );
    if (response.statusCode == 200){
      Map<String,dynamic> jsonData = json.decode(response.body);

      List<Video> videos = jsonData["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();

      // for (var vid in videos){
      //   print(vid.id);
      //   print(vid.channel);
      //   print(vid.title);
      //   print(vid.description);
      //   print(vid.thumbnail);
      // }

      return videos;

    } else {
      print(response.statusCode);
    }
  }
}
