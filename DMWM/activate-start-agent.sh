#! /bin/bash -e

rm -rf $DBSOCK || true
echo "Attempting to activate agent"
$PWD/deploy/current/config/wmagent/manage activate-agent
unlink deploy/current/sw*/var || /bin/true
echo "Starting services"
$PWD/deploy/current/config/wmagent/manage start-services

if [[ $SQL_FLAVOR == "oracle" ]]; then
  echo "Starting wmagent"
  $PWD/deploy/current/config/wmagent/manage init-agent

cat > show-tables.sql << EOT
SELECT tname FROM tab;
EOT

 $PWD/deploy/current/config/wmagent/manage db-prompt < show-tables.sql

fi
