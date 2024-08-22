
class Blog {
  final String? id;
  final String? title;
  final String? image;

  Blog({required this.id, required this.title, required this.image});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      image: json['image_url'],
    );
  }
}