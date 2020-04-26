class Video{

  String id;
  String title;
  String description;
  String thumbnail;
  String channel;

  //Constructor
  Video({this.id, this.title, this.description, this.thumbnail, this.channel});

  // static converterJson(Map<String,dynamic> json){
  //   return Video(
  //     id: json["id"]["videoId"],
  //     title: json["snippet"]["title"],
  //     description: json["snippet"]["description"],
  //     thumbnail: json["snippet"]["thumbnails"]["high"]["url"],
  //     channel: json["snippet"]["channelId"],
  //   );
  // }

  // Retorno de um único objeto, economiza memória
  factory Video.fromJson(Map<String,dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      description: json["snippet"]["description"],
      thumbnail: json["snippet"]["thumbnails"]["high"]["url"],
      channel: json["snippet"]["channelId"],
    );
  }
}