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

# ДЗ №6

В процессе сделано:

- Описана инфстаструктура в виде кода
- Выполнены самостоятельные задания
- Описано создание балансировщика в коде terraform
- Описан в виде кода второй инстанс приложения (такой подход приводил к дубрилованию кода и им сложно управлять)
- Описан в виде кода второй инстарс приложения через переменную count

# ДЗ №7

В процессе сделано:

- Созданы новые образы для выполнения ДЗ
- Конфигурация ВМ вынесена в модули
- Описаны окружения Stage и Prod
- Удалены лишние файлы
- Параметризированы размер диска и хостнейм
- Конфигурационные файлы отформатированы

# ДЗ №8

В процессе сделано:

1. Настроено окружение для ansible
2. Написан простой плейбук. После удаления ~/reddit на сервере app заново запустили плейбук, который завершился с ok=2 и changed=1. ok=2 означает, что оба задания из плейбука завершились успешно. changed=1 означает, что в результате выполнения одного из задания произошли изменения (создана директория с содержимым repo)
3. Создан файл inventory.json в формате dynamic inventory и скрипт который просто выводит его в stdout
4. Добавил dymamic inventory в ansible.cfg:
 - написан скрипт для получения имен и ip-адресов запущенных инстансов;
 - скрипт ищет нужные нам строки и в цикле заполняет словарь в нужно нам формате, потом выводит результат в stdout
 - в ansible.cfg добавил inventory = ./dymamic_inventory.py, теперь можно выполнять так: ansible all -m ping
