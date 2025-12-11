import mysql.connector
from mysql.connector import Error
from tabulate import tabulate

db_config = {
    "user": "scott",
    "password": "",  # пароль, если есть
    "host": "localhost",
    "database": "cms"
}

try:
    cnx = mysql.connector.connect(**db_config)
    if cnx.is_connected():
        print("Подключение успешно!\n")
        cursor = cnx.cursor()

        # Проверяем таблицу user
        cursor.execute("SHOW TABLES LIKE 'user';")
        if not cursor.fetchone():
            print("Таблица 'user' не найдена в базе данных.")
        else:
            # Запрос пользователей и их "прав" (is_active)
            cursor.execute("""
                SELECT first_name, last_name, email, 
                       CASE WHEN is_active = 1 THEN 'Активен' ELSE 'Неактивен' END AS rights
                FROM user;
            """)
            results = cursor.fetchall()

            if not results:
                print("В таблице 'user' нет записей.")
            else:
                headers = ["Имя", "Фамилия", "Email", "Права"]
                print(tabulate(results, headers=headers, tablefmt="grid", stralign="center"))

        cursor.close()

except Error as err:
    print(f"Ошибка подключения или запроса: {err}")

finally:
    if 'cnx' in locals() and cnx.is_connected():
        cnx.close()
