select count(*) from proteins;
select * from proteins;

explain select * from proteins where pid like "5HT%";


create index idx1 on proteins(pid);
create unique index idx2 on proteins(accession);
alter table proteins drop index idx2;

create unique index idx3 on proteins(accession,pid);


alter table proteins add constraint acc_pk primary key(accession);

