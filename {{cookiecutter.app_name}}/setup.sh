export FLASK_APP=/path/to/autoapp.py
export FLASK_DEBUG=1

mkvirtualenv {{ cookiecutter.app_name }}
pip install -r requirements/dev.txt
bower install

echo "Enter {{ cookiecutter.app_name }}123 for a password when prompted"
createuser -s {{ cookiecutter.app_name }} -W
flask setup_db
flask db init
flask db migrate
flask db upgrade
