import 'package:flutter/material.dart';
import 'package:youtube_project/Api.dart';
import 'package:youtube_project/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Initial extends StatefulWidget {

  String searchLabel;
  Initial(this.searchLabel);

  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {

  _listVideos(String label){
    Api api = Api();
  
    return api.search(label);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder< List<Video> >(
      future: _listVideos(widget.searchLabel),
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            
            break;
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator()
            );
            break;
          case ConnectionState.active:
            
            break;
          case ConnectionState.done:
            if (snapshot.hasData){
              return ListView.separated(
                itemBuilder: (context,index){
                  List<Video> videos = snapshot.data;
                  Video video = videos[index];
                  print(snapshot.data.length);
                  return GestureDetector(
                    onTap: (){
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: YOUTUBE_API_KEY, 
                        videoId: video.id,
                        autoPlay: true,
                        fullScreen: true,
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.thumbnail)
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(video.title),
                          subtitle: Text(video.description),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index)=>Divider(
                  height:3,
                  color: Colors.red
                ), 
                itemCount: snapshot.data.length
              );
            } else {
              return Center(
                child: Text("Não há dados a serem exibidos"),
              );
            }
            break;
          default:
        }
      }
    );
  }
}