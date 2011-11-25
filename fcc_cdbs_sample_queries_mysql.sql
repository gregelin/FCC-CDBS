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

select facility_id, max(callsign_seq_id), callsign from call_sign_history group by facility_id order by callsign desc limit 10;
+-------------+----------------------+----------+
| facility_id | max(callsign_seq_id) | callsign |
+-------------+----------------------+----------+
|       54864 |                    6 | WZZZ     |
|       56745 |                    1 | WZZX     |
|       15848 |                    2 | WZZW     |
|       43521 |                    7 | WZZV     |
|       37457 |                    3 | WZZRFM   |
|       59822 |                    3 | WZZQ-FM  |
|       59594 |                    4 | WZZP     |
|       54894 |                    2 | WZZP     |
|       49713 |                    3 | WZZM     |
|       48724 |                    2 | WZZK     |
+-------------+----------------------+----------+

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
   
   
select facility_id, fac_type, station_type, network_affil, lic_expiration_date from facility limit 10;
+-------------+----------+--------------+---------------+---------------------+
| facility_id | fac_type | station_type | network_affil | lic_expiration_date |
+-------------+----------+--------------+---------------+---------------------+
|          -3 |          |              |               | 0000-00-00          |
|          -2 |          |              |               | 0000-00-00          |
|          -1 |          |              |               | 0000-00-00          |
|           0 |          |              |               | 2011-12-01          |
|           1 | ED       | M            |               | 2014-08-01          |
|           2 |          | M            |               | 2013-02-01          |
|           3 |          | M            |               | 2019-10-01          |
|           4 |          | M            |               | 2013-12-01          |
|          11 | EX       | M            |               | 2001-08-01          |
|          36 | ED       | M            |               | 0000-00-00          |
+-------------+----------+--------------+---------------+---------------------+

select csh.facility_id, csh.callsign,
f.station_type, f.fac_type, f.fac_city, f.lic_expiration_date
from call_sign_history csh, facility f 
where
csh.callsign = 'WZZK'
and csh.facility_id = f.facility_id
limit 10;
-- slow and needs indices

set @callsign = 'DKTYJ-LP';
select csh.facility_id, csh.callsign,
f.station_type, f.fac_type, f.fac_city, f.lic_expiration_date
from call_sign_history csh, facility f 
where
csh.callsign = @callsign
and csh.facility_id = f.facility_id
limit 10;

set @callsign = 'KAWN';
select csh.facility_id, csh.callsign,
f.station_type, f.fac_type, f.fac_city, f.lic_expiration_date
from call_sign_history csh, facility f 
where
csh.callsign = @callsign
and csh.facility_id = f.facility_id
limit 10;

set @callsign = '%WA%';
select csh.facility_id, csh.callsign,
f.station_type, f.fac_type, f.fac_frequency, f.fac_city, f.lic_expiration_date
from call_sign_history csh, facility f 
where
csh.callsign like @callsign
and csh.facility_id = f.facility_id
limit 10;
+-------------+----------+--------------+----------+---------------+-------------------+---------------------+
| facility_id | callsign | station_type | fac_type | fac_frequency | fac_city          | lic_expiration_date |
+-------------+----------+--------------+----------+---------------+-------------------+---------------------+
|          64 | WAVX     | M            |          |   1330.000000 | MILTON            | 2012-02-01          |
|          91 | WASQ     | M            | H        |    106.099998 | MURFREESBORO      | 2011-12-01          |
|         131 | WAYQ     | M            | CDT      |    680.000000 | ALTAMONTE SPRINGS | 2013-02-01          |
|         132 | WAZL     | M            |          |   1490.000000 | LAS VEGAS         | 2014-08-01          |
|         133 | WAOZ     | M            | H        |     97.900002 | LAS VEGAS         | 2014-08-01          |
|         257 | WWAT-CA  | M            | TTA      |    656.000000 | WASHINGTON        | 2015-08-01          |
|         317 | WABRFM   | M            | ED       |    103.099998 | TIFTON            | 2012-04-01          |
|         317 | WABR-FM  | M            | ED       |    103.099998 | TIFTON            | 2012-04-01          |
|         318 | WAIM-FM  | M            | H        |    101.099998 | GREENVILLE        | 2011-12-01          |
|         361 | WACY     | M            | CDT      |    548.000000 | GREEN BAY         | 2005-12-01          |
+-------------+----------+--------------+----------+---------------+-------------------+---------------------+


