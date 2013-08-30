Q.3-Get list of all building names and no of open request for those building?

select b.buildingname buildingname,c3.n
from test1.buildings b,
(select c2.abi a,sum(c2.n1) n
from
(select apa.buildingid abi,c1.aid,c1.no n1
from test1.apartments apa,
(select apart.apartmentid aid,count(req.apartmentid) no
from test1.apartments apart left outer join test1.requests req
on(apart.apartmentid = req.apartmentid)
group by req.apartmentid) c1
where apa.apartmentid = c1.aid) c2
group by c2.abi) c3
where b.buildingid = c3.a


