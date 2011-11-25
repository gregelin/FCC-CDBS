Some Interesting Queries MySQL

select facility_id, max(callsign_seq_id), callsign from call_sign_history group by facility_id order by facility_id limit 10;
+-------------+----------------------+----------+
| facility_id | max(callsign_seq_id) | callsign |
+-------------+----------------------+----------+
|           1 |                    1 | WRCT     |
|           2 |                    4 | KGHM     |
|           3 |                    1 | WCLG     |
|           4 |                    4 | KZXY     |
|          11 |                    2 | KR2XVA   |
|          36 |                    2 | NEW00112 |
|          39 |                    2 | 781002IP |
|          43 |                    3 | 781016IB |
|          44 |                    1 | 781016IA |
|          48 |                    3 | K09ME    |
+-------------+----------------------+----------+
10 rows in set (0.21 sec)

select facility_id, max(callsign_seq_id), callsign from call_sign_history group by facility_id order by callsign limit 10;
+-------------+----------------------+-------------+
| facility_id | max(callsign_seq_id) | callsign    |
+-------------+----------------------+-------------+
|       14657 |                    2 | 10239       |
|       67615 |                    5 | 10244       |
|        2484 |                    3 | 10470       |
|       48453 |                    3 | 10774       |
|       55211 |                    3 | 11146       |
|       17380 |                    3 | 1748        |
|      170502 |                    2 | 20070426ADE |
|      174338 |                    2 | 20100302AAH |
|       25476 |                    2 | 20202       |
|       17047 |                    2 | 20246       |
+-------------+----------------------+-------------+
10 rows in set (0.40 sec)

select * from facility where facility_id=15648\G
*************************** 1. row ***************************
          comm_city: COEUR D'ALENE
         comm_state: ID
        eeo_rpt_ind: 
       fac_address1: 241 MAIN AVENUE, WEST
       fac_address2: 
       fac_callsign: DKTYJ-LP
        fac_channel: 58
           fac_city: TWIN FALLS
        fac_country: US
      fac_frequency: 734.000000
        fac_service: TX
          fac_state: ID
    fac_status_date: 2010-09-13
           fac_type: TTL
        facility_id: 15648
lic_expiration_date: 2014-10-01
         fac_status: LICAN
           fac_zip1: 83303
           fac_zip2: 
       station_type: M
  assoc_facility_id: 0
  callsign_eff_date: 2010-09-13
          tsid_ntsc: 0
           tsid_dtv: 0
     digital_status: 
             sat_tv: 
      network_affil: 
        nielsen_dma: 
   last_change_date: 2010-09-13
   
   
