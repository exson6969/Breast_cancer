class Resopnse_api_call {
  final String r;
  const Resopnse_api_call({required this.r});
  factory Resopnse_api_call.from_json(Map<String, dynamic> output_json) {
    return Resopnse_api_call(r: output_json['output']);
  }
}
