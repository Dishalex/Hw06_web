from psycopg2 import connect, Error
from contextlib import contextmanager

@contextmanager
def connection():
    conn = None
    try:
        conn = connect(host='cornelius.db.elephantsql.com', user='aasmjvrf', database='aasmjvrf', password='6bYzLt_H_wj8hArIFcA3CtrdJXK7_jcP')
        yield conn
        conn.commit()

    except Error as err:
        print(err)
        conn.rollback()

    finally:
        if conn is None:
            conn.close()
