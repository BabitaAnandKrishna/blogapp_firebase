class Data{
  String title;
  String  desc;
  String  imgUrl;

  Data({this.title,this.desc,this.imgUrl});

  Data.fromJson(Map<String, dynamic> json) {

    title = json['title'];
    desc = json['description'];
    imgUrl = json['Image'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.desc;
    data['Image'] = this.imgUrl;
  }
}
