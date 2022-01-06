
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
echo "Load testing with Grafana dashboard http://localhost:3000/d/k6/k6-load-testing-results"
echo "--------------------------------------------------------------------------------------"
echo "Pour les tests de charge, vous devez augmenter la VU à une bonne quantité et la maintenir pendant"
echo "une période de temps fixe avant de la réduire à 0. Jetez un œil à l'exemple suivant, qui utilise 100 VU."
echo "--------------------------------------------------------------------------------------"

# lancement de browser pour la visualisation 
./launch-browser.sh


MSYS_NO_PATHCONV=1 docker-compose run -v     $var_path/scripts:/scripts     k6 run /scripts/loadTest.js 



 

