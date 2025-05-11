# Utilise l'image officielle de Java 11 avec Maven
FROM eclipse-temurin:11-jdk

# Crée un dossier de travail dans le conteneur
WORKDIR /app

# Copie tous les fichiers dans le conteneur
COPY . .

# Donne les permissions d'exécution au wrapper Maven (si ce n'est pas déjà le cas)
RUN chmod +x mvnw

# Compile et construit le projet
RUN ./mvnw clean install -DskipTests

# Spécifie le port que l'application écoutera
# EXPOSE 8080

# Démarre l'application
CMD ["sh", "-c", "java -jar target/deploiement_test-0.0.1-SNAPSHOT.jar --server.port=8080 --server.address=0.0.0.0"]

