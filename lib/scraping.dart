import 'package:chaleno/chaleno.dart';

Future<List<String>> scrape(String word)
async {
  final url = 'https://www.rhymezone.com/r/rhyme.cgi?Word=${word}&typeofrhyme=perfect&org1=syl&org2=l&org3=y';
  List<String> words = [];
  final chaleno = await Chaleno().load(url);
  final results = chaleno?.querySelectorAll('b>a.r');
  results?.forEach((result) {words.add(notNull(result.text!));});
  return words;
}

String notNull(String maybeNull){
  if (maybeNull == null) return "";
  else return maybeNull!!;
}
