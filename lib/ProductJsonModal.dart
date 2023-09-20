class ProductJsonModal {
  String? productName;
  double? price;
  String? productType;
  String? skuSet;
  double? gST;
  int? minCount;
  int? maxCount;
  String? productCategory;
  List<String>? orderType;
  int? leadTime;
  String? shortDescription;
  String? longDescription;
  bool? localDelicacies;

  ProductJsonModal(
      {this.productName,
        this.price,
        this.productType,
        this.skuSet,
        this.gST,
        this.minCount,
        this.maxCount,
        this.productCategory,
        this.orderType,
        this.leadTime,
        this.shortDescription,
        this.longDescription,
        this.localDelicacies});

  ProductJsonModal.fromJson(Map<String, dynamic> json) {
    productName = json['Product name'];
    price = json['Price'].toDouble();
    productType = json['Product Type'];
    skuSet = json['Sku set'];
    gST = json['GST'].toDouble();
    minCount = json['Min count'];
    maxCount = json['Max count'];
    productCategory = json['Product Category'];
    orderType = json['Order type'].cast<String>();
    leadTime = json['Lead time'];
    shortDescription = json['Short Description'];
    longDescription = json['Long Description'];
    localDelicacies = json['Local Delicacies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Product name'] = productName;
    data['Price'] = price;
    data['Product Type'] = productType;
    data['Sku set'] = skuSet;
    data['GST'] = gST;
    data['Min count'] = minCount;
    data['Max count'] = maxCount;
    data['Product Category'] = productCategory;
    data['Order type'] = orderType;
    data['Lead time'] = leadTime;
    data['Short Description'] = shortDescription;
    data['Long Description'] = longDescription;
    data['Local Delicacies'] = localDelicacies;
    return data;
  }
}
