echo "--------------------------------------------------------------------------------------"
echo "Arret des dockers"
echo "--------------------------------------------------------------------------------------"
docker stop api-performance-testing-tools_grafana
docker stop api-performance-testing-tools_influxdb
docker stop api-performance-testing-tools_k6


