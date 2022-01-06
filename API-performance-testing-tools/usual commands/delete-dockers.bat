./stop-dockers.bat
echo "--------------------------------------------------------------------------------------"
echo "suppression des docker"
echo "--------------------------------------------------------------------------------------"
docker rm -f api-performance-testing-tools_grafana
docker rm -f api-performance-testing-tools_influxdb
docker rm -f api-performance-testing-tools_k6


