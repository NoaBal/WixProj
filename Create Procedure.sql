alter procedure  insertMale
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_male 
select gender,name_first ,name_last ,age, registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'

)
end
;

alter procedure  insertFemale
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_female 
select gender,name_first ,name_last ,age, registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end


alter procedure  insertNoaTest10
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_10 
select gender,name_first ,name_last ,age ,registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end
;
alter procedure  insertNoaTest20
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_20 
select gender,name_first ,name_last ,age ,registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end
;
alter procedure  insertNoaTest30
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_30 
select gender,name_first ,name_last ,age ,registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end
;
alter procedure  insertNoaTest40
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_40 
select gender,name_first ,name_last ,age ,registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end
;
alter procedure  insertNoaTest50
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_50 
select gender,name_first ,name_last ,age ,registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end
;
alter procedure  insertNoaTest60
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_60 
select gender,name_first ,name_last ,age ,registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end
;
alter procedure  insertNoaTest70
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_70 
select gender,name_first ,name_last ,age ,registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end
;
alter procedure  insertNoaTest80
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_80 
select gender,name_first ,name_last ,age ,registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end
;
alter procedure  insertNoaTest90
(@json varchar(MAX) = '')
as 
Begin 

Insert into noa_test_90 
select gender,name_first ,name_last ,age ,registrated_date
from OPENJSON(@json)
with (
	gender varchar(50) '$.gender',
	name_first varchar(50) '$.name.first',
	name_last varchar(50) '$.name.last',
	age varchar(50) '$.dob.age',
	registrated_date varchar(50) '$.registered.date'
)
end
;

alter procedure  insertNoaTestTop20
as
begin
Insert into noa_test_top_20_gender 
select t.gender,t.name_first ,t.name_last ,t.age ,t.registrated_date
from
(
select a.*
	from
	(select *,
			ROW_NUMBER() over (order by CAST(registrated_date AS DATE)) as t1
		from noa_test_female
	) as a
where a.t1 <=20

union all

select b.*
	from
	(select *,
			ROW_NUMBER() over (order by CAST(registrated_date AS DATE)) as t1
		from noa_test_male
	) as b
where b.t1 <=20
) as t
end
;

alter procedure  insertNoaTestTop5
as
begin
Insert into noa_test_top_5_gender 
select t.gender,t.name_first ,t.name_last ,t.age ,t.registrated_date
from
(
select a.*
	from
	(select *,
			ROW_NUMBER() over (order by CAST(registrated_date AS DATE)) as t1
		from noa_test_female
	) as a
where a.t1 <=5

union all

select b.*
	from
	(select *,
			ROW_NUMBER() over (order by CAST(registrated_date AS DATE)) as t1
		from noa_test_male
	) as b
where b.t1 <=5
) as t
end
;
alter procedure  insertNoaTestTop2
as
begin
Insert into noa_test_top_2_gender 
select t.gender,t.name_first ,t.name_last ,t.age ,t.registrated_date
from
(
select a.*
	from
	(select *,
			ROW_NUMBER() over (order by CAST(registrated_date AS DATE)) as t1
		from noa_test_female
	) as a
where a.t1 <=2

union all

select b.*
	from
	(select *,
			ROW_NUMBER() over (order by CAST(registrated_date AS DATE)) as t1
		from noa_test_male
	) as b
where b.t1 <=2
) as t
end
;
alter procedure  insertNoaTestQuestion6
as
begin
Insert into noa_test_question_6 
select t.gender,t.name_first ,t.name_last ,t.age ,t.registrated_date
from
(
select *
from noa_test_top_20_gender

union 

select *
from noa_test_top_5_gender

) as t
end
;
alter procedure  insertNoaTestQuestion7
as
begin
Insert into noa_test_question_7
select t.gender,t.name_first ,t.name_last ,t.age ,t.registrated_date
from
(
select *
from noa_test_top_20_gender

union all

select *
from noa_test_top_2_gender

) as t
end