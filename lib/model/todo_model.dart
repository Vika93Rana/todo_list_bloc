class ToDO {
  final String name;
  final DateTime createdAt;

  ToDO({required this.name, required this.createdAt});

  @override
  String toString() {
    return 'ToDO{name: $name, createdAt: $createdAt}';
  }
}
