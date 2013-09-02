Q.3-Get list of all buildings and no of open request for that building?

select b.buildingname,ifnull(c3.n,0) "no of open request"
from test1.buildings b left outer join 
(select c2.abi a,sum(c2.n1) n
from
(select apa.buildingid abi,c1.aid,c1.no n1
from test1.apartments apa,
(select req.apartmentid aid,count(req.apartmentid) no,req.status
from test1.requests req
group by req.apartmentid
having req.status = 'open') c1
where apa.apartmentid = c1.aid) c2
group by c2.abi) c3
on(b.buildingid = c3.a)