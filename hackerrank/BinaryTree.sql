INSERT INTO public."BST"(
	"N", "P")
	VALUES (9, 8),
	(2,5),
	(8,5),
	(5,NULL);

SELECT * 
FROM public."BST"

select "N", 
    CASE 
        WHEN (("N" in (SELECT distinct "P" from public."BST")) AND ("P" is not null)) THEN 'Inner'
		WHEN "P" is NULL THEN 'Root'
        ELSE 'Leaf'
    END  node_type
FROM public."BST";

select "N",
	CASE 
		WHEN bst."P" IS NULL THEN 'Root' 
		WHEN cmp_bst."type" = 'Inner' THEN 'Inner' 
		ELSE 'Leaf'
	END As node_type
FROM public."BST" AS bst
LEFT JOIN (SELECT distinct "P", 'Inner' as type from public."BST" WHERE "P" is not null) As cmp_bst
ON bst."N" = cmp_bst."P"

SELECT "N" from public."BST"