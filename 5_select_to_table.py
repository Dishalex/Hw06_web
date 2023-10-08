from random import randint

from psycopg2 import Error
from faker import Faker

from db_connection import connection

fake = Faker('uk-UA')

simple_select = """
SELECT * FROM users WHERE id=%s;
"""

select_1 = """
SELECT id, name, email, age
FROM users
WHERE age>45
ORDER BY name, age DESC
LIMIT 100;
"""

select_regex = """
SELECT id, name, email, age
FROM users
WHERE name SIMILAR TO '%Нест%'
ORDER BY name, age DESC
LIMIT 100;
"""



if __name__ == '__main__':
    with connection() as conn:
        c = conn.cursor()
        # c.execute(simple_select, (1346,))
        # print(c.fetchone())
        c.execute(select_regex)
        print(*c.fetchall(), sep='\n')


        c.close()