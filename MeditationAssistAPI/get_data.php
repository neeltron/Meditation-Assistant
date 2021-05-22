<?php
$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => 'https://283e1ddd-4e72-41eb-803c-e60e3fc110fd-ap-southeast-1.apps.astra.datastax.com/api/rest/v1/keyspaces/medit/tables/meditation_data/rows/',
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => '',
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => 'GET',
  CURLOPT_HTTPHEADER => array(
    'x-cassandra-token: AstraCS:xhBjfKLDpPMGTCKtehiGvZpI:b3bfb25ee7ddd85b05d2bd5dc8f777bb8d034924911b7e8b47a9af46e6ada44e'
  ),
));
$response = curl_exec($curl);
curl_close($curl);
echo $response;
?>