SET search_path = public, research_work;

-- Задание 7
create view v_faculty_staff_1 as
    select
        v.name, v.birthday_dt
        , overlay (v.login placing '*****' from 4 for 9) "login"
        , overlay (v.password placing '*****' from 4 for 9) "password"
    from
        faculty_staff v
    where v.password is not null;

