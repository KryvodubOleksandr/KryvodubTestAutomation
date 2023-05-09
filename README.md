# Kryvodub_TA
Для запуску додатку вам необхідно мати встановлений XCode версії 14+.

Кроки для запуску:

1) Створіть базу даних через термінал за допомогою скрипту:
docker run --name postgres -e POSTGRES_DB=vapor_database \
  -e POSTGRES_USER=vapor_username -e POSTGRES_PASSWORD=vapor_password \
  -p 5432:5432 -d postgres
  
2) Відкрийте проєкт в XCode та додайте docker-compose.yml файл в корін проєкту. В ньому зазначте назву бази даних, пароль до неї, порти і т.д.
3) Запустіть проєкт та відкрийте в сторінку браузері за адресою http://127.0.0.1
