
echo "--------------------------------------------------------------------------------------"
echo "Initialisation des Dockers"
echo "--------------------------------------------------------------------------------------"
# arret et suppression 
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
# creation des docker 
docker-compose up -d influxdb grafana webappapi 

var_path=${PWD} 


echo "--------------------------------------------------------------------------------------"
echo "Load testing with Grafana dashboard http://localhost:3000/d/k6/resultats-des-tests-de-charge-k6"
echo "--------------------------------------------------------------------------------------"
echo "Le test de pointe vise à submerger votre système avec une surtension soudaine d'une charge dans un court laps de temps. "
echo "--------------------------------------------------------------------------------------"
# lancement de browser pour la visualisation 
./launch-browser.sh

MSYS_NO_PATHCONV=1 docker-compose run -v     $PWD/scripts:/scripts     k6 run /scripts/peakTest.js