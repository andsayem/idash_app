// To parse this JSON data, do
//
//     final salesSummary = salesSummaryFromJson(jsonString);

import 'dart:convert';

List<SalesSummary> salesSummaryFromJson(String str) => List<SalesSummary>.from(json.decode(str).map((x) => SalesSummary.fromJson(x)));

String salesSummaryToJson(List<SalesSummary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalesSummary {
    SalesSummary({
        required this.dataMonth,
        required this.liftingTarget,
        required this.lifting,
        required this.primaryCollection,
        required this.imsTarget,
        required this.ims,
        required this.marketCollection,
        required this.memoTarget,
        required this.memoQty,
        required this.pgTarget,
        required this.pgCover,
    });

    DateTime dataMonth;
    String liftingTarget;
    String lifting;
    String primaryCollection;
    String imsTarget;
    String ims;
    String marketCollection;
    String memoTarget;
    String memoQty;
    String pgTarget;
    String pgCover;

    factory SalesSummary.fromJson(Map<String, dynamic> json) => SalesSummary(
        dataMonth: DateTime.parse(json["data_month"]),
        liftingTarget: json["lifting_target"],
        lifting: json["lifting"],
        primaryCollection: json["primary_collection"],
        imsTarget: json["ims_target"],
        ims: json["ims"],
        marketCollection: json["market_collection"],
        memoTarget: json["memo_target"],
        memoQty: json["memo_qty"],
        pgTarget: json["pg_target"],
        pgCover: json["pg_cover"],
    );

    Map<String, dynamic> toJson() => {
        "data_month": "${dataMonth.year.toString().padLeft(4, '0')}-${dataMonth.month.toString().padLeft(2, '0')}-${dataMonth.day.toString().padLeft(2, '0')}",
        "lifting_target": liftingTarget,
        "lifting": lifting,
        "primary_collection": primaryCollection,
        "ims_target": imsTarget,
        "ims": ims,
        "market_collection": marketCollection,
        "memo_target": memoTarget,
        "memo_qty": memoQty,
        "pg_target": pgTarget,
        "pg_cover": pgCover,
    };
}