set @city = 'GREEN BAY';
select csh.facility_id, csh.callsign, csh.callsign_hist_id, csh.callsign_seq_id, csh.begin_date,
f.station_type, f.fac_type, f.fac_frequency, f.fac_city, f.lic_expiration_date
from call_sign_history csh, facility f 
where
f.fac_city = @city
and csh.facility_id = f.facility_id
limit 10;
+-------------+----------+------------------+-----------------+------------+--------------+----------+---------------+-----------+---------------------+
| facility_id | callsign | callsign_hist_id | callsign_seq_id | begin_date | station_type | fac_type | fac_frequency | fac_city  | lic_expiration_date |
+-------------+----------+------------------+-----------------+------------+--------------+----------+---------------+-----------+---------------------+
|         361 | WBUO     |            74999 |               1 | 0000-00-00 | M            | CDT      |    548.000000 | GREEN BAY | 2005-12-01          |
|         361 | WBUO     |            75000 |               2 | 1983-04-25 | M            | CDT      |    548.000000 | GREEN BAY | 2005-12-01          |
|         361 | WXGZ-TV  |            75001 |               3 | 1984-01-25 | M            | CDT      |    548.000000 | GREEN BAY | 2005-12-01          |
|         361 | WACY     |           128974 |               4 | 1995-08-28 | M            | CDT      |    548.000000 | GREEN BAY | 2005-12-01          |
|        2708 | WLRE     |            76617 |               1 | 0000-00-00 | M            | CDT      |    632.000000 | GREEN BAY | 2013-12-01          |
|        2708 | WGBA     |           129665 |               2 | 1985-10-03 | M            | CDT      |    632.000000 | GREEN BAY | 2013-12-01          |
|        2711 | JD0415XT |            76621 |               1 | 0000-00-00 | M            | TTA      |    518.000000 | GREEN BAY | 2013-12-01          |
|        2711 | W22BW    |            76622 |               2 | 1994-12-30 | M            | TTA      |    518.000000 | GREEN BAY | 2013-12-01          |
|        2711 | DW22BW   |            76623 |               3 | 1996-10-29 | M            | TTA      |    518.000000 | GREEN BAY | 2013-12-01          |
|        2711 | W22BW    |           129668 |               4 | 1997-03-17 | M            | TTA      |    518.000000 | GREEN BAY | 2013-12-01          |
+-------------+----------+------------------+-----------------+------------+--------------+----------+---------------+-----------+---------------------+


