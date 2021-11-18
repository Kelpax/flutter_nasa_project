import 'package:dio/dio.dart';
import 'package:nasa_app/core/api_constants.dart';
import 'package:nasa_app/model/nasa_response_model.dart';


class NasaRepository{
  Dio? dio= Dio();

  @override
  Future<NasaResponseModel> getDataCoriosity(String sol,String page,String apiKey,) async {
    final response =  await dio!.get(ApiConstant.baseUrlCuriosity,
      queryParameters:{
      'sol':sol,
      'page':page,
      'api_key':apiKey,
      },);
    return NasaResponseModel.fromJson(response.data);
  }
  Future<NasaResponseModel> getDataOpportunity(String sol,String page,String apiKey,) async {
    final response =  await dio!.get(ApiConstant.baseUrlOpportunity,
      queryParameters:{
      'sol':sol,
      'page':page,
      'api_key':apiKey,
      },);
    return NasaResponseModel.fromJson(response.data);
  }
  Future<NasaResponseModel> getDataSpirit(String sol,String page,String apiKey,) async {
    final response =  await dio!.get(ApiConstant.baseUrlSpirity,
      queryParameters:{
      'sol':sol,
      'page':page,
      'api_key':apiKey,
      },);
    return NasaResponseModel.fromJson(response.data);
  }

  @override
  Future<NasaResponseModel> getDateFilterData(String earthDate, String apiKey,) {
    // TODO: implement getDateFilterData
    throw UnimplementedError();
  }

}