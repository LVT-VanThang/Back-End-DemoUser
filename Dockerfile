# Sử dụng JDK 21 (khớp với phiên bản bạn đang dùng trong VS Code)
FROM eclipse-temurin:21-jdk-alpine
# Sao chép file jar đã build vào container
COPY target/*.jar app.jar
# Lệnh để chạy ứng dụng
ENTRYPOINT ["java","-jar","/app.jar"]