set @city = 'GREEN BAY';
select csh.facility_id, csh.callsign, csh.callsign_hist_id,  csh.callsign_seq_id, csh.begin_date,
f.station_type, f.fac_type, f.fac_frequency, f.fac_city, f.lic_expiration_date
from call_sign_history csh, facility f 
where
f.fac_city = @city
and csh.facility_id = f.facility_id
order by f.facility_id, csh.callsign_seq_id desc;
+-------------+----------+------------------+--------------------------+------------+--------------+----------+---------------+-----------+---------------------+
| facility_id | callsign | callsign_hist_id | max(csh.callsign_seq_id) | begin_date | station_type | fac_type | fac_frequency | fac_city  | lic_expiration_date |
+-------------+----------+------------------+--------------------------+------------+--------------+----------+---------------+-----------+---------------------+
|         361 | WBUO     |            74999 |                        5 | 0000-00-00 | M            | CDT      |    548.000000 | GREEN BAY | 2005-12-01          |
|        2708 | WLRE     |            76617 |                        3 | 0000-00-00 | M            | CDT      |    632.000000 | GREEN BAY | 2013-12-01          |
|        2711 | JD0415XT |            76621 |                        4 | 0000-00-00 | M            | TTA      |    518.000000 | GREEN BAY | 2013-12-01          |
|        2712 | JD0415XU |            76624 |                        2 | 1995-09-27 | M            | TTL      |    572.000000 | GREEN BAY | 2013-10-01          |
|        4098 | 890706MB |            77410 |                        4 | 0000-00-00 | M            | H        |     94.699997 | GREEN BAY | 2012-12-01          |
|       19879 | WSGC     |            86850 |                        2 | 1993-07-29 | M            |          |   1050.000000 | GREEN BAY | 2012-12-01          |
|       25119 | WDUZ     |           136425 |                        3 | 0000-00-00 | M            |          |   1400.000000 | GREEN BAY | 2012-12-01          |
|       25121 | WDUZFM   |            90012 |                        3 | 0000-00-00 | M            | H        |     98.500000 | GREEN BAY | 2012-12-01          |
|       36245 | WDUX     |           139522 |                        1 | 0000-00-00 | M            |          |    800.000000 | GREEN BAY | 2012-12-01          |
|       36246 | WDUXFM   |            96742 |                        2 | 0000-00-00 | M            | H        |     92.699997 | GREEN BAY | 2012-12-01          |
|       36412 | 880406MK |            96867 |                        2 | 0000-00-00 | M            | ED       |     90.099998 | GREEN BAY | 2012-12-01          |
|       47751 | W75AJ    |           103382 |                        1 | 0000-00-00 | M            | TTV      |      0.000000 | GREEN BAY | 1988-08-01          |
|       49445 | 820615TA |           104448 |                        3 | 0000-00-00 | M            | TTL      |    656.000000 | GREEN BAY | 0000-00-00          |
|       51158 | 920512MB |           105426 |                        2 | 0000-00-00 | M            | H        |     92.900002 | GREEN BAY | 0000-00-00          |
|       53403 | WGBPFM   |           107091 |                        3 | 0000-00-00 | M            | ED       |     90.099998 | GREEN BAY | 1982-12-01          |
|       69486 | WUAA     |           119006 |                        3 | 1989-11-06 | M            | CT       |    500.000000 | GREEN BAY | 0000-00-00          |
|       71114 | 880421NZ |           120286 |                        2 | 0000-00-00 | M            | H        |     93.099998 | GREEN BAY | 0000-00-00          |
|       73056 | 830315MO |           121792 |                        5 | 0000-00-00 | M            | FT       |     96.900002 | GREEN BAY | 2012-12-01          |
|       73232 | W83AN    |           152060 |                        2 | 0000-00-00 | M            | TT       |    884.000000 | GREEN BAY | 1983-08-01          |
|       74417 | WBAY     |           122841 |                        2 | 0000-00-00 | M            | CDT      |    524.000000 | GREEN BAY | 2013-12-01          |
|       81328 | WGLI     |           159433 |                        1 | 2002-09-12 | M            | H        |     98.699997 | GREEN BAY | 2012-10-01          |
|       81829 | 960507M2 |           170584 |                        1 | 1996-05-07 | M            | H        |     92.900002 | GREEN BAY | 0000-00-00          |
|       82091 | WJOK     |           123911 |                        4 | 1998-07-12 | M            | H        |    101.699997 | GREEN BAY | 2012-08-01          |
|       84242 | KAWN     |           124170 |                        3 | 1997-07-11 | M            | ED       |     95.500000 | GREEN BAY | 2013-02-01          |
|       84861 | WDLS     |           124255 |                        3 | 1998-07-06 | M            | H        |     94.099998 | GREEN BAY | 0000-00-00          |
|       85062 | 970103MA |           159773 |                        2 | 1997-01-03 | M            | H        |     99.500000 | GREEN BAY | 2013-02-01          |
+-------------+----------+------------------+--------------------------+------------+--------------+----------+---------------+-----------+---------------------+


select names, count(*) as counts from ownership_relationships group by names order by names limit 20;
+-------------------------------------------+--------+
| names                                     | counts |
+-------------------------------------------+--------+
|                                           |     32 |
| A. GARY & SANDRA C. MULLER, JOINT TENANTS |      4 |
| A. WRAY FITCH III AND ELIZABETH B. FITCH  |      4 |
| A.D. FRAZIER, JR./CLAIR WOFFORD FRAZIER   |      5 |
| AAREN F. JAMES                            |      3 |
| AARON B. LATTO                            |      2 |
| AARON M. & MARY REMINGTON                 |      1 |
| AARON SUSSMAN                             |      1 |
| AARON WEBSTER                             |      2 |
| ABRAHAM L. WARSHAW, M.D./IRA WARSHAW      |      1 |
| ABRAHAM L. WARSHW, M.D.                   |      1 |
| ABRAHAM L. WASHINGTON                     |      1 |
| ABRAHAM THOMPSON/PHOENIX THOMPSON         |      2 |
| ADAM  BEAL                                |      1 |
| ADAM GEARHEART/SUSAN SCHMOLDT             |      1 |
| ADAM M. STOCKS AND KAREN R. STOCKS        |      1 |
| ADELLE PENN-BROWN / AUDAIN BROWN          |      2 |
| ADRIAN OJEDA                              |      1 |
| ADRIAN QUINONES AND GUADALUPE QUINONES    |      1 |
| ADRIENNE J. WEISS                         |      4 |
+-------------------------------------------+--------+

select names, count(*) as counts from ownership_relationships group by names order by counts desc limit 50;
+------------------------------------------------------------------------------------------------------------------------+--------+
| names                                                                                                                  | counts |
+------------------------------------------------------------------------------------------------------------------------+--------+
| SUMNER M. REDSTONE AND SHARI E. REDSTONE                                                                               |    180 |
| RANDALL T. MAYS AND MARK P. MAYS                                                                                       |    134 |
| LAURA CASTRO                                                                                                           |     98 |
| ROXANNE STOREY                                                                                                         |     98 |
| LORNA MACINTOSH                                                                                                        |     84 |
| BARBARA B. ALLBRITTON AND ROBERT L. ALLBRITTON                                                                         |     68 |
| JOSE LIBERMAN AND LENARD LIBERMAN                                                                                      |     68 |
| JAMES F. GOODMON/JAMES F. GOODMON, JR.                                                                                 |     61 |
| JACK W. FRITZ                                                                                                          |     58 |
| ROBERT L. WILKINS AND LUANN WILKINS                                                                                    |     57 |
| MARIO J. GABELLI                                                                                                       |     56 |
| CAROLINE BEASLEY, BRIAN E. BEASLEY AND BRUCE G. BEASLEY                                                                |     54 |
| CAROLINE BEASLEY AND BRUCE G. BEASLEY                                                                                  |     53 |
| GEORGE BEASLEY, CAROLINE, BRIAN, & BRUCE                                                                               |     51 |
| CAROLINE, BRIAN, & BRUCE BEASLEY                                                                                       |     51 |
| GEORGE G. BEASLEY AND SHIRLEY W. BEASLEY                                                                               |     50 |
| DAVID D. SMITH, J. DUNCAN SMITH, ROBERT E. SMITH, AND FREDERICK G. SMITH                                               |     49 |
| WILLIAM R. HEARST III AND AUSTIN HEARST                                                                                |     49 |
| GEORGE R. HEARST, JR. AND GEORGE R. HEARST III                                                                         |     49 |
| GEORGE R. HEARST, JR. AND STEPHEN T. HEARST                                                                            |     49 |
| GEORGE R. HEARST III AND STEPHEN T. HEARST                                                                             |     49 |
| LEWIS W. DICKEY, JR. AND JOHN W. DICKEY                                                                                |     49 |
| GEORGE G. BEASLEY AND CAROLINE BEASLEY, BRIAN G. BEASLEY, AND BRUCE G. BEASLEY                                         |     48 |
| SHIRLEY W. BEASLEY AND CAROLINE BEASLEY, BRIAN G. BEASLEY, AND BRUCE G. BEASLEY                                        |     48 |
| CAROLINE BEASLEY, BRIAN G. BEASLEY, AND BRUCE G. BEASLEY                                                               |     48 |
| JACK W. FRITZ II                                                                                                       |     48 |
| DAVID D. SMITH, J. DUNCAN SMITH, FREDERICK G. SMITH AND ROBERT E. SMITH                                                |     48 |
| JOSEPH M. FIELD & DAVID J. FIELD                                                                                       |     46 |
| ANDREW SUMRALL                                                                                                         |     46 |
| NAOMI SMITH                                                                                                            |     42 |
| KATHRYN H. ROMINSKI, STANLEY E. HUBBARD, VIRGINIA H. MORRIS, AND ROBERT W. HUBBARD ARE SIBLINGS                        |     41 |
| STANLEY S. HUBBARD IS THE PARENT OF KATHRYN H. ROMINSKI, STANLEY E. HUBBARD, VIRGINIA H. MORRIS, AND ROBERT W. HUBBARD |     41 |
| BRIAN J. PARENTE & MARLA PARENTE                                                                                       |     40 |
| MARILYN J. FRITZ                                                                                                       |     38 |
| MARC NATHANSON AND JANE NATHANSON                                                                                      |     36 |
| CAROLINE, BRIAN & BRUCE BEASLEY                                                                                        |     35 |
| GEORGE BEASLEY, CAROLINE, BRIAN & BRUCE                                                                                |     33 |
| HENRY BRADLEY                                                                                                          |     33 |
|                                                                                                                        |     32 |
| MARIO GABELLI                                                                                                          |     32 |
| JOHN PARENTE & BRIAN J. PARENTE                                                                                        |     30 |
| JOHN PARENTE & CHARLES L. PARENTE                                                                                      |     30 |
| JOHN PARENTE & MARLA PARENTE                                                                                           |     30 |
| BRIAN J. PARENTE & CHARLES L. PARENTE                                                                                  |     30 |
| CHARLES L. PARENTE & MARLA PARENTE                                                                                     |     30 |
| REGINA M. PITARO                                                                                                       |     29 |
| TERRY E. FORCHT AND MARION C. FORCHT                                                                                   |     29 |
| MICHAEL STEPHENS AND DAVID STEPHENS                                                                                    |     27 |
| JAMES F. GOODMON/MICHAEL J. GOODMON                                                                                    |     27 |
| JAMES F. GOODMON, JR./MICHAEL J. GOODMON                                                                               |     27 |
+------------------------------------------------------------------------------------------------------------------------+--------+

select table_schema,table_name,column_name,data_type,column_comment from columns where table_name='facility';
+--------------+------------+---------------------+-----------+----------------+
| table_schema | table_name | column_name         | data_type | column_comment |
+--------------+------------+---------------------+-----------+----------------+
| cdbs         | facility   | comm_city           | varchar   |                |
| cdbs         | facility   | comm_state          | char      |                |
| cdbs         | facility   | eeo_rpt_ind         | char      |                |
| cdbs         | facility   | fac_address1        | varchar   |                |
| cdbs         | facility   | fac_address2        | varchar   |                |
| cdbs         | facility   | fac_callsign        | char      |                |
| cdbs         | facility   | fac_channel         | int       |                |
| cdbs         | facility   | fac_city            | varchar   |                |
| cdbs         | facility   | fac_country         | char      |                |
| cdbs         | facility   | fac_frequency       | float     |                |
| cdbs         | facility   | fac_service         | char      |                |
| cdbs         | facility   | fac_state           | char      |                |
| cdbs         | facility   | fac_status_date     | date      |                |
| cdbs         | facility   | fac_type            | varchar   |                |
| cdbs         | facility   | facility_id         | int       |                |
| cdbs         | facility   | lic_expiration_date | date      |                |
| cdbs         | facility   | fac_status          | varchar   |                |
| cdbs         | facility   | fac_zip1            | char      |                |
| cdbs         | facility   | fac_zip2            | char      |                |
| cdbs         | facility   | station_type        | char      |                |
| cdbs         | facility   | assoc_facility_id   | int       |                |
| cdbs         | facility   | callsign_eff_date   | date      |                |
| cdbs         | facility   | tsid_ntsc           | int       |                |
| cdbs         | facility   | tsid_dtv            | int       |                |
| cdbs         | facility   | digital_status      | char      |                |
| cdbs         | facility   | sat_tv              | char      |                |
| cdbs         | facility   | network_affil       | varchar   |                |
| cdbs         | facility   | nielsen_dma         | varchar   |                |
| cdbs         | facility   | last_change_date    | date      |                |
+--------------+------------+---------------------+-----------+----------------+


INDEX
=====
select table_schema,table_name,column_name,data_type,character_maximum_length,column_comment from columns where table_name='facility';
CREATE INDEX facility_id ON facility (facility_id);
CREATE INDEX facility_id ON call_sign_history (facility_id);
CREATE INDEX callsign ON call_sign_history (callsign);

