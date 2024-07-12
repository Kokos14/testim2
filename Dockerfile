# Используем официальный базовый образ PHP с Apache
FROM php:7.4-apache

# Обновляем индекс пакетов и устанавливаем curl и php-curl
RUN apt-get update && \
    apt-get install -y curl && \
    docker-php-ext-install curl

# Копируем файлы вашего приложения в рабочую директорию контейнера
COPY . /var/www/html/

# Открываем порт 80 для HTTP
EXPOSE 80

# Команда для запуска Apache в фоновом режиме
CMD ["apache2-foreground"]