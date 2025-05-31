void main() {
  //?  ------  mylist.map vs mylist.forEach vs for(var e in list)
  //? it's perferable to use mylist.forEach only in dictionary because for(var e in list) do the same and powerfull
  //?  -----interviw ----------
  //?  .map  >> loaping and return iterable List  || .forEach loaping only like for(){}
  List<String> list = ["AHmed", "Mohamed", "helmy"];
  // List<String> lowerList =  list.forEach((name) => name.toLowerCase());   // that's wrong because forEach doesn't have return
  // for (var name in list) {
  //   String lowerName = name.toLowerCase();
  //   print(lowerName);
  // }

  var newList = list.map(
    (item) => item[0].toUpperCase() + item.substring(1).toLowerCase(),
  );
  print(newList);
  print(newList.runtimeType);
  var nnList = newList.toList();
  print(nnList);
  print(nnList.runtimeType);
  print(nnList.asMap());
  nnList.add("Elyamany"); //it's correct

  //?  ------ fille & generated ---------------

  List a = List.filled(
    5,
    "a",
  ); //grawable >> false  >> fixed list >> save memory
  print(a);
  // a.add("b");  //it's worng because filled return ungrawable list
  List b = List.filled(5, "b", growable: true);
  b.add("a");
  print(b);

  // ? ------------------   interView   --------------
  // ? ---   List.filled vs List.generate
  // ? ---   list.genrate return index and I can use it  &&   growable
  // ? ---   list.filled not return index  &&   non-growable

  List c = List.generate(5, (index) => '$index- a');
  c.add(1);
  print(c);
  print(c.runtimeType);

  //?------------reduce --------------
  List<int> numbers = [1, 2, 3, 4];
  print(numbers.reduce((a, b) => a + b));

  //? -- .where
  List evens = numbers.where((num) => num % 2 == 0).toList();
  print(evens);

  //? ------------- cascade notation ------------------
  //numbers.add(2);   >> no cascade
  //List numbers2 = numbers; >> no cascade
  List numbers2 = numbers..add(2);
  print(numbers2);

  //?  ------- set ------
  Set<String> set = {"Ahmed", "Ahmed", "Helmy"}; // >> return to me unique set
  Set<String> set2 = {"Helmy"};
  print(
    set2.intersection(set),
  ); // I can also use set functions like intersection, union, ......
}
