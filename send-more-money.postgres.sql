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

select s*1000 + e*100 + n*10 + d send,
       m*1000 + o*100 + r*10 + e more,
       m*10000 + o*1000 + n*100 + e*10 + y money
  from (select s.n s, m.n m, e.n e, r.n r, o.n o, d.n d, y.n y, n.n n
          from smm_digits s,
               smm_digits m,
               smm_digits e,
               smm_digits r,
               smm_digits o,
               smm_digits d,
               smm_digits y,
               smm_digits n) a
 where s > 0
   and m > 0
   and s not in (m, e, r, o, d, y, n)
   and m not in (s, e, r, o, d, y, n)
   and e not in (m, s, r, o, d, y, n)
   and r not in (m, e, s, o, d, y, n)
   and o not in (m, e, r, s, d, y, n)
   and d not in (m, e, r, o, s, y, n)
   and y not in (m, e, r, o, d, s, n)
   and n not in (m, e, r, o, d, y, s)
   and s*1000 + e*100 + n*10 + d + m*1000 + o*100 + r*10 + e
       = m*10000 + o*1000 + n*100 + e*10 + y;
       
      
