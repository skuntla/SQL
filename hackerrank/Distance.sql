INSERT INTO public.distance(
	origin, destination, distance)
	VALUES ('Chennai', 'Pune',500),
			('Pune', 'Chennai',500),
			('Banglore', 'Hyderabad',400),
			('Mumbai', 'Goa',600),
			('Goa', 'Mumbai',600),
			('Delhi', 'Punjab',700),
			('Punjab', 'Delhi',700);
	
ALTER TABLE distance
ALTER COLUMN destination TYPE varchar

SELECT A.origin,A.destination,A.distance
FROM distance as A, distance as B
WHERE A.destination = B.origin 

SELECT A.origin,A.destination,A.distance FROM (SELECT row_number() OVER () as row_num,* FROM distance) as A
JOIN (SELECT row_number() OVER () as row_num,* FROM distance ) as B
ON A.origin = B.destination 
AND A.destination = B.origin
WHERE A.row_num< B.row_num
	  
WITH cte as
	(SELECT row_number() OVER () as id, * FROM distance )
	
SELECT T1.origin,T1.destination,T1.distance 
FROM cte as T1
INNER JOIN cte as T2
ON T1.origin = T2.destination
WHERE T1.id<T2.id