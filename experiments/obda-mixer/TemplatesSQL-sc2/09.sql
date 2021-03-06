-- ${1:review.nr:percent}

SELECT v24."country3m1" AS "country3m1", v24."mbox_sha1sum1m47" AS "mbox_sha1sum1m47", v24."nr0m4" AS "nr0m4", v24."person2m7" AS "person2m7", v24."product2m4" AS "product2m4", v24."title2m11" AS "title2m11"
FROM (SELECT DISTINCT v7."country3m1" AS "country3m1", v7."mbox_sha1sum1m47" AS "mbox_sha1sum1m47", v7."name1m12" AS "name1m12", v12."nr0m4" AS "nr0m4", v7."person2m7" AS "person2m7", v17."product2m4" AS "product2m4", v22."title2m11" AS "title2m11"
FROM (SELECT v2."country" AS "country3m1", v2."mbox_sha1sum" AS "mbox_sha1sum1m47", v2."name" AS "name1m12", v1."person" AS "person2m7"
FROM "review" v1, "person" v2
WHERE (v2."name" IS NOT NULL AND v2."mbox_sha1sum" IS NOT NULL AND v2."country" IS NOT NULL AND v1."person" = v2."nr" AND ${1:review.nr:percent} = v1."nr")
UNION ALL 
SELECT v5."country" AS "country3m1", v5."mbox_sha1sum" AS "mbox_sha1sum1m47", v5."name" AS "name1m12", v4."person" AS "person2m7"
FROM "reviewc" v4, "person" v5
WHERE (v5."name" IS NOT NULL AND v5."mbox_sha1sum" IS NOT NULL AND v5."country" IS NOT NULL AND v4."person" = v5."nr" AND ${1:review.nr:percent} = v4."nr")
) v7, (SELECT v8."nr" AS "nr0m4", v8."person" AS "person2m0"
FROM "review" v8
WHERE v8."person" IS NOT NULL
UNION ALL 
SELECT v10."nr" AS "nr0m4", v10."person" AS "person2m0"
FROM "reviewc" v10
WHERE v10."person" IS NOT NULL
) v12, (SELECT v13."nr" AS "nr0m1", v13."product" AS "product2m4"
FROM "review" v13
WHERE v13."product" IS NOT NULL
UNION ALL 
SELECT v15."nr" AS "nr0m1", v15."product" AS "product2m4"
FROM "reviewc" v15
WHERE v15."product" IS NOT NULL
) v17, (SELECT v18."nr" AS "nr0m2", v18."title" AS "title2m11"
FROM "review" v18
WHERE v18."title" IS NOT NULL
UNION ALL 
SELECT v20."nr" AS "nr0m2", v20."title" AS "title2m11"
FROM "reviewc" v20
WHERE v20."title" IS NOT NULL
) v22
WHERE (v7."person2m7" = v12."person2m0" AND v12."nr0m4" = v17."nr0m1" AND v12."nr0m4" = v22."nr0m2")
) v24
