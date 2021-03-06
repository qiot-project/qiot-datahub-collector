chmod +x mvn*
mvn -N io.takari:maven:wrapper
./mvnw clean package -Pnative -pl qiot-datahub-collector-pollution -am -Dquarkus.native.container-build=true -Dquarkus.native.container-runtime=docker
docker rmi quay.io/qiotcovid19/qiot-datahub-collector-pollution:1.0.0
cd qiot-datahub-collector-pollution
docker build -f src/main/docker/Dockerfile.native -t quay.io/qiotcovid19/qiot-datahub-collector-pollution:1.0.0 .
cd ..
docker push quay.io/qiotcovid19/qiot-datahub-collector-pollution:1.0.0
