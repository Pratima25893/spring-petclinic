FROM openjdk:11
WORKDIR /
COPY ./target/PetClinicApplication.java /app.jar
EXPOSE 8080
ENTRYPOINT ["java" "-jar" "app.jar"]
