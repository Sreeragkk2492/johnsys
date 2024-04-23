// To parse this JSON data, do
//
//     final johnsys = johnsysFromJson(jsonString);

import 'dart:convert';

List<Johnsys> johnsysFromJson(String str) => List<Johnsys>.from(json.decode(str).map((x) => Johnsys.fromJson(x)));

String johnsysToJson(List<Johnsys> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Johnsys {
    int? itemId;
    String? itemName;
    int? discRate;
    int? mrp;
    int? total;
    String? imgUrl;
    int count;
   

    Johnsys({
        this.itemId,
        this.itemName,
        this.discRate,
        this.mrp,
        this.total,
        this.imgUrl,
        this.count=0,
       
    });

    factory Johnsys.fromJson(Map<String, dynamic> json) => Johnsys(
        itemId: json["ItemID"],
        itemName: json["ItemName"],
        discRate: json["DiscRate"],
        mrp: json["MRP"],
        total: json["Total"],
        imgUrl: json["ImgUrl"],
        count: json['count']??0,    
    );

    Map<String, dynamic> toJson() => {
        "ItemID": itemId,
        "ItemName": itemName,
        "DiscRate": discRate,
        "MRP": mrp,
        "Total": total,
        "ImgUrl": imgUrl,
        'count':count
    };
}

