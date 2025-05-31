void main() {
  Map<String, int> map = {"Ahmed": 50, "Helmy": 100};

  map.forEach((key, value) => print(value)); // print item item

  print(map.values); //print iterable

  for (int i = 0; i < map.length; i++) {
    List keys = map.keys.toList();
    print(keys[0]); // print item item
  }
}
