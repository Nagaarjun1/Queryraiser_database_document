use QueryRaiser;

create table UserType(typeid int primary key,typename varchar(200));

insert into UserType values(101,'HR');
insert into UserType values(102,'Director');
insert into UserType values(103,'Team Lead');
insert into UserType values(104,'Tech Advisor');
insert into UserType values(105,'Center Lead');
insert into UserType values(106,'Infra Head');

insert into UserType values(107,'management');

insert into UserType values(108,'training team lead');


insert into UserType values(109,'tech advisor');

insert into UserType values(110,'center lead');

insert into UserType values(111,'infra head');

insert into UserType values(112,'Student');

select * from UserType


create table Register(userid int identity(1,1),username varchar(200),emailid varchar(200) primary key,userpassword varchar(200),usertypeid int,foreign key(usertypeid) references UserType(typeid));




create table StatusTypes(statusid int primary key,statustype varchar(200));



insert into StatusTypes values(201,'New');
insert into StatusTypes values(202,'In-Process');
insert into StatusTypes values(203,'Hold');
insert into StatusTypes values(204,'Closed');



create table Priority(priorityid int primary key,priorityname varchar(200));

insert into Priority values (301,'High');
insert into Priority values (302,'Moderate');
insert into Priority values (303,'Low');
insert into Priority values (304,'General');

create table UserQueries(userqueryid int identity(20000,1) primary key,query varchar(250),usertypeid int foreign key references UserType(typeid),querystatusid int foreign key references StatusTypes(statusid),priorityid int references Priority(priorityid),submittedon datetime default getdate(),submittedby varchar(200),modifiedon varchar(250) ,modifiedby varchar(200) );


create table ResponseQueries(responsequeryid int identity(3000000,1) primary key,userqueryid int foreign key references UserQueries(userqueryid),statustypeid int foreign key references StatusTypes(statusid),responses varchar(250),responseon varchar(250),responseby varchar(100),modifiedon varchar(250),modifiedby varchar(250));



create table employQueryType(roleid int primary key,rolename varchar(200));
select * from employQueryType
insert into employQueryType values(101,'HR');
insert into employQueryType values(102,'Director');
insert into employQueryType values(103,'Team Lead');
insert into employQueryType values(104,'Tech Advisor');
insert into employQueryType values(105,'Center Lead');
insert into employQueryType values(106,'Infra Head');

create table studenttype(roleid int primary key,rolename varchar(200));

insert into studenttype values(107,'management');

insert into studenttype values(108,'training team lead');


insert into studenttype values(109,'tech advisor');

insert into studenttype values(110,'center lead');

insert into studenttype values(111,'infra head');

insert into studenttype values(112,'Student');


create table reviewtables(queryid int primary key,response varchar(250),review varchar(250),reviewer varchar(250),modifiedon varchar(250));

update UserQueries set querystatusid=r.statustypeid,modifiedon=r.responseon,modifiedby=r.responseby from UserQueries q left join ResponseQueries r on q.userqueryid=r.userqueryid


      update ResponseQueries set modifiedon=rt.modifiedon,modifiedby=rt.reviewer   from ResponseQueries r inner join reviewtables rt on r.userqueryid=rt.queryid

select u.userqueryid,u.query,ut.typename,s.statustype,p.priorityname,u.submittedon,u.submittedby,u.modifiedon,u.modifiedby from Userqueries u left join StatusTypes s on u.querystatusid=s.statusid inner join UserType ut on u.usertypeid=ut.typeid inner join Priority p on p.priorityid=u.priorityid where u.submittedby='abc@gmail.com'

select top 1  userqueryid from UserQueries order by submittedon desc

select * from UserQueries
select * from ResponseQueries
select * from Register
select * from reviewtables
select r.responsequeryid,u.userqueryid,u.query,s.statustype,p.priorityname,r.responses,r.responseby,r.modifiedon,r.modifiedby from UserQueries u left join StatusTypes s on u.querystatusid=s.statusid  inner join ResponseQueries r on u.userqueryid=r.userqueryid inner join Priority p on p.priorityid=u.priorityid where u.usertypeid=110







select u.userqueryid,u.query,u.submittedon,u.submittedby,s.statustype,k.review,r.responses,r.responseon,r.responseby,r.modifiedon,r.modifiedby from UserQueries u inner join reviewtables k on u.querystatusid=k.queryid inner join StatusTypes s on u.querystatusid=s.statusid  inner join ResponseQueries r on u.userqueryid=r.userqueryid  where u.usertypeid=106

select u.userqueryid,u.query,u.submittedon,u.submittedby,r.review,p.priorityname,rq.responses,rq.responseon,s.statustype,rq.responseby,rq.modifiedon,rq.modifiedby  from UserQueries u inner join reviewtables r on u.userqueryid=r.queryid inner join ResponseQueries rq on u.userqueryid=rq.userqueryid inner join Priority p on u.priorityid=p.priorityid left join StatusTypes s on u.querystatusid=s.statusid  where u.usertypeid=106

select u.userqueryid,u.query,u.submittedon,u.submittedby,s.statustype,rt.review,p.priorityname,r.responses,r.responseon,r.responseby,r.modifiedon,r.modifiedby from UserQueries u   inner join ResponseQueries r on u.userqueryid=r.userqueryid inner join Priority p on p.priorityid=u.priorityid inner join reviewtables rt on u.querystatusid=rt.queryid inner join StatusTypes s on u.querystatusid=s.statusid where u.usertypeid=106


select u.userqueryid,u.query,ut.typename,s.statustype,p.priorityname,rq.responses,u.submittedon,u.submittedby,u.modifiedon,u.modifiedby from Userqueries u left join StatusTypes s on u.querystatusid=s.statusid inner join UserType ut on u.usertypeid=ut.typeid inner join Priority p on p.priorityid=u.priorityid inner join ResponseQueries rq on u.userqueryid=rq.userqueryid where u.submittedby='abc@gmail.com'

select *  from UserQueries u where datediff(hh,u.submittedon,getdate()) = 5 and u.modifiedby is  null

select datediff(ss,'2024-05-15 13:27:36.670',getdate())

