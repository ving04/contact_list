// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:contact_list/models/agenda_model.dart';

import 'package:http/http.dart' as http;

class AgendaRepository {
  final _headers = {
    'X-Parse-Application-Id': 'Z29QeoCVWnMi48cpGawYYcEZQsaFd5NkDBJjJhHd',
    'X-Parse-REST-API-Key': 'L1l3xLbC6lHsiZE2PT2IjzIy8xMPJKOaDHQHWWHn',
    'Content-Type': 'application/json'
  };

  final _baseUrl = 'https://parseapi.back4app.com/classes/contact_list';

  Future<dynamic> addContact(dynamic body) async {
    var response = await http.post(
      Uri.parse(_baseUrl),
      body: jsonEncode(body),
      headers: _headers,
    );
    //print(response.statusCode);
    return response.body;
  }

  Future<dynamic> updateContact(String objectId, dynamic body) async {
    var response = await http.put(
      Uri.parse('$_baseUrl/$objectId'),
      body: jsonEncode(body),
      headers: _headers,
    );
    //print(response.statusCode);
    return response.body;
  }

  Future<AgendaModel> getContacts() async {
    var response = await http.get(
      Uri.parse(_baseUrl),
      headers: _headers,
    );
    //print(response.statusCode);
    final json = jsonDecode(response.body);
    //final result = json['results'] as List;
    return AgendaModel.fromJson(json);
  }

  Future<void> deleteById(String objectId) async {
    await http.delete(
      Uri.parse('$_baseUrl/$objectId'),
      headers: _headers,
    );
    //print(response.statusCode);
  }
}

/*
class AgendaRepository {
  final _dio = Dio();

  Dio get dio => _dio;

 

 

  Future<dynamic> getAgenda() async {
    final response =
        await dio.get(_baseUrl, options: Options(headers: _headers));
    print(response.data);
    return (response.data).toString();
  }

  Future<dynamic> addContact(Agenda agenda) async {
    final response = await dio.post(_baseUrl,
        options: Options(headers: _headers), data: AgendaModel().toJson());
    print(response.data);
    return (response.data);
  }

  Future<void> deleteContact(String objectId) async {
    await dio.delete('_baseUrl/$objectId', options: Options(headers: _headers));
  }

  Future<void> updateContact(String objectId, AgendaModel agendaModel) async {
    await dio.put('_baseUrl/$objectId',
        options: Options(headers: _headers), data: AgendaModel().toJson());
  }
}
*/