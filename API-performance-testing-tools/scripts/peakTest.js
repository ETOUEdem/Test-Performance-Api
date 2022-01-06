import http from 'k6/http';
import { check, sleep } from "k6";

//peak test ou test de pointe
export let options = {
    stages: [
      { duration: '10s', target: 100 },
      { duration: '2m', target: 100 },
      { duration: '10s', target: 1000 },
      { duration: '2m', target: 1000 },
      { duration: '10s', target: 100 },
      { duration: '2m', target: 100 },
      { duration: '10s', target: 0 },
    ],
  };

export default function () {
  const response =   http.get('http://host.docker.internal:8081/WeatherForecast');
  check(response, { "status is 200": (r) => r.status === 200 });
  sleep(1);
}