COMMENTS
========
-- am_ant_sys
am_dom_status|Engineering status of record|^|
ant_dir_ind|Indicates whether the antenna is directional or not|^|
ant_mode|Mode of the complete antenna system.  It indicates whether directional or non-directional, number of patterns, etc.  For example:  DA1, DA2, DAN, ND1, ND2 ant_sys_id|Identifies a specific antenna within a facility.
application_id|Uniquely identifies an application|^|
aug_count|The count of the total number of augmentations in the array (minimum = 0; maximum|= 28) augmented_ind|Indicates if the antenna is augmented Y or not N.|^|
bad_data_switch|Indicates whether some parameters in this record are known to be bad. spaces:  no bad data. B:  some (undefined) data is known to be bad. V:  Antenna parameters  affecting|calculations in the vertical plane are known to be bad; antenna parameters  affecting biased_lat|Digital Latitude: Calculated value; (latitude degrees +90) + (lat_min/60) + (lat_sec/3600).  Used for indexing.  Eliminates negative values biased_long|Digital Longitude, Calculated value:  (degrees+180) + (minutes/60) + (seconds/3600). Used for indexing.  Eliminates negative values domestic_pattern|Type of directional antenna pattern, as authorized domestically.  T:  Theoretical.  S: Standard. A:  Augmented. dummy_data_switch|Indicates whether some of the parameters in this record are assumed values, rather than|actual values.  Possible values are: spaces:  nothing is assumed.  D:  something  (undefined) is assumed in this record.  V:  Antenna parameters affecting calculations  efficiency_restricted|Restricted antenna radiation efficiency_theoretical|The antenna radiation at 1 km from the antenna. Same as RMS Theoritical|^|
eng_record_type|Flag indicating the type of Engineering record this is.A: Archive C: Current|^|
feed_circ_other|Text describing the type of feed circuit when the feed circuit is not one of the standard|types. feed_circ_type|Identifies the type of feed circuit used with the antenna:  Series Feed; Folded Unipole; Shunt Feed; Other. grandfathered_ind|Indicates whether or not the rules are grandfathered|^|
hours_operation|The operating hours during which the parameters are used.  Values:  U:  Unlimited (both day and night or portions thereof); N:  Nighttime; D:  Daytime; C:  Critical  Hours; R:  Canadian Restricted; P:  Pre-sunrise. last_update_date|The date this record was last updated.|^|
lat_deg|The degrees portion of the latitude|^|
lat_dir|The direction for the latitude: N for North latitude and S for South.|^|
lat_min|The minutes portion of the latitude|^|
lat_sec|The seconds portion of the latitude|^|
lat_whole_secs|Latitude, expressed in seconds|^|
lon_deg|The degrees portion of the longitude|^|
lon_dir|The direction for the longitude: W for West longitude and E for East.|^|
lon_min|The minutes portion of the longitude|^|
lon_sec|The seconds portion of the longitude|^|
lon_whole_secs|Longitude, expressed in seconds|^|
mainkey|Primary Key in legacy database. Not maintained in CDBS.|^|
power|Nominal Power (Night)|^|
q_factor|Q for the standard pattern formula in 73.150.  When this is blank, Q should be computed|and used.  When this is non-blank (including 0), this value of Q should be  used|as a special Q.  Units are mV/m at 1 km. q_factor_custom_ind|Indicates that this record had a custom-entered q-factor in legacy.|^|
rms_augmented|RMS is the root-mean-square of the augmented standard radiation pattern in all directionsin the horizontal plane in mV/m at 1 km. Computed by formula in 73.152 rms_standard|The RMS of the standard radiation pattern in all directions in the horizontal plane computed by 73.150 
rms_theoretical|The root-mean-square of the radiation pattern in all directions in the horizontal plane in mV/m at 1 km, computed by formula in 73.150.  Directional Antenna:  RMS at  the|nominal power. Non-Directional Antenna:  RMS at 1 kw. specified_hrs_range|Additional information to be included on AM authorization for stations that operate during specified hours 
tower_count|The total number of towers in the array: (1 for Non-Directional; up to 17 for |^|


   
