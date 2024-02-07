
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository{

  CryptoCoinsRepository({required this.dio});
  
  final Dio dio;

  @override
  Future <List<CryptoCoin>> getCoinsList() async {    // асинхронный метод

    // await так как ожидаем когда этот метод совершится и отдаст с сервера результат
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,ATM,BOLT,CPT,DDD,FTT,BNT,BLZ&tsyms=USD'
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>; 
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key, 
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();
    
    return cryptoCoinsList; 

  } 

  @override
  Future <CryptoCoinDetail> getCoinDetails(String currencyCode) async {

    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD'
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final toSymbol = usdData['TOSYMBOL'];
    final lastUpdate = usdData['LASTUPDATE'];
    final hight24Hour = usdData['HIGH24HOUR'];
    final low24Hours = usdData['LOW24HOUR'];
    final priceInUSD = usdData['PRICE'];
    final imageUrl = usdData['IMAGEURL'];

    return CryptoCoinDetail(
      name: currencyCode,
      priceInUSD: priceInUSD, 
      imageUrl: 'https://www.cryptocompare.com/$imageUrl', 
      toSymbol: toSymbol, 
      lastUpdate: DateTime.fromMicrosecondsSinceEpoch(lastUpdate), 
      hight24Hour: hight24Hour, 
      low24Hours: low24Hours,
    );

  } 

}