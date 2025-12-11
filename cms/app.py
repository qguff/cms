from flask import Flask, request, render_template_string
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

# Шаблон страницы авторизации
login_page = """
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Авторизация</h2>
    <form method="POST" action="/login">
        Логин: <input type="text" name="email"><br>
        Пароль: <input type="password" name="password"><br>
        <input type="submit" value="Войти">
    </form>
    {% if message %}
        <p style="color:red;">{{ message }}</p>
    {% endif %}
</body>
</html>
"""

# Подключение к базе данных
def check_credentials(email, password):
    try:
        cnx = mysql.connector.connect(
            host="localhost",      # твой хост
            user="scott",           # твой пользователь
            password="",       # твой пароль
            database="cms"         # твоя база данных
        )
        cursor = cnx.cursor()
        query = "SELECT * FROM user WHERE email=%s AND password=%s"
        cursor.execute(query, (email, password))
        result = cursor.fetchone()
        cursor.close()
        cnx.close()
        return result is not None
    except Error as err:
        print(f"Ошибка подключения или запроса: {err}")
        return False

# Роут для авторизации
@app.route("/login", methods=["GET", "POST"])
def login():
    message = ""
    if request.method == "POST":
        email = request.form.get("email")
        password = request.form.get("password")
        print(f"Попытка входа: Email={email}, Пароль={password}")  # вывод в консоль

        if check_credentials(email, password):
            message = "Успешная авторизация!"
        else:
            message = "Неверный логин или пароль!"

    return render_template_string(login_page, message=message)

if __name__ == "__main__":
    app.run(debug=True)
