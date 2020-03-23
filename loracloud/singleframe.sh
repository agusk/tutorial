

SRVURI=https://gls.loracloud.com
TOKEN="YOUR_TOKEN"

read -d '' GATEWAYS << EOF
[{"gatewayId": "0000123456789a00",
  "latitude": 51.50119, "longitude": -0.142003, "altitude": 100},
{"gatewayId": "0000123456789a01",
  "latitude": 51.51019, "longitude": -0.142003, "altitude": 100},
{"gatewayId": "0000123456789a02",
  "latitude": 51.50569, "longitude": -0.129482, "altitude": 100},
{"gatewayId": "0000123456789a03",
  "latitude": 51.49669, "longitude": -0.129482, "altitude": 100},
{"gatewayId": "0000123456789a04",
  "latitude": 51.49219, "longitude": -0.142003, "altitude": 100},
{"gatewayId": "0000123456789a05",
  "latitude": 51.49669, "longitude": -0.154524, "altitude": 100},
{"gatewayId": "0000123456789a06",
  "latitude": 51.50569, "longitude": -0.154524, "altitude": 100}]
EOF

read -d '' FRAME << EOF
[["0000123456789a00", 0, 256477, -100.0, 17.7],
 ["0000123456789a00", 1, 256433, -105.0, 13.1],
 ["0000123456789a01", 0, 258814, -116.0, 3.3],
 ["0000123456789a01", 1, 259024, -118.0, -2.7],
 ["0000123456789a02", 0, 259940, -116.0, 3.5],
 ["0000123456789a02", 1, 261383, -113.0, 0.7],
 ["0000123456789a03", 0, 259508, -119.0, -6.5],
 ["0000123456789a03", 1, 259569, -118.0, 1.6],
 ["0000123456789a04", 0, 260415, -108.0, 7.6],
 ["0000123456789a04", 1, 257252, -106.0, 7.9],
 ["0000123456789a05", 0, 256735, -97.0, 15.9],
 ["0000123456789a05", 1, 256759, -97.0, 15.6],
 ["0000123456789a06", 0, 259020, -96.0, 13.5],
 ["0000123456789a06", 1, 262640, -96.0, 15.5]]
EOF

read -d '' DATA << EOF
{ "gateways": $GATEWAYS, "frame": $FRAME }
EOF

curl -k --request POST -H "Ocp-Apim-Subscription-Key: $TOKEN" \
     -H "Content-Type: application/json" -d "$DATA" \
     $SRVURI/api/v3/solve/singleframe
