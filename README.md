# les-1
home work les 1 linux adv

в этом ДЗ мы разворачиваем виртуальную машину при помощи terraform и ролью ansible накатываем nginx

1. инициализировать соединение с облаком, в нашем случае яндекс клауд: yc init
2. создаем сервисный аккаунт для tf если нужно, даем ему необходимые гранты
3. выбираем из списка нужноый ид образа, в нашем случае убунту 20:  yc compute image get-latest-from-family ubuntu-2004-lts --folder-id standard-images
4. копируем из гита все файлы https://github.com/alexeykazancev/les-1.git
5. открываем файл main.tf подставляем туда свои: cloud_id  = ""  folder_id = ""  zone = "ru-central1-b"
6. выполняем terraform plan , затем terraform apply
7. при установке импортируется рса ключ, поэтому пароля при входе не требуется.
8. проверяем логин на вход ssh ubuntu@ip
9. далее выполняем установку нжинкс, переходим в папку ансибл, проверяем ip в файле хостс и выполняем установку: ansible-playbook play.yml -i hosts
10. если в выводе есть сообщения ok=3    changed=1 , значит установка выполнилась
11. для проверки можно выполнить curl 158.160.66.147
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

будет примерно такой вывод

12. для удаления нжинкс выполнить команду ansible-playbook -i hosts nginx_uninstall.yml -u ubuntu
13. для удаления вм , выйти на уровень выше и выполнить команду terraform destroy
