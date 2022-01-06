import http from 'k6/http';
export function url() {
  
    http.get('http://host.docker.internal:8081/WeatherForecast')
}