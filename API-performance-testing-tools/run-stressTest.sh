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
echo "les tests de résistance impliquent la montée en puissance constante des VU progressivement sur une période de temps. Vous pouvez commencer avec 100 VU,"
echo "puis l'incrémenter de 100 VU à chaque fois. Ensuite, vous le ralentissez dans le cadre de la phase de récupération."
echo "--------------------------------------------------------------------------------------"

# lancement de browser pour la visualisation 
./launch-browser.sh

MSYS_NO_PATHCONV=1 docker-compose run -v     $PWD/scripts:/scripts     k6 run /scripts/stressTest.js