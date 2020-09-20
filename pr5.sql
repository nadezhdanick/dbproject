SET search_path = research_work;

-- Запрос 1. Вывести ФИО, название учебного пособия (publication_type = 4), сотрудников кафедры с идентификационным номером 223
select
    faculty.name
    , publ.publication_title
from
    faculty_staff as faculty
inner join
    publication_of_faculty_staff as publ
    on faculty.professor_id = publ.professor_id
    and publ.publication_type = 4
    and faculty.department_id = 223;

-- Запрос 2. Вывести ФИО, сотрудников кафедры с идентификационным номером 223 и количество их статей, если таковые имеются
select
     faculty.name
    , count(publ.publication_title)
from
    faculty_staff as faculty
inner join
    publication_of_faculty_staff as publ
    on faculty.professor_id = publ.professor_id
    and publ.publication_type = 2
    and faculty.department_id = 223
group by
    faculty.name
;

-- Запрос 3. Вывести ФИО, сотрудников кафедры с идентификационным номером 223, занимающихся научно-исследовательской работой со студентами, указав с какими студентами они работают
select
    faculty.name
    , nirs.student_nm
from
    faculty_staff as faculty
inner join
    scientific_research_work_of_students as nirs
    on faculty.professor_id = nirs.professor_id
    and faculty.department_id = 223;

-- Запрос 4. Вывести ФИО, сотрудников кафедры с идентификационным номером 223, занимающихся научно-исследовательской работой со студентами,
-- количество статей (больше 0), которые написали студенты, работая с данными преподавателями
select
    faculty.name
    , count(nirs.student_publication_title)
from
    faculty_staff as faculty
inner join
    scientific_research_work_of_students as nirs
    on faculty.professor_id = nirs.professor_id
    and faculty.department_id = 223
group by
    faculty.name
having
    count(nirs.student_publication_title) > 0;
;

-- Запрос 5. Вывести ФИО, сотрудников кафедры с идентификационным номером 223, работающих над фундаментальными научными исследованиями, вывести названия данных исследований, если они есть
select
    faculty.name
    , nir.research_project
from
    faculty_staff as faculty
inner join
    research_work as nir
    on faculty.professor_id = nir.professor_id
    and faculty.department_id = 223
    and kind_of_research_project = 2
;