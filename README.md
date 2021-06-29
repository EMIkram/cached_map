# cached_map
 A Flutter plugin for Caching Json/Map<String,dynamic> to your App's temporary directory.
## Getting Started

 ///code example of how to use




    import the package
    import 'package:cached_map/cached_map.dart';
    
    
    
    
    //you can either use it with static methods 
 
    await Mapped.saveFileDirectly(file:
    {
      "user name":"user",
      "email":"user@gmail.com"
    },
        cachedFileName: "user");
    
    Map<String, dynamic>? user = await Mapped.loadFileDirectly(cachedFileName: "user");
    print(user);
    Mapped.deleteFileDirectly(cachedFileName: "user");
    
    
    ///------------------------OR--------------------------
    
    
    
    
    
    
    //you can use it by creating object of Mapped class
    
    
     ///instantiate it in initState
      getMapInstance();
     
     
     getMapInstance()async{
        Mapped mapped = await Mapped.getInstance();
        }
        ///save a file
           mapped.saveFile(file:
            {
              "name":"test",
              "email":"email"
            },
                cachedFileName: "user");
        ///load file
        Map<String,dynamic>? user = mapped.loadFile(cachedFileName:"user");
        ///delete file
        mapped.deleteFile(cachedFileName: "user");
        
        
    
    
    
    