class PaymentData {
  final String month;
  final double collectedAmount;
  final double pendingAmount;

  PaymentData(this.month, this.collectedAmount, this.pendingAmount);

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      json['month'],
      json['collectedAmount'].toDouble(),
      json['pendingAmount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'collectedAmount': collectedAmount,
      'pendingAmount': pendingAmount,
    };
  }
}
