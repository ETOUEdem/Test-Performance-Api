import http from 'k6/http';
import { check, sleep } from "k6";

//stress test ou test de resistance
export let options = {
    stages: [
      { duration: '1m', target: 100 },
      { duration: '5m', target: 100 },
      { duration: '1m', target: 200 },
      { duration: '5m', target: 200 },
      { duration: '1m', target: 300 },
      { duration: '5m', target: 300 },
      { duration: '1m', target: 400 },
      { duration: '5m', target: 400 },
      { duration: '5m', target: 0 },
    ],
  };

export default function () {
  const response =   http.get('http://host.docker.internal:8081/WeatherForecast');
  check(response, { "status is 200": (r) => r.status === 200 });
  sleep(1);
}
