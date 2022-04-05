# roman-limanskiy_infra
roman-limanskiy Infra repository

Подключение к someinternalhost в одну команду:
ssh -J login@51.250.68.77 login@10.129.0.28

Подключение к someinternalhost по имени хоста:

Добавляем в файл /etc/hosts строки
10.129.0.28     someinternalhost

После этого можно подключаться по имени хоста:
ssh -J login@51.250.68.77 login@someinternalhost

Аналогично можно сделать и для хоста bastion.

Но более правильно будет сделать так:
1. На локальной машине добавить в /etc/hosts узел bastion
2. На bastion добавить в /etc/hosts все внутренние хосты

Подключаемся:
ssh -J login@bastion login@someinternalhost

Таким образом настройка локального окружения каждого сотрудника потребует меньше строк конфига.

Использование сертификата:

Идем в Settings -> Lets Encrypt Domain, вводим 51.250.68.77.sslip.io, где 51.250.68.77 внешний ip-адрес ВМ Bastion.
После этого админка VPN-сервера будет доступна по адресу https://51.250.68.77.sslip.io/

Адреса ВМ:
bastion_IP = 51.250.68.77
someinternalhost_IP = 10.129.0.28

# ДЗ №4

testapp_IP = 51.250.74.84
testapp_port = 9292

Деплой одной командой:
./startup-script.sh

# ДЗ №5

В процессе сделано:

- Создан образ с ruby и mongo (fry)
- Создан образ работающего приложения (bake)
- Изучены дополнительные провиженеры packer
- Написан скрипт запуска приложения
