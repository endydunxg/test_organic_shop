# Build stage
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Run stage
# Thay đổi dòng này từ openjdk sang eclipse-temurin hoặc amazoncorretto
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
# Sử dụng dấu * để tránh lỗi sai tên file JAR cụ thể
COPY --from=build /app/target/*.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]