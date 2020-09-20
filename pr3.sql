create schema research_work;

SET search_path = research_work;

create table research_work.faculty_staff  (
    professor_id smallint not null primary key
    , name varchar(120)
    , login varchar(15)
    , password varchar(15)
    , department_id smallint not null
    , birthday_dt date
    , staff_job smallint
    , dissertation_year smallint
    , dissertation_subject varchar(200)
    , scientific_speciality_key varchar(15)
    , dissertation_type smallint
    , academic_rank smallint
    , academic_rank_year smallint
    , candidate_of_science_diploma varchar(20)
    , doctor_of_science_diploma varchar(20)
    , associate_professor_certificate varchar(20)
    , full_professor_certificate varchar(20)
    , last_modified_dt date
);

create table research_work.department  (
    department_id smallint not null
    , department varchar(200)
    , faculty varchar(200)
    , research_work_id smallint not null
    , last_modified_dt date
);

create table research_work.job_faculty_staff  (
    professor_id smallint not null primary key
    , occupation varchar(120)
    , department_id smallint not null
    , job_start_dt date
    , job_end_dt date
    , last_modified_dt date
);

create table research_work.research_work  (
    research_work_id smallint not null
    , professor_id smallint not null
    , research_project varchar(250)
    , kind_of_research_project smallint
    , kind_of_research_grant smallint
    , research_project_number varchar(20)
    , research_project_start_dt date
    , research_project_end_dt date
    , funding_amt decimal(15,0)
    , funding varchar(200)
    , last_modified_dt date
);

create table research_work.research_work_x_faculty_staff (
    research_work_id smallint not null
    , professor_id smallint not null
    , research_activity smallint
    , last_modified_dt date
);

create table research_work.scientific_research_work_of_students  (
    srws_id smallint not null
    , professor_id smallint not null
    , student_research_project varchar(200)
    , research_project_desc varchar(250)
    , student_nm varchar(120)
    , student_group_number varchar(15)
    , student_research_project_start_dt date
    , student_research_project_end_dt date
    , student_research_project_place varchar(200)
    , student_research_project_result varchar(250)
    , student_publication_title varchar(200)
    , coauthor_nm varchar(120)
    , last_modified_dt date
);

create table research_work.publication_of_faculty_staff  (
    publication_id smallint not null
    , professor_id smallint not null
    , publication_title varchar(200)
    , publication_type smallint
    , article_type smallint
    , description_of_publication varchar(250)
    , publication_page_cnt smallint
    , last_modified_dt date
);

create table research_work.faculty_staff_x_publication  (
    professor_id smallint not null primary key
    , publication_id smallint not null
    , name varchar(120)
    , coauthor_nm varchar(120)
    , last_modified_dt date
);

alter table research_work.job_faculty_staff
add foreign key (professor_id)
references faculty_staff (professor_id);

alter table research_work.research_work
add foreign key (professor_id)
references faculty_staff (professor_id);

alter table research_work.research_work_x_faculty_staff
add foreign key (professor_id)
references faculty_staff (professor_id);

alter table research_work.scientific_research_work_of_students
add foreign key (professor_id)
references faculty_staff (professor_id);

alter table research_work.publication_of_faculty_staff
add foreign key (professor_id)
references faculty_staff (professor_id);

alter table research_work.faculty_staff_x_publication
add foreign key (professor_id)
references faculty_staff (professor_id);
