# Указываем базовый образ
FROM debian:latest

# Устанавливаем необходимые пакеты
RUN apt update && apt upgrade
RUN apt install bash
RUN apt install grep
RUN apt-get install -y gawk
RUN apt-get install -y iproute2
RUN apt-get install -y dos2unix
RUN ip a
# Копируем скрипт внутрь контейнера
COPY ip-addresses.sh /
RUN dos2unix ip-addresses.sh

# Устанавливаем рабочую директорию
#WORKDIR /ip-addresses

# Даем разрешение на выполнение скрипта
RUN chmod +x ./ip-addresses.sh

# Запускаем скрипт при запуске контейнера
#CMD ["ip addr"]
#ENTRYPOINT ["bash", "ip-addresses.sh"]
CMD ["./ip-addresses.sh"]