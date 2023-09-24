# les-1
home work les 1 linux adv

в этом ДЗ мы разворачиваем виртуальную машину при помощи terraform и ролью ansible накатываем nginx

1. в начале необходимо установить утилиту yc и  инициализировать соединение с облаком, для этого выполнить:  curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash и затем  yc init
более подробно тут https://cloud.yandex.ru/docs/cli/quickstart
2. создаем сервисный аккаунт для tf если нужно, даем ему необходимые гранты https://cloud.yandex.ru/docs/iam/concepts/users/service-accounts
3. выбираем из списка нужный ид образа, в нашем случае убунту 20:  yc compute image get-latest-from-family ubuntu-2004-lts --folder-id standard-images и запоминаем его ид, для подстановки его в terraform.tfvars
4. копируем из гита все файлы https://github.com/alexeykazancev/les-1.git
5. создаем файл terraform.tfvars подставляем туда свои: cloud_id  = ""  folder_id = ""  zone = ""  subnet_id = "" yc_token = ""  image_id = ""
6. скачиваем бинарник провайдера тераформа для яндекса для системы линукс https://hashicorp-releases.yandexcloud.net/terraform/1.5.7/
7. распаковываем бинарник провайдера тераформа в папку с консолью яндекс, выполняем terraform validate, для проверки манифеста , далее  terraform plan для вывода информации, что будет создано , затем terraform apply для применения изменений
8. при установке импортируется рса ключ, поэтому пароля при входе в vm не требуется.
9. проверяем логин на вход ssh ubuntu@ip
10. далее выполняем установку нжинкс, переходим в папку ансибл, проверяем ip в файле хостс и выполняем установку: ansible-playbook play.yml -i hosts
11. если в выводе есть сообщения ok=3    changed=1 , значит установка выполнилась
12. для проверки можно выполнить curl ip вашей машины
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

13. для удаления нжинкс выполнить команду ansible-playbook -i hosts nginx_uninstall.yml -u ubuntu
14. для удаления вм , выйти на уровень выше и выполнить команду terraform destroy
