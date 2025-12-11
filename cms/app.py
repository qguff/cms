from flask import Flask, request, render_template_string

app = Flask(__name__)

# Страница авторизации
login_form_html = """
<!doctype html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <title>Login</title>
  </head>
  <body>
    <h2>Авторизация</h2>
    <form method="POST" action="/login">
      Логин: <input type="text" name="username"><br>
      Пароль: <input type="password" name="password"><br>
      <input type="submit" value="Войти">
    </form>
  </body>
</html>
"""

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        print(f"Логин: {username}, Пароль: {password}")  # Вывод в консоль
        return f"Данные получены. Логин: {username}"
    return render_template_string(login_form_html)

if __name__ == '__main__':
    app.run(debug=True)
