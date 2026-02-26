# Stage 1: Build dự án bằng Maven
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
# Copy toàn bộ code vào trong container
COPY . .
# Chạy lệnh build để tạo ra file .jar
RUN mvn clean package -DskipTests

# Stage 2: Chạy ứng dụng bằng JRE nhẹ
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
# Copy file .jar vừa build được ở Stage 1 sang Stage 2
COPY --from=build /app/target/*.jar app.jar
# Mở cổng 8080
EXPOSE 8080
# Lệnh khởi chạy
ENTRYPOINT ["java","-jar","app.jar"]
