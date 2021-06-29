library cached_map;

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class Mapped {
  static var tempDirectory;

  ///Loads json file from cache(temp directory) with with given name
  static  Future<String> saveFileDirectly({
    required Map<String, dynamic> file,
    required String cachedFileName
  }) async{
    File jsonFile;
    var tempDir = await getApplicationDocumentsDirectory();
    String _filePath = tempDir.path + '/$cachedFileName.json';
    jsonFile = new File(_filePath);
    jsonFile.writeAsStringSync(json.encode(file));
    return "Done";
  }


  ///loads json cached file with a name
  static  Future<Map<String, dynamic>?> loadFileDirectly({required String cachedFileName}) async {
    File jsonFile;
    Map<String, dynamic>? _file;
    var tempDir = await getApplicationDocumentsDirectory();
    String _filePath = tempDir.path + '/$cachedFileName.json';

    jsonFile = new File(_filePath);

    if (jsonFile.existsSync()) {
      _file = json.decode(jsonFile.readAsStringSync());
      return _file;
    }
  }
  /// deletes the created file
  static  Future<String> deleteFileDirectly({required String cachedFileName}) async{
    File jsonFile;
    var tempDir = await getApplicationDocumentsDirectory();
    String _filePath = tempDir.path + '/$cachedFileName.json';
    jsonFile = new File(_filePath);
    jsonFile.delete();
    return "Deleted";
  }



  /// now that all basic functionality is done ..but we still need some optimization and we can see that
  /// our static functions are async and due to that reason it would be hard to load data quickly while calling them



  ///Future method for App document local directory
  ///create object and set temporary directory once and than u can read/write or delete file without using Future
  Future setTempDirectory() async{
    var tempDir = await getApplicationDocumentsDirectory();
    tempDirectory = tempDir;
  }


  ///Once instantiated, Than this return object can be used to quickly store and load data
  static Future<Mapped> getInstance() async{
    Mapped mapped = Mapped();
    await mapped.setTempDirectory();
    return mapped;
  }

  ///save json file in cache(temp directory) with with given name using instance member
  bool saveFile({
    required Map<String, dynamic> file,
    required String cachedFileName})

  {
    File jsonFile;
    String _filePath = tempDirectory.path + '/$cachedFileName.json';
    jsonFile = new File(_filePath);
    jsonFile.writeAsStringSync(json.encode(file));
    return true;
  }

  ///loads json cached file with a name
  Map<String, dynamic>? loadFile({required String cachedFileName}){
    File jsonFile;
    Map<String, dynamic>? _file;
    String _filePath = tempDirectory.path + '/$cachedFileName.json';
    jsonFile = new File(_filePath);

    if (jsonFile.existsSync()) {
      _file = json.decode(jsonFile.readAsStringSync());
      return _file;
    }
  }


  /// deletes the created file
  bool deleteFile({required String cachedFileName}) {
    File jsonFile;
    String _filePath = tempDirectory.path + '/$cachedFileName.json';
    jsonFile = new File(_filePath);
    // jsonFile.writeAsStringSync(json.encode({}));
    jsonFile.delete();
    return true;
  }
}



///code example of how to use
///
///
/// CacheJson cacheJson =await CacheJson.getInstance();
///     cacheJson.setFile(file: {}, cachedFileName: "user");
///     user = cacheJson.getFile(cachedFileName: "user");
///     cacheJson.removeFile(cachedFileName: "user");
///
///     // or using static methods
///     CacheJson.saveFile(file: {}, cachedFileName: "user");
///     CacheJson.loadFile(cachedFileName: "user");
///     CacheJson.deleteFile();
