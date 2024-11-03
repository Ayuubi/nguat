import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Odoo Group Code

class OdooGroup {
  static String getBaseUrl() => 'https://nagaadhalls.com/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static AuthCall authCall = AuthCall();
  static ProductsCall productsCall = ProductsCall();
}

class AuthCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final baseUrl = OdooGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "jsonrpc": "2.0",
  "method": "call",
  "params": {
    "db": "postgres",
    "login": "${username}",
    "password": "${password}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Auth',
      apiUrl: '${baseUrl}web/session/authenticate',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.result.username''',
      ));
}

class ProductsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = OdooGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Products',
      apiUrl: '${baseUrl}api/products',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Odoo Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
