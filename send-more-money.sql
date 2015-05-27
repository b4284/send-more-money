create table smm_digits (n smallint);

insert into smm_digits values (1);
insert into smm_digits values (2);
insert into smm_digits values (3);
insert into smm_digits values (4);
insert into smm_digits values (5);
insert into smm_digits values (6);
insert into smm_digits values (7);
insert into smm_digits values (8);
insert into smm_digits values (9);
insert into smm_digits values (0);

select s.n*1000 + e.n*100 + n.n*10 + d.n send,
       m.n*1000 + o.n*100 + r.n*10 + e.n more,
       m.n*10000 + o.n*1000 + n.n*100 + e.n*10 + y.n money
  from smm_digits s,
       smm_digits m,
       smm_digits e,
       smm_digits r,
       smm_digits o,
       smm_digits d,
       smm_digits y,
       smm_digits n
 where s.n > 0
   and m.n > 0
   and s.n not in (m.n, e.n, r.n, o.n, d.n, y.n, n.n)
   and m.n not in (s.n, e.n, r.n, o.n, d.n, y.n, n.n)
   and e.n not in (m.n, s.n, r.n, o.n, d.n, y.n, n.n)
   and r.n not in (m.n, e.n, s.n, o.n, d.n, y.n, n.n)
   and o.n not in (m.n, e.n, r.n, s.n, d.n, y.n, n.n)
   and d.n not in (m.n, e.n, r.n, o.n, s.n, y.n, n.n)
   and y.n not in (m.n, e.n, r.n, o.n, d.n, s.n, n.n)
   and n.n not in (m.n, e.n, r.n, o.n, d.n, y.n, s.n)
   and s.n*1000 + e.n*100 + n.n*10 + d.n + m.n*1000 + o.n*100 + r.n*10 + e.n
       = m.n*10000 + o.n*1000 + n.n*100 + e.n*10 + y.n;
       
      
