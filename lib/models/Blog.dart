
class Blog {
  final String? id;
  final String? title;
  final String? image;
  bool?isliked;

  Blog({required this.id, required this.title, required this.image,this.isliked});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      image: json['image_url'],
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      // ... other properties ...
    };
  }
}