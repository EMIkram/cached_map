import 'package:flutter_test/flutter_test.dart';

import 'package:cached_map/cached_map.dart';

Future<void> main() async {


await Mapped.saveFileDirectly(file:
{
  "user name":"user",
  "email":"user@gmail.com"
},
    cachedFileName: "user");

Map<String, dynamic>? user = await Mapped.loadFileDirectly(cachedFileName: "user");
print(user);
Mapped.deleteFileDirectly(cachedFileName: "user");


}
