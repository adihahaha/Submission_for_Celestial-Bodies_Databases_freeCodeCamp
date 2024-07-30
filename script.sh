#!/bin/bash

# Add data to galaxy_type table in universe database

echo -e "~~TO ADD DATA TO universe DATABASE~~\n\n"

PSQL="psql -X --username=freecodecamp --dbname=universe --no-align --tuples-only -c"

echo $($PSQL "TRUNCATE moon")
echo $($PSQL "ALTER SEQUENCE moon_moon_id_seq RESTART WITH 1")

cat moon.csv | while IFS="," read NAME PLANET MASS PERIOD 
do
  # Get planet_id for the planet
  echo "$PLANET for $NAME"
  
  PLANET_ID=$($PSQL "SELECT planet_id FROM planet WHERE name='$PLANET'")
  
  if [[ -z $PLANET_ID ]]; then
    echo "Failed to get planet_id for $PLANET"
  else
    echo "Planet ID: $PLANET_ID for $NAME"
  fi

  # Insert into table: planet
  INSERT_MOON=$($PSQL "INSERT INTO moon(name, planet_id, mass, period) VALUES('$NAME', $PLANET_ID, '$MASS', '$PERIOD')")
  
  # Check if inserted
  if [[ $? -eq 0 ]]
  then
    echo "Inserted $NAME into moon"
  else
    echo "Insertion of $NAME failed"
  fi
  
  echo
  echo
done
