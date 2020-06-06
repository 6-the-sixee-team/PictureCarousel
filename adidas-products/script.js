import http from 'k6/http';
import {Counter, Rate} from 'k6/metrics';
import { check, sleep } from 'k6';

let errorCounter = new Counter("error_counter");

export let options = {
  stages : [
    { duration: '30s', target: 100},
    { duration: '30s', target: 500},
    { duration: '30s', target: 1000}
  ],
  thresholds: {
    http_req_duration: ["p(99)<1000"]
  }
};
export default function() {
  let res = http.get(`http://localhost:3001/api/products/${Math.floor(100000000000 + Math.random(899999999999))})}`);
  sleep(0.01);
  check(res, {"OK": (r) => r.status === 200});
  if (res.status === 404) {
    errorCounter.add(1);
  }
}