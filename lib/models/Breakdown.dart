import 'dart:convert';
List<Breakdown> breakdownFromJson(String str) => List<Breakdown>.from(json.decode(str).map((x) => Breakdown.fromJson(x)));
String breakdownToJson(List<Breakdown> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Breakdown {
  Breakdown({
    required this.id,
    required this.channelId,
    required this.channelName,
    required this.dataMonth,
    required this.liftingTarget,
    required this.billed,
    required this.delivered,
    required this.primaryCollection,
    required this.imsTarget,
    required this.ims,
    required this.marketCollection,
    required this.memoTarget,
    required this.memoQty,
    required this.pgTarget,
    required this.pgCover,
    required this.totalRetailer,
    required this.businessRetailer,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });
  int id;
  int channelId;
  String channelName;
  DateTime dataMonth;
  String liftingTarget;
  String billed;
  String delivered;
  String primaryCollection;
  String imsTarget;
  String ims;
  String marketCollection;
  int memoTarget;
  int memoQty;
  int pgTarget;
  int pgCover;
  int totalRetailer;
  int businessRetailer;
  DateTime createdAt;
  DateTime updatedAt;
  int status;
  factory Breakdown.fromJson(Map<String, dynamic> json) => Breakdown(
    id: json["id"],
    channelId: json["channel_id"],
    channelName: json["channel_name"],
    dataMonth: DateTime.parse(json["data_month"]),
    liftingTarget: json["lifting_target"],
    billed: json["billed"],
    delivered: json["delivered"],
    primaryCollection: json["primary_collection"],
    imsTarget: json["ims_target"],
    ims: json["ims"],
    marketCollection: json["market_collection"],
    memoTarget: json["memo_target"],
    memoQty: json["memo_qty"],
    pgTarget: json["pg_target"],
    pgCover: json["pg_cover"],
    totalRetailer: json["total_retailer"],
    businessRetailer: json["business_retailer"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "channel_id": channelId,
    "channel_name": channelName,
    "data_month": "${dataMonth.year.toString().padLeft(4, '0')}-${dataMonth.month.toString().padLeft(2, '0')}-${dataMonth.day.toString().padLeft(2, '0')}",
    "lifting_target": liftingTarget,
    "billed": billed,
    "delivered": delivered,
    "primary_collection": primaryCollection,
    "ims_target": imsTarget,
    "ims": ims,
    "market_collection": marketCollection,
    "memo_target": memoTarget,
    "memo_qty": memoQty,
    "pg_target": pgTarget,
    "pg_cover": pgCover,
    "total_retailer": totalRetailer,
    "business_retailer": businessRetailer,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "status": status,
  };
}
