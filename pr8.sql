SET search_path = public, research_work;

-- Задание 8_1 Вывести ФИО преподавателей, написавших статьи, входящих в scopus, их названия и выходные данные (если такие есть)
create view v_publication_of_faculty_staff as
    select
        f.name
        , p.publication_title, p.description_of_publication
    from faculty_staff f
        inner join publication_of_faculty_staff p
        on f.professor_id = p.professor_id
        where p.article_type=3
;

-- Задание 8_2 Вывести ФИО преподавателей, работающих в должности доцента на кафедре с идентификационным номером 223 (если такие есть)
create view v_occupation_in_department as
    select
        f.name
    from faculty_staff f
        inner join job_faculty_staff j
        on f.professor_id = j.professor_id
        where j.occupation = 'Доцент' and j.department_id = 223
;