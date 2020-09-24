from peewee import *
from datetime import date
import psycopg2

db = PostgresqlDatabase(database='postgres', user='postgres', password='postgres')
db.connect()

class faculty_stuff_2(Model):
    name = CharField()
    occupation = CharField()
    birthday = DateField()

    class Meta():
        database = db
faculty_stuff_2.truncate_table()

volkov = faculty_stuff_2(name = 'Волков Дмитрий Олегович', occupation = 'доцент', birthday = date(1965,5,23))
volkov.save()
smirnov = faculty_stuff_2(name = 'Смирнов Дмитрий Геннадьевич', occupation = 'доцент', birthday = date(1973,2,3))
smirnov.save()
zima = faculty_stuff_2(name = 'Зима Наталья Сергеевна', occupation = 'доцент', birthday = date(1975,6,21))
zima.save()
kozlov = faculty_stuff_2(name = 'Козлов Петр Викторович', occupation = 'доцент', birthday = date(1953,1,17))
kozlov.save()
zhitnikov = faculty_stuff_2(name = 'Житников Александр Алексеевич', occupation = 'доцент', birthday = date(1985,12,7))
zhitnikov.save()
sergeev = faculty_stuff_2(name = 'Сергеев Михаил Петрович', occupation = 'старший преподаватель', birthday = date(1981,7,12))
sergeev.save()
markova = faculty_stuff_2(name = 'Маркова Алина Николаевна', occupation = 'ассистент', birthday = date(1995,5,29))
markova.save()

d1980 = date(1980, 1, 1)
for person in faculty_stuff_2.select().where(faculty_stuff_2.birthday > d1980):
    print(person.name)



