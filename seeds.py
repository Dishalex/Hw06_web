from datetime import datetime
from faker import Faker
from random import randint, choice
import sqlite3

disciplines = [
    "Вища математика",
    "Дискретна математика",
    "Теорія ймовірності",
    "Лінійна алгебра",
    "Програмування",
    "Англійська мова",
    "Нарисна геометрія",
    ]

groups = [
    'БІ-21',
    'БІ-22',
    'БТ-21'
]

fake = Faker()

TEACHERS_NUM = 5
STUDENTS_NUM = 50

connect = sqlite3.connect('Hw06.db')
cur = connect.cursor()

def seed_teachers():
    teachers = [fake.name() for _ in range(TEACHERS_NUM)]
    sql = "INSERT INTO teachers(fullname) VALUES(?);"
    cur.executemany(sql, zip(teachers, ))

def seed_disciplines():
    sql = "INSERT INTO disciplines(name, teacher_id) VALUES(?, ?);"
    cur.executemany(sql, zip(disciplines, iter(randint(1, TEACHERS_NUM) for _ in range(len(disciplines)))))


def seed_groups():
    sql = 'INSERT INTO groups(name) VALUES(?);'
    cur.executemany(sql, zip(groups, ))


def seed_students():
    students = [fake.name() for _ in range(STUDENTS_NUM)]
    sql = 'INSERT INTO students(fullname, group_id) VALUES(?, ?);'
    cur.executemany(sql, zip(students, iter(randint(1, len(groups)) for _ in range(len(students)))))


def seed_grades():
    start_date = datetime.strptime('2022-09-01', '%Y-%m-%d')
    end_date = datetime.strptime('2023-06-16', '%Y-%m-%d')
    list_dates = [datetime.fromordinal(d) for d in range(start_date.toordinal(), end_date.toordinal()) if datetime.fromordinal(d).isoweekday() < 6]

    grades = []
    for day in list_dates:
        random_discipline = randint(1, len(disciplines))
        random_students = [randint(1, STUDENTS_NUM) for _ in range(5)]
        for student in random_students:
            grades.append((random_discipline, student, randint(1, 12), day.date()))

    sql = 'INSERT INTO grades(discipline_id, student_id, grade, date_of) VALUES(?, ?, ?, ?);'

    cur.executemany(sql, grades)

if __name__ == '__main__':
    
    try:
        seed_teachers()
        seed_disciplines()
        seed_students()
        seed_groups()
        seed_grades()

        connect.commit()

    except sqlite3.Error as err:
        print(err)

    finally:
        connect.close()