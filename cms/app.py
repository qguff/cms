from flask import Flask, request, render_template_string

app = Flask(__name__)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        print(f"Логин: {username}, Пароль: {password}")
        return f"Вы ввели: {username}"
    return render_template_string('''
        <form method="POST" action="/login">
            Логин: <input type="text" name="username"><br>
            Пароль: <input type="password" name="password"><br>
            <input type="submit" value="Войти">
        </form>
    ''')

if __name__ == "__main__":
    app.run(debug=True)
