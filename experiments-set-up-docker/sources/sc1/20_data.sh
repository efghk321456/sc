#!/bin/bash
set -e

for table in producer product producttype producttypeproduct productfeature productfeatureproduct vendor offer person review; do
	csv=/data/$table.csv.gz
	if [ -f "$csv" ]; then
		echo -e "\nLoading $csv"
		columns=`zcat $csv | head -n1` || true
		sql="COPY $table($columns) FROM STDIN WITH CSV HEADER NULL '' DELIMITER ',';"
		zcat $csv | psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -c "$sql"
	fi
done
