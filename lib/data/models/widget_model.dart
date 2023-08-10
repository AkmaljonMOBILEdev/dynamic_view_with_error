class WidgetModel {
  final String title;
  final num sort;
  final String group;
  final double width;
  final double height;
  final String color;
  final String type;

  WidgetModel({
    required this.title,
    required this.sort,
    required this.group,
    required this.width,
    required this.height,
    required this.color,
    required this.type,
  });

  factory WidgetModel.fromJson(Map<String, dynamic> json) {
    return WidgetModel(
      title: json["title"] ?? "",
      sort: json["sort"] ?? 0,
      group: json["group"] ?? "",
      width: json["width"] ?? 0,
      height: json["height"] ?? 0,
      color: json["color"] ?? "",
      type: json["type"] ?? "",
    );
  }
}
