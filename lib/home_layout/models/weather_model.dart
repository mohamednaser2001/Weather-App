

class WeatherModel{
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var windDirection;
  var gust;
  var uv;
  var pressure;
  var pricipition;
  var lastUpdate;

  WeatherModel({
    this.cityName,
    this.icon,
    this.condition,
    this.temp,
    this.wind,
    this.humidity,
    this.windDirection,
    this.gust,
    this.uv,
    this.pressure,
    this.pricipition,
    this.lastUpdate
});

  WeatherModel.fromJson(Map<String,dynamic>json){
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    windDirection = json['current']['wind_dir'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
    pressure = json['current']['pressure_mb'];
    pricipition = json['current']['precip_mm'];
    lastUpdate = json['current']['last_updated'];
  }

}