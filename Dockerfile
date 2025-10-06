FROM openjdk:21
WORKDIR /app
COPY . /app
RUN ./gradlew build
CMD ["java", "-cp", "build/classes/java/main", "com.demo.App"]
