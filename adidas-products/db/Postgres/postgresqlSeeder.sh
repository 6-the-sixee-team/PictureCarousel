psql -d adidas_product -a -f schema.sql

for i in {1..10}
do
  echo "COPY shoe(shoe_id) FROM '../seedData/seededCSVFiles/seeded${i}.csv' DELIMITER=',' CSV HEADER;" > queries.sql

  echo "\\\copy shoe (trip_uuid, trip_name, available, overview, mobile_ticket, may_cancel, instant_confirm, languages, recommend, departure_location, return_location, includes, excludes, duration, info) FROM 'db/pgtrip"${i}".csv' DELIMITER ',' CSV HEADER;" > db/postgresQueries.sql
done

