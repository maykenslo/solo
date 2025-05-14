# Étape 1 : Utilise une image avec Java 17
FROM eclipse-temurin:17-jdk AS build

# Crée un dossier de travail
WORKDIR /app

# Copie tout le code source dans le conteneur
COPY . .

# Donne les permissions d'exécution à mvnw (important pour Linux)
RUN chmod +x mvnw

# Compile et construit l'application (skip tests pour le build rapide)
RUN ./mvnw clean package -DskipTests

# Étape 2 : Crée une image légère pour exécuter l'application
FROM eclipse-temurin:17-jdk-alpine

# Dossier de travail
WORKDIR /app

# Copie uniquement le jar généré depuis l'étape précédente
COPY --from=build /app/target/deploiement_test-0.0.1-SNAPSHOT.jar app.jar

# Expose le port par défaut
EXPOSE 8080

# Commande pour démarrer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]


# ERROR: failed to solve: process "/bin/sh -c ./mvnw clean package -DskipTests" did not complete successfully: exit code: 1
