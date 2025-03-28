class Support {
  final String url;
  final String text;

  Support({required this.url, required this.text});

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json['url'],
        text: json['text'],
      );
}
