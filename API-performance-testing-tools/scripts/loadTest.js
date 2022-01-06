import http from 'k6/http';
import { check, sleep } from "k6";

//test de charge
export let options = {
  stages: [
    { duration: '5m', target: 100 },
    { duration: '10m', target: 100 },
    { duration: '5m', target: 0 },
  ],
};
/*export default function () {
  const response = http.get("https://swapi.dev/api/people/30/", {headers: {Accepts: "application/json"}});
  check(response, { "status is 200": (r) => r.status === 200 });
  sleep(.300);
};*/

export default function () {
  const response =   http.get('http://host.docker.internal:8081/WeatherForecast');
  check(response, { "status is 200": (r) => r.status === 200 });
  sleep(1);
}
