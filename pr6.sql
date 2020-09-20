SET search_path = research_work;

--Задание 6
insert into research_work.publication_of_faculty_staff  (
    publication_id
    , professor_id
    , publication_title
    , publication_type
    , article_type
    , description_of_publication
    , publication_page_cnt
    , last_modified_dt
)
values (
    777
    , 2235
    , 'Однослойные плёнки на границе круга'
    , 2
    , 2
    , 'Ученые записки Забайкальского государственного университета. 2020. Т. 18. №3. С. 51-60.'
    , 10
    , '2020-09-20'
);

update
    research_work.publication_of_faculty_staff
set
    description_of_publication = 'Ученые записки Забайкальского государственного университета. 2020. Т. 18. №3. С. 61-70.'
where
    publication_id = 777;

delete
from
    research_work.publication_of_faculty_staff
where
    publication_id = 777;

select
    professor_id
    , publication_title
from
    research_work.publication_of_faculty_staff
where
    publication_id = 499
;


insert into research_work.faculty_staff  (
    professor_id
    , name
    , login
    , password
    , department_id
    , birthday_dt
    , staff_job
    , academic_rank
    , last_modified_dt)
values (
    22313
    , 'Федорцов Михаил Викторович'
    , '22313Fd'
    , '22313Fd12345'
    , 223
    , '1985-02-08'
    , 1
    , 0
    , '2020-09-20'
);

update
    research_work.faculty_staff
set
    birthday_dt = '1985-03-08'
where
    professor_id = 22313;

delete
from
    research_work.faculty_staff
where
    professor_id = 22313;


select
    professor_id
    , name
from
    research_work.faculty_staff
where
    department_id = 223
order by
    name
;

create table research_work.faculty  (
    faculty_id smallint not null
    , faculty varchar(200)
    , last_modified_dt date
);

alter table
    research_work.faculty
rename
    faculty
to
    faculty_nm;

drop table if exists
    research_work.faculty;

create table research_work.job  (
    professor_id smallint not null primary key
    , occupation varchar(120)
    , department_id smallint not null
    , job_start_dt date
    , last_modified_dt date
);

alter table
    research_work.job
add
    job_end_dt date
;

drop table if exists
    research_work.job;