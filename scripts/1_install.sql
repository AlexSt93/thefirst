/*********************************************/
/*********************************************/
/*********************************************/
/****** D a t a m o d e l   s e t u p ********/
/*********************************************/
/*********************************************/
/*********************************************/



/*********************************************/
/***************** REGIONS *******************/
/*********************************************/
connect  test/test@xepdb1;

CREATE SEQUENCE id_sequence
    START WITH     1
    INCREMENT BY   1
    NOCACHE
 NOCYCLE;

/*********************************************/
/**************** COUNTRIES ******************/
/*********************************************/

CREATE TABLE countries
(
    id            NUMBER(7) default id_sequence.nextval NOT NULL,
    country_code  VARCHAR(2) NOT NULL,
    name          VARCHAR(100) NOT NULL,
    official_name VARCHAR(200),
    population    NUMERIC(10),
    area_sq_km    NUMERIC(10,2),
    latitude      NUMERIC(8,5),
    longitude     NUMERIC(8,5),
    timezone      VARCHAR(40),
    CONSTRAINT countries_pk
        PRIMARY KEY (id)
);

/*********************************************/
/***************** CITIES ********************/
/*********************************************/

CREATE TABLE cities
(
    id            NUMBER(7) default id_sequence.nextval NOT NULL,
    name          VARCHAR(100)  NOT NULL,
    official_name VARCHAR(200),
    population    NUMERIC(8),
    is_capital    CHAR(1)       DEFAULT 'N' NOT NULL,
    latitude      NUMERIC(8,5),
    longitude     NUMERIC(8,5),
    timezone      VARCHAR(40),
    country_id    NUMBER(7)    NOT NULL,
    CONSTRAINT cities_pk
        PRIMARY KEY (id),
    CONSTRAINT cities_countries_fk001
        FOREIGN KEY (country_id) REFERENCES countries (id)
);

CREATE INDEX cities_countries_fk001 ON cities (country_id);

/*********************************************/
/*********************************************/
/*********************************************/
/*********** D a t a    l o a d **************/
/*********************************************/
/*********************************************/
/*********************************************/

/*********************************************/
/**************** COUNTRIES ******************/
/*********************************************/

INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AD', 'Andorra', 'Principality of Andorra', 86000, 468, 42.55, 1.58333, 'Europe/Andorra');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AE', 'United Arab Emirates', null, 9701000, 83600, 23.75, 54.5, 'Asia/Dubai');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AF', 'Afghanistan', 'Islamic Republic of Afghanistan', 34941000, 652230, 33, 66, 'Asia/Kabul');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AG', 'Antigua and Barbuda', null, 96000, 443, 17.05, -61.8, 'America/Antigua');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AL', 'Albania', 'Republic of Albania', 3057000, 28748, 41, 20, 'Europe/Tirane');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AM', 'Armenia', 'Republic of Armenia', 3038000, 29743, 40.25, 45, 'Asia/Yerevan');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AO', 'Angola', 'Republic of Angola', 30356000, 1246700, -12.5, 18.5, 'Africa/Luanda');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AR', 'Argentina', 'Argentine Republic', 44694000, 2780400, -34, -64, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AT', 'Austria', 'Republic of Austria', 8793000, 83871, 47.33333, 13.33333, 'Europe/Vienna');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AU', 'Australia', 'Commonwealth of Australia', 23470000, 7741220, -25, 135, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('AZ', 'Azerbaijan', 'Republic of Azerbaijan', 10047000, 86600, 40.5, 47.5, 'Asia/Baku');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BA', 'Bosnia and Herzegovina', null, 3850000, 51197, 44.25, 17.83333, 'Europe/Sarajevo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BB', 'Barbados', null, 293000, 430, 13.16453, -59.55165, 'America/Barbados');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BD', 'Bangladesh', 'People’s Republic of Bangladesh', 159453000, 148460, 24, 90, 'Asia/Dhaka');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BE', 'Belgium', 'Kingdom of Belgium', 11571000, 30528, 50.75, 4.5, 'Europe/Brussels');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BF', 'Burkina Faso', null, 19743000, 274200, 12.5, -1.66667, 'Africa/Ouagadougou');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BG', 'Bulgaria', 'Republic of Bulgaria', 7058000, 110879, 42.66667, 25.25, 'Europe/Sofia');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BH', 'Bahrain', 'Kingdom of Bahrain', 1443000, 760, 26.03333, 50.55, 'Asia/Bahrain');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BI', 'Burundi', 'Republic of Burundi', 11845000, 27830, -3.5, 30, 'Africa/Bujumbura');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BJ', 'Benin', 'Republic of Benin', 11341000, 112622, 9.5, 2.25, 'Africa/Porto-Novo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BN', 'Brunei Darussalam', null, 451000, 5765, 4.5, 114.66667, 'Asia/Brunei');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BO', 'Bolivia', 'Plurinational State of Bolivia', 11306000, 1098581, -17, -65, 'America/La_Paz');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BR', 'Brazil', 'Federative Republic of Brazil', 208847000, 8515770, -10, -55, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BS', 'Bahamas', 'Commonwealth of The Bahamas', 333000, 13880, 25.04082, -77.37122, 'America/Nassau');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BT', 'Bhutan', 'Kingdom of Bhutan', 766000, 38394, 27.5, 90.5, 'Asia/Thimphu');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BW', 'Botswana', 'Republic of Botswana', 2249000, 581730, -22, 24, 'Africa/Gaborone');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BY', 'Belarus', 'Republic of Belarus', 9528000, 207600, 53, 28, 'Europe/Minsk');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('BZ', 'Belize', null, 386000, 22966, 17.25, -88.75, 'America/Belize');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CA', 'Canada', null, 35882000, 9984670, 60.10867, -113.64258, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CD', 'Democratic Republic of the Congo', null, 85281000, 2344858, -2.5, 23.5, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CF', 'Central African Republic', null, 5745000, 622984, 7, 21, 'Africa/Bangui');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CG', 'Congo', 'Republic of the Congo', 5062000, 342000, -1, 15.5, 'Africa/Brazzaville');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CH', 'Switzerland', 'Swiss Confederation', 8293000, 41277, 47.00016, 8.01427, 'Europe/Zurich');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CI', 'Cote d''Ivoire', 'Republic of Côte d’Ivoire', 26261000, 322463, 8, -5.5, 'Africa/Abidjan');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CL', 'Chile', 'Republic of Chile', 17925000, 756102, -30, -71, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CM', 'Cameroon', 'Republic of Cameroon', 25641000, 475440, 6, 12.5, 'Africa/Douala');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CN', 'China', 'People''s Republic of China', 1384689000, 9596960, 35, 105, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CO', 'Colombia', 'Republic of Colombia', 48169000, 1138910, 4, -73.25, 'America/Bogota');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CR', 'Costa Rica', 'Republic of Costa Rica', 4987000, 51100, 10, -84, 'America/Costa_Rica');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CU', 'Cuba', 'Republic of Cuba', 11116000, 110860, 22, -79.5, 'America/Havana');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CV', 'Cabo Verde', 'Republic of Cabo Verde', 568000, 4033, 16, -24, 'Atlantic/Cape_Verde');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CY', 'Cyprus', 'Republic of Cyprus', 1237000, 9251, 35, 33, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('CZ', 'Czechia', 'Czech Republic', 10686000, 78867, 49.75, 15, 'Europe/Prague');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('DE', 'Germany', 'Federal Republic of Germany', 80458000, 357022, 51.5, 10.5, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('DJ', 'Djibouti', 'Republic of Djibouti', 884000, 23200, 11.83333, 42.5, 'Africa/Djibouti');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('DK', 'Denmark', 'Kingdom of Denmark', 5810000, 43094, 56, 10, 'Europe/Copenhagen');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('DM', 'Dominica', 'Commonwealth of Dominica', 74000, 751, 15.5, -61.33333, 'America/Dominica');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('DO', 'Dominican Republic', null, 10299000, 48670, 19, -70.66667, 'America/Santo_Domingo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('DZ', 'Algeria', 'People’s Democratic Republic of Algeria', 41657000, 2381741, 28, 3, 'Africa/Algiers');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('EC', 'Ecuador', 'Republic of Ecuador', 16291000, 283561, -1.25, -78.25, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('EE', 'Estonia', 'Republic of Estonia', 1244000, 45228, 59, 26, 'Europe/Tallinn');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('EG', 'Egypt', 'Arab Republic of Egypt', 99413000, 1001450, 27, 30, 'Africa/Cairo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ER', 'Eritrea', 'State of Eritrea', 5971000, 117600, 15, 39, 'Africa/Asmara');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ES', 'Spain', 'Kingdom of Spain', 49331000, 505370, 40, -4, 'Europe/Madrid');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ET', 'Ethiopia', 'Federal Democratic Republic of Ethiopia', 108386000, 1104300, 9, 39.5, 'Africa/Addis_Ababa');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('FI', 'Finland', 'Republic of Finland', 5537000, 338145, 64, 26, 'Europe/Helsinki');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('FJ', 'Fiji', 'Republic of Fiji', 926000, 18274, -18, 178, 'Pacific/Fiji');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('FM', 'Micronesia', 'Federated States of Micronesia', 104000, 702, 6.91666, 158.18333, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('FR', 'France', 'French Republic', 67364000, 643801, 46, 2, 'Europe/Paris');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GA', 'Gabon', 'Gabonese Republic', 2119000, 267667, -1, 11.75, 'Africa/Libreville');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GB', 'United Kingdom', 'United Kingdom of Great Britain and Northern Ireland', 65105000, 243610, 54.75844, -2.69531, 'Europe/London');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GD', 'Grenada', null, 112000, 344, 12.11667, -61.66667, 'America/Grenada');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GE', 'Georgia', null, 4926000, 69700, 41.99998, 43.4999, 'Asia/Tbilisi');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GH', 'Ghana', 'Republic of Ghana', 28102000, 238533, 8.1, -1.2, 'Africa/Accra');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GM', 'Gambia', 'Republic of The Gambia', 2093000, 11300, 13.5, -15.5, 'Africa/Banjul');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GN', 'Guinea', 'Republic of Guinea', 11855000, 245857, 10.83333, -10.66667, 'Africa/Conakry');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GQ', 'Equatorial Guinea', 'Republic of Equatorial Guinea', 797000, 28051, 1.7, 10.5, 'Africa/Malabo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GR', 'Greece', 'Hellenic Republic', 10762000, 131957, 39, 22, 'Europe/Athens');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GT', 'Guatemala', 'Republic of Guatemala', 16581000, 108889, 15.5, -90.25, 'America/Guatemala');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GW', 'Guinea-Bissau', 'Republic of Guinea-Bissau', 1833000, 36125, 12, -15, 'Africa/Bissau');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('GY', 'Guyana', 'Co-operative Republic of Guyana', 741000, 214969, 5, -59, 'America/Guyana');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('HN', 'Honduras', 'Republic of Honduras', 9183000, 112090, 15, -86.5, 'America/Tegucigalpa');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('HR', 'Croatia', 'Republic of Croatia', 4270000, 56594, 45.16667, 15.5, 'Europe/Zagreb');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('HT', 'Haiti', 'Republic of Haiti', 10788000, 27750, 19.07582, -72.29616, 'America/Port-au-Prince');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('HU', 'Hungary', null, 9826000, 93028, 47, 20, 'Europe/Budapest');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ID', 'Indonesia', 'Republic of Indonesia', 262787000, 1904569, -5, 120, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('IE', 'Ireland', 'Éire', 5068000, 70273, 53, -8, 'Europe/Dublin');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('IL', 'Israel', 'State of Israel', 8425000, 20770, 31.5, 34.75, 'Asia/Jerusalem');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('IN', 'India', 'Republic of India', 1296834000, 3287263, 22, 79, 'Asia/Kolkata');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('IQ', 'Iraq', 'Republic of Iraq', 40194000, 438317, 33, 44, 'Asia/Baghdad');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('IR', 'Iran', 'Islamic Republic of Iran', 83025000, 1648195, 32, 53, 'Asia/Tehran');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('IS', 'Iceland', 'Republic of Iceland', 344000, 103000, 65, -18, 'Atlantic/Reykjavik');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('IT', 'Italy', 'Italian Republic', 62247000, 301340, 42.83333, 12.83333, 'Europe/Rome');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('JM', 'Jamaica', null, 2812000, 10991, 18.16667, -77.25, 'America/Jamaica');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('JO', 'Jordan', 'Hashemite Kingdom of Jordan', 10458000, 89342, 31, 36, 'Asia/Amman');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('JP', 'Japan', null, 126168000, 377915, 35.68536, 139.75309, 'Asia/Tokyo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KE', 'Kenya', 'Republic of Kenya', 48398000, 580367, 1, 38, 'Africa/Nairobi');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KG', 'Kyrgyzstan', 'Kyrgyz Republic', 5849000, 199951, 41.5, 75, 'Asia/Bishkek');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KH', 'Cambodia', 'Kingdom of Cambodia', 16450000, 181035, 13, 105, 'Asia/Phnom_Penh');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KI', 'Kiribati', 'Republic of Kiribati', 109000, 811, 1.421, 172.984, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KM', 'Comoros', 'Union of the Comoros', 821000, 2235, -12.23333, 44.44553, 'Indian/Comoro');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KN', 'Saint Kitts and Nevis', 'Federation of Saint Kitts and Nevis', 53000, 261, 17.33333, -62.75, 'America/Basseterre');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KP', 'North Korea', 'Democratic People''s Republic of Korea', 25381000, 120538, 40, 127, 'Asia/Pyongyang');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KR', 'South Korea', 'Republic of Korea', 51418000, 99720, 36.5, 127.75, 'Asia/Seoul');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KW', 'Kuwait', 'State of Kuwait', 4622000, 17818, 29.5, 47.75, 'Asia/Kuwait');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('KZ', 'Kazakhstan', 'Republic of Kazakhstan', 18745000, 2724900, 48, 68, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LA', 'Laos', 'Lao People''s Democratic Republic', 7234000, 236800, 18, 105, 'Asia/Vientiane');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LB', 'Lebanon', 'Lebanese Republic', 6100000, 10400, 33.83333, 35.83333, 'Asia/Beirut');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LC', 'Saint Lucia', null, 166000, 616, 13.88333, -60.96667, 'America/Castries');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LI', 'Liechtenstein', 'Principality of Liechtenstein', 39000, 160, 47.16667, 9.53333, 'Europe/Vaduz');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LK', 'Sri Lanka', 'Democratic Socialist Republic of Sri Lanka', 22577000, 65610, 7.75, 80.75, 'Asia/Colombo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LR', 'Liberia', 'Republic of Liberia', 4810000, 111369, 6.5, -9.5, 'Africa/Monrovia');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LS', 'Lesotho', 'Kingdom of Lesotho', 1962000, 30355, -29.5, 28.25, 'Africa/Maseru');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LT', 'Lithuania', 'Republic of Lithuania', 2793000, 65300, 55.41667, 24, 'Europe/Vilnius');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LU', 'Luxembourg', 'Grand Duchy of Luxembourg', 606000, 2586, 49.75, 6.16667, 'Europe/Luxembourg');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LV', 'Latvia', 'Republic of Latvia', 1924000, 64589, 57, 25, 'Europe/Riga');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('LY', 'Libya', 'State of Libya', 6755000, 1759540, 28, 17, 'Africa/Tripoli');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MA', 'Morocco', 'Kingdom of Morocco', 34314000, 446550, 32, -6, 'Africa/Casablanca');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MC', 'Monaco', 'Principality of Monaco', 38000, 2, 43.73141, 7.41903, 'Europe/Monaco');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MD', 'Moldova', 'Republic of Moldova', 3438000, 33851, 47.25, 28.58333, 'Europe/Chisinau');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ME', 'Montenegro', null, 614000, 13812, 42.75, 19.25, 'Europe/Podgorica');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MG', 'Madagascar', 'Republic of Madagascar', 25684000, 587041, -20, 47, 'Indian/Antananarivo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MH', 'Marshall Islands', 'Republic of the Marshall Islands', 76000, 181, 7.08971, 171.38027, 'Pacific/Majuro');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MK', 'North Macedonia', 'Republic of North Macedonia', 2119000, 25713, 41.66667, 21.75, 'Europe/Skopje');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ML', 'Mali', 'Republic of Mali', 18430000, 1240192, 18, -2, 'Africa/Bamako');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MM', 'Myanmar', 'Republic of the Union of Myanmar', 55623000, 676578, 21, 96, 'Asia/Yangon');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MN', 'Mongolia', null, 3103000, 1564116, 46, 105, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MR', 'Mauritania', 'Islamic Republic of Mauritania', 3840000, 1030700, 20.25, -10.5, 'Africa/Nouakchott');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MT', 'Malta', 'Republic of Malta', 449000, 316, 35.91667, 14.43333, 'Europe/Malta');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MU', 'Mauritius', 'Republic of Mauritius', 1364000, 2040, -20.3, 57.58333, 'Indian/Mauritius');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MV', 'Maldives', 'Republic of Maldives', 392000, 298, 3.2, 73, 'Indian/Maldives');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MW', 'Malawi', 'Republic of Malawi', 19843000, 118484, -13.5, 34, 'Africa/Blantyre');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MX', 'Mexico', 'United Mexican States', 125959000, 1964375, 23, -102, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MY', 'Malaysia', null, 31810000, 329847, 2.5, 112.5, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('MZ', 'Mozambique', 'Republic of Mozambique', 27234000, 799380, -18.25, 35, 'Africa/Maputo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('NA', 'Namibia', 'Republic of Namibia', 2533000, 824292, -22, 17, 'Africa/Windhoek');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('NE', 'Niger', 'Republic of Niger', 19866000, 1267000, 18, 9, 'Africa/Niamey');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('NG', 'Nigeria', 'Federal Republic of Nigeria', 203453000, 923768, 10, 8, 'Africa/Lagos');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('NI', 'Nicaragua', 'Republic of Nicaragua', 6085000, 130370, 13, -85, 'America/Managua');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('NL', 'Netherlands', 'Kingdom of Netherlands', 17151000, 41543, 52.25, 5.75, 'Europe/Amsterdam');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('NO', 'Norway', 'Kingdom of Norway', 5372000, 323802, 62, 10, 'Europe/Oslo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('NP', 'Nepal', 'Federal Democratic Republic of Nepal', 29718000, 147181, 28, 84, 'Asia/Kathmandu');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('NR', 'Nauru', 'Republic of Nauru', 10000, 21, -0.517, 166.933, 'Pacific/Nauru');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('NZ', 'New Zealand', null, 4546000, 268838, -42, 174, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('OM', 'Oman', 'Sultanate of Oman', 3494000, 309500, 21, 57, 'Asia/Muscat');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('PA', 'Panama', 'Republic of Panama', 3801000, 75420, 9, -80, 'America/Panama');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('PE', 'Peru', 'Republic of Peru', 31331000, 1285216, -10, -75.25, 'America/Lima');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('PG', 'Papua New Guinea', 'Independent State of Papua New Guinea', 7027000, 462840, -6, 147, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('PH', 'Philippines', 'Republic of Philippines', 105893000, 300000, 13, 122, 'Asia/Manila');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('PK', 'Pakistan', 'Islamic Republic of Pakistan', 207863000, 796095, 30, 70, 'Asia/Karachi');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('PL', 'Poland', 'Republic of Poland', 38421000, 312685, 52, 20, 'Europe/Warsaw');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('PT', 'Portugal', 'Portuguese Republic', 10355000, 92090, 39.6945, -8.13057, 'Europe/Lisbon');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('PW', 'Palau', 'Republic of Palau', 22000, 459, 7.51507, 134.57524, 'Pacific/Melekeok');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('PY', 'Paraguay', 'Republic of Paraguay', 7026000, 406752, -23.33333, -58, 'America/Asuncion');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('QA', 'Qatar', 'State of Qatar', 2364000, 11586, 25.5, 51.25, 'Asia/Doha');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('RO', 'Romania', null, 21457000, 238391, 46, 25, 'Europe/Bucharest');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('RS', 'Serbia', 'Republic of Serbia', 7078000, 77474, 44.81892, 20.45998, 'Europe/Belgrade');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('RU', 'Russia', 'Russian Federation', 142123000, 17098242, 60, 100, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('RW', 'Rwanda', 'Republic of Rwanda', 12187000, 26338, -2, 30, 'Africa/Kigali');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SA', 'Saudi Arabia', 'Kingdom of Saudi Arabia', 33091000, 2149690, 25, 45, 'Asia/Riyadh');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SB', 'Solomon Islands', null, 660000, 28896, -8, 159, 'Pacific/Guadalcanal');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SC', 'Seychelles', 'Republic of Seychelles', 95000, 455, -4.58333, 55.66667, 'Indian/Mahe');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SD', 'Sudan', 'Republic of Sudan', 43121000, 1861484, 16, 30, 'Africa/Khartoum');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SE', 'Sweden', 'Kingdom of Sweden', 10041000, 450295, 62, 15, 'Europe/Stockholm');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SG', 'Singapore', 'Republic of Singapore', 5996000, 697, 1.36667, 103.8, 'Asia/Singapore');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SI', 'Slovenia', 'Republic of Slovenia', 2102000, 20273, 46.08333, 15, 'Europe/Ljubljana');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SK', 'Slovakia', 'Slovak Republic', 5445000, 49035, 48.66667, 19.5, 'Europe/Bratislava');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SL', 'Sierra Leone', 'Republic of Sierra Leone', 6312000, 71740, 8.5, -11.5, 'Africa/Freetown');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SM', 'San Marino', 'Republic of San Marino', 34000, 61, 43.9367, 12.4463, 'Europe/San_Marino');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SN', 'Senegal', 'Republic of Senegal', 15021000, 196722, 14.5, -14.25, 'Africa/Dakar');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SO', 'Somalia', 'Federal Republic of Somalia', 11259000, 637657, 6, 48, 'Africa/Mogadishu');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SR', 'Suriname', 'Republic of Suriname', 598000, 163820, 4, -56, 'America/Paramaribo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SS', 'South Sudan', 'Republic of South Sudan', 10205000, 644329, 7.5, 30, 'Africa/Juba');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ST', 'Sao Tome and Principe', 'Democratic Republic of Sao Tome and Principe', 204000, 964, 1, 7, 'Africa/Sao_Tome');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SV', 'El Salvador', 'Republic of El Salvador', 6187000, 21041, 13.83333, -88.91667, 'America/El_Salvador');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SY', 'Syria', 'Syrian Arab Republic', 19454000, 185180, 35, 38, 'Asia/Damascus');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('SZ', 'Eswatini', 'Kingdom of Eswatini', 1087000, 17364, -26.5, 31.5, 'Africa/Mbabane');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TD', 'Chad', 'Republic of Chad', 15833000, 1284000, 15, 19, 'Africa/Ndjamena');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TG', 'Togo', 'Togolese Republic', 8176000, 56785, 8.66667, 1.08333, 'Africa/Lome');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TH', 'Thailand', 'Kingdom of Thailand', 68616000, 513120, 15.5, 101, 'Asia/Bangkok');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TJ', 'Tajikistan', 'Republic of Tajikistan', 8605000, 144100, 39, 71, 'Asia/Dushanbe');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TL', 'Timor-Leste', 'Democratic Republic of Timor-Leste', 1322000, 14874, -8.83333, 125.75, 'Asia/Dili');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TM', 'Turkmenistan', null, 5411000, 488100, 39.75, 59.66667, 'Asia/Ashgabat');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TN', 'Tunisia', 'Republic of Tunisia', 11516000, 163610, 34, 9, 'Africa/Tunis');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TO', 'Tonga', 'Kingdom of Tonga', 106000, 747, -20, -175, 'Pacific/Tongatapu');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TR', 'Turkey', 'Republic of Turkey', 81257000, 783562, 39, 35, 'Europe/Istanbul');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TT', 'Trinidad and Tobago', 'Republic of Trinidad and Tobago', 1216000, 5128, 11, -61, 'America/Port_of_Spain');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TV', 'Tuvalu', null, 11000, 26, -8.51719, 179.14478, 'Pacific/Funafuti');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TW', 'Taiwan', null, 23546000, 35980, 24, 121, 'Asia/Taipei');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('TZ', 'Tanzania', 'United Republic of Tanzania', 55451000, 947300, -6, 35, 'Africa/Dar_es_Salaam');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('UA', 'Ukraine', null, 43952000, 603550, 49, 32, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('UG', 'Uganda', 'Republic of Uganda', 40854000, 241038, 1.25, 32.5, 'Africa/Kampala');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('US', 'United States', 'United States of America', 329256000, 9833517, 39.76, -98.5, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('UY', 'Uruguay', 'Oriental Republic of Uruguay', 3369000, 176215, -33, -56, 'America/Montevideo');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('UZ', 'Uzbekistan', 'Republic of Uzbekistan', 30024000, 447400, 41.66667, 63.83333, null);
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('VA', 'Vatican City', 'Vatican City State', 1000, 0.44, 41.90225, 12.4533, 'Europe/Vatican');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('VC', 'Saint Vincent and the Grenadines', null, 102000, 389, 13.08333, -61.2, 'America/St_Vincent');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('VE', 'Venezuela', 'Bolivarian Republic of Venezuela', 31689000, 912050, 8, -66, 'America/Caracas');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('VN', 'Vietnam', 'Socialist Republic of Vietnam', 97040000, 331210, 16.16667, 107.83333, 'Asia/Ho_Chi_Minh');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('VU', 'Vanuatu', 'Republic of Vanuatu', 288000, 12189, -16, 167, 'Pacific/Efate');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('WS', 'Samoa', 'Independent State of Samoa', 201000, 2831, -13.8, -172.13333, 'Pacific/Apia');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('XK', 'Kosovo', 'Republic of Kosovo', 1908000, 10887, 42.58333, 20.91667, 'Europe/Belgrade');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('YE', 'Yemen', 'Republic of Yemen', 28667000, 527968, 15.5, 47.5, 'Asia/Aden');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ZA', 'South Africa', 'Republic of South Africa', 55380000, 1219090, -29, 24, 'Africa/Johannesburg');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ZM', 'Zambia', 'Republic of Zambia', 16445000, 752618, -14.33333, 28.5, 'Africa/Lusaka');
INSERT INTO countries (country_code, name, official_name, population, area_sq_km, latitude, longitude, timezone) VALUES ('ZW', 'Zimbabwe', 'Republic of Zimbabwe', 14030000, 390757, -19, 29.75, 'Africa/Harare');

/*********************************************/
/****************** CITIES *******************/
/*********************************************/
INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Moscow', 12410000, 'Y', 55.75222, 37.61556, 148);
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Andorra la Vella', 23000, 'Y', 42.50779, 1.52109, 'AND');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Abu Dhabi', 1420000, 'Y', 24.45118, 54.39696, 'ARE');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kabul', 4012000, 'Y', 34.52813, 69.17233, 'AFG');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Saint John''s', 'Saint John’s', 21000, 'Y', 17.12096, -61.84329, 'ATG');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tirana', 476000, 'Y', 41.3275, 19.81889, 'ALB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Yerevan', 1080000, 'Y', 40.18111, 44.51361, 'ARM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Luanda', 7774000, 'Y', -8.83682, 13.23432, 'AGO');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Buenos Aires', 14967000, 'Y', -34.61315, -58.37723, 'ARG');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Vienna', 1901000, 'Y', 48.20849, 16.37208, 'AUT');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Canberra', 423000, 'Y', -35.28346, 149.12807, 'AUS');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Baku', 2286000, 'Y', 40.37767, 49.89201, 'AZE');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Sarajevo', 343000, 'Y', 43.84864, 18.35644, 'BIH');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bridgetown', 89000, 'Y', 13.10732, -59.62021, 'BRB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Dhaka', 19578000, 'Y', 23.7104, 90.40744, 'BGD');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Brussels', 2050000, 'Y', 50.85045, 4.34878, 'BEL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Ouagadougou', 2531000, 'Y', 12.36566, -1.53388, 'BFA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Sofia', 1272000, 'Y', 42.69751, 23.32415, 'BGR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Manama', 565000, 'Y', 26.22787, 50.58565, 'BHR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bujumbura', 899000, 'Y', -3.39249, 29.36169, 'BDI');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Porto Novo', 'Porto-Novo', 285000, 'Y', 6.49646, 2.60359, 'BEN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bandar Seri Begawan', 241000, 'Y', 4.89035, 114.94006, 'BRN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Sucre', 278000, 'Y', -19.03332, -65.26274, 'BOL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('La Paz', 1814000, 'Y', 0, 0, 'BOL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Brasilia', 4470000, 'Y', -15.77972, -47.92972, 'BRA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Nassau', 280000, 'Y', 25.05823, -77.34306, 'BHS');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Thimphu', 203000, 'Y', 27.46609, 89.64191, 'BTN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Gaborone', 269000, 'Y', -24.65451, 25.90859, 'BWA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Minsk', 2005000, 'Y', 53.9, 27.56667, 'BLR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Belmopan', 23000, 'Y', 17.25, -88.76667, 'BLZ');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Ottawa', 1363000, 'Y', 45.41117, -75.69812, 'CAN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kinshasa', 13171000, 'Y', -4.32758, 15.31357, 'COD');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bangui', 851000, 'Y', 4.36122, 18.55496, 'CAF');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Brazzaville', 2230000, 'Y', -4.26613, 15.28318, 'COG');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bern', 422000, 'Y', 46.94809, 7.44744, 'CHE');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Abidjan', 4921000, 'Y', 5.36029, -4.00823, 'CIV');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Yamoussoukro', 231000, 'Y', 6.82055, -5.27674, 'CIV');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Santiago', 6680000, 'Y', -33.45694, -70.64827, 'CHL');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Yaounde', 'Yaoundé', 3412000, 'Y', 3.86667, 11.51667, 'CMR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Beijing', 19618000, 'Y', 39.9075, 116.39723, 'CHN');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Bogota', 'Bogotá', 10574000, 'Y', 4.60971, -74.08175, 'COL');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('San Jose', 'San José', 1358000, 'Y', 9.93333, -84.08333, 'CRI');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Havana', 2136000, 'Y', 23.13302, -82.38304, 'CUB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Praia', 168000, 'Y', 14.93152, -23.51254, 'CPV');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Nicosia', 269000, 'Y', 35.17531, 33.3642, 'CYP');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Prague', 1292000, 'Y', 50.08804, 14.42076, 'CZE');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Berlin', 3563000, 'Y', 52.52437, 13.41053, 'DEU');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Djibouti', 562000, 'Y', 11.58901, 43.14503, 'DJI');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Copenhagen', 1321000, 'Y', 55.67594, 12.56553, 'DNK');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Roseau', 15000, 'Y', 15.30174, -61.38808, 'DMA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Santo Domingo', 3172000, 'Y', 18.47186, -69.89232, 'DOM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Algiers', 2694000, 'Y', 36.73225, 3.08746, 'DZA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Quito', 1822000, 'Y', -0.22985, -78.52495, 'ECU');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tallinn', 437000, 'Y', 59.43696, 24.75353, 'EST');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Cairo', 20076000, 'Y', 30.04442, 31.23571, 'EGY');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Asmara', 896000, 'Y', 15.33805, 38.93184, 'ERI');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Madrid', 6497000, 'Y', 40.4165, -3.70256, 'ESP');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Addis Ababa', 4400000, 'Y', 9.02497, 38.74689, 'ETH');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Helsinki', 1279000, 'Y', 60.16952, 24.93545, 'FIN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Suva', 178000, 'Y', -18.14161, 178.44149, 'FJI');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Palikir', 7000, 'Y', 6.92444, 158.16066, 'FSM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Paris', 10901000, 'Y', 48.85341, 2.3488, 'FRA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Libreville', 813000, 'Y', 0.39241, 9.45356, 'GAB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('London', 9046000, 'Y', 51.50853, -0.12574, 'GBR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Saint George''s', 39000, 'Y', 12.05288, -61.75226, 'GRD');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tbilisi', 1077000, 'Y', 41.69411, 44.83368, 'GEO');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Accra', 2439000, 'Y', 5.55602, -0.1969, 'GHA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Banjul', 437000, 'Y', 13.45274, -16.57803, 'GMB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Conakry', 1843000, 'Y', 9.53795, -13.67729, 'GIN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Malabo', 297000, 'Y', 3.75578, 8.78166, 'GNQ');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Athens', 3156000, 'Y', 37.98376, 23.72784, 'GRC');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Guatemala City', 2851000, 'Y', 14.64072, -90.51327, 'GTM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bissau', 558000, 'Y', 11.86357, -15.59767, 'GNB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Georgetown', 110000, 'Y', 6.80448, -58.15527, 'GUY');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tegucigalpa', 1363000, 'Y', 14.0818, -87.20681, 'HND');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Zagreb', 686000, 'Y', 45.81444, 15.97798, 'HRV');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Port au Prince', 'Port-au-Prince', 2637000, 'Y', 18.54349, -72.33881, 'HTI');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Budapest', 1759000, 'Y', 47.49835, 19.04045, 'HUN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Jakarta', 10517000, 'Y', -6.21462, 106.84513, 'IDN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Dublin', 1201000, 'Y', 53.33306, -6.24889, 'IRL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Jerusalem', 907000, 'Y', 31.76831, 35.21371, 'ISR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('New Delhi', 28514000, 'Y', 28.63576, 77.22445, 'IND');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Baghdad', 6643000, 'Y', 33.34058, 44.40088, 'IRQ');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tehran', 8896000, 'Y', 35.69439, 51.42151, 'IRN');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Reykjavik', 'Reykjavík', 216000, 'Y', 64.13548, -21.89541, 'ISL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Rome', 4210000, 'Y', 41.89193, 12.51133, 'ITA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kingston', 589000, 'Y', 17.99702, -76.79358, 'JAM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Amman', 2065000, 'Y', 31.95522, 35.94503, 'JOR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tokyo', 37468000, 'Y', 35.6895, 139.69171, 'JPN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Nairobi', 4386000, 'Y', -1.28333, 36.81667, 'KEN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bishkek', 996000, 'Y', 42.87, 74.59, 'KGZ');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Phnom Penh', 1952000, 'Y', 11.56245, 104.91601, 'KHM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tarawa', 64000, 'Y', 1.3278, 172.97696, 'KIR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Moroni', 62000, 'Y', -11.70216, 43.25506, 'COM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Basseterre', 14000, 'Y', 17.2955, -62.72499, 'KNA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Pyongyang', 3038000, 'Y', 39.03385, 125.75432, 'PRK');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Seoul', 9963000, 'Y', 37.566, 126.9784, 'KOR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kuwait City', 2989000, 'Y', 29.36972, 47.97833, 'KWT');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Nur Sultan', 'Nur-Sultan', 1068000, 'Y', 51.1801, 71.44598, 'KAZ');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Vientiane', 665000, 'Y', 17.96667, 102.6, 'LAO');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Beirut', 2385000, 'Y', 33.89332, 35.50157, 'LBN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Castries', 22000, 'Y', 13.9957, -61.00614, 'LCA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Vaduz', 5000, 'Y', 47.14151, 9.52154, 'LIE');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Colombo', 600000, 'Y', 6.93548, 79.84868, 'LKA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Sri Jayewardenepura Kotte', 103000, 'Y', 6.88682, 79.91878, 'LKA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Monrovia', 1418000, 'Y', 6.30054, -10.7969, 'LBR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Maseru', 202000, 'Y', -29.31667, 27.48333, 'LSO');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Vilnius', 536000, 'Y', 54.68916, 25.2798, 'LTU');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Luxembourg', 120000, 'Y', 49.61167, 6.13, 'LUX');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Riga', 637000, 'Y', 56.946, 24.10589, 'LVA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tripoli', 1158000, 'Y', 32.88743, 13.18733, 'LBY');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Rabat', 1847000, 'Y', 34.01325, -6.83255, 'MAR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Monaco', 38000, 'Y', 43.73333, 7.41667, 'MCO');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Chisinau', 'Chişinău', 510000, 'Y', 47.00556, 28.8575, 'MDA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Podgorica', 177000, 'Y', 42.44111, 19.26361, 'MNE');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Antananarivo', 3058000, 'Y', -18.91368, 47.53613, 'MDG');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Majuro', 31000, 'Y', 7.08971, 171.38027, 'MHL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Skopje', 584000, 'Y', 41.99646, 21.43141, 'MKD');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bamako', 2447000, 'Y', 12.65, -8, 'MLI');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Nay Pyi Taw', 1176000, 'Y', 19.745, 96.12972, 'MMR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Ulaanbaatar', 1520000, 'Y', 47.92065, 106.91731, 'MNG');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Nouakchott', 1205000, 'Y', 18.08581, -15.9785, 'MRT');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Valletta', 213000, 'Y', 35.89968, 14.5148, 'MLT');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Port Louis', 149000, 'Y', -20.16194, 57.49889, 'MUS');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Male', 177000, 'Y', 4.17521, 73.50916, 'MDV');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Lilongwe', 1030000, 'Y', -13.96692, 33.78725, 'MWI');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Mexico City', 21581000, 'Y', 19.42847, -99.12766, 'MEX');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kuala Lumpur', 7564000, 'Y', 3.1412, 101.68653, 'MYS');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Maputo', 1102000, 'Y', -25.96553, 32.58322, 'MOZ');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Windhoek', 404000, 'Y', -22.55941, 17.08323, 'NAM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Niamey', 1214000, 'Y', 13.51366, 2.1098, 'NER');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Abuja', 2919000, 'Y', 9.05785, 7.49508, 'NGA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Managua', 1048000, 'Y', 12.13282, -86.2504, 'NIC');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Amsterdam', 1132000, 'Y', 52.37403, 4.88969, 'NLD');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('The Hague', 685000, 'Y', 52.08009, 4.31375, 'NLD');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Oslo', 1012000, 'Y', 59.91273, 10.74609, 'NOR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kathmandu', 1330000, 'Y', 27.70169, 85.3206, 'NPL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Yaren', 1000, 'Y', -0.55085, 166.9252, 'NRU');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Wellington', 411000, 'Y', -41.28664, 174.77557, 'NZL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Muscat', 1447000, 'Y', 23.58413, 58.40778, 'OMN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Panama City', 1783000, 'Y', 30.15881, -85.66021, 'PAN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Lima', 10391000, 'Y', -12.04318, -77.02824, 'PER');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Port Moresby', 367000, 'Y', -9.47723, 147.15089, 'PNG');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Manila', 13482000, 'Y', 14.6042, 120.9822, 'PHL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Islamabad', 1061000, 'Y', 33.72148, 73.04329, 'PAK');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Warsaw', 1768000, 'Y', 52.22977, 21.01178, 'POL');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Lisbon', 2927000, 'Y', 38.71667, -9.13333, 'PRT');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Melekeok', 299, 'Y', 7.49244, 134.63632, 'PLW');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Asuncion', 'Asunción', 3222000, 'Y', -25.28646, -57.647, 'PRY');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Doha', 633000, 'Y', 25.28545, 51.53096, 'QAT');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bucharest', 1821000, 'Y', 44.43225, 26.10626, 'ROU');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Belgrade', 1389000, 'Y', 44.80401, 20.46513, 'SRB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Moscow', 12410000, 'Y', 55.75222, 37.61556, 'RUS');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kigali', 1058000, 'Y', -1.94995, 30.05885, 'RWA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Riyadh', 6907000, 'Y', 24.68773, 46.72185, 'SAU');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Honiara', 82000, 'Y', -9.43333, 159.95, 'SLB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Victoria', 28000, 'Y', -4.62001, 55.45501, 'SYC');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Khartoum', 5534000, 'Y', 15.55177, 32.53241, 'SDN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Stockholm', 1583000, 'Y', 59.32938, 18.06871, 'SWE');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Singapore', 5792000, 'Y', 1.28967, 103.85007, 'SGP');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Ljubljana', 286000, 'Y', 46.05108, 14.50513, 'SVN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bratislava', 430000, 'Y', 48.14816, 17.10674, 'SVK');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Freetown', 1136000, 'Y', 8.48714, -13.2356, 'SLE');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('San Marino', 4000, 'Y', 43.93667, 12.44639, 'SMR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Dakar', 2978000, 'Y', 14.6937, -17.44406, 'SEN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Mogadishu', 2082000, 'Y', 2.03711, 45.34375, 'SOM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Paramaribo', 239000, 'Y', 5.86638, -55.16682, 'SUR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Juba', 369000, 'Y', 4.85165, 31.58247, 'SSD');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Sao Tome', 'São Tomé', 80000, 'Y', 0.33654, 6.72732, 'STP');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('San Salvador', 1107000, 'Y', 13.68935, -89.18718, 'SLV');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Damascus', 2320000, 'Y', 33.5102, 36.29128, 'SYR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Mbabane', 68000, 'Y', -26.31667, 31.13333, 'SWZ');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Lobamba', 5800, 'Y', -26.44759, 31.20673, 'SWZ');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('N''Djamena', 'N’Djamena', 1323000, 'Y', 12.10672, 15.0444, 'TCD');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Lome', 'Lomé', 1746000, 'Y', 6.12874, 1.22154, 'TGO');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bangkok', 10156000, 'Y', 13.75398, 100.50144, 'THA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Dushanbe', 873000, 'Y', 38.53575, 68.77905, 'TJK');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Dili', 'Díli', 281000, 'Y', -8.55861, 125.57361, 'TLS');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Ashgabat', 810000, 'Y', 37.95, 58.38333, 'TKM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tunis', 2291000, 'Y', 36.81897, 10.16579, 'TUN');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Nuku''alofa', 'Nuku’alofa', 23000, 'Y', -21.13938, -175.2018, 'TON');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Ankara', 4919000, 'Y', 39.91987, 32.85427, 'TUR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Port of Spain', 544000, 'Y', 10.66668, -61.51889, 'TTO');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Funafuti', 7000, 'Y', -8.52425, 179.19417, 'TUV');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Taipei', 2706000, 'Y', 25.04776, 121.53185, 'TWN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Dar es Salaam', 6048000, 'Y', -6.81857, 39.28921, 'TZA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Dodoma', 262000, 'Y', -6.17221, 35.73947, 'TZA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kiev', 2957000, 'Y', 50.44784, 30.53368, 'UKR');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kampala', 2986000, 'Y', 0.31628, 32.58219, 'UGA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Washington, D.C.', 5207000, 'Y', 38.88978, -77.00906, 'USA');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Montevideo', 1737000, 'Y', -34.90328, -56.18816, 'URY');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Tashkent', 2464000, 'Y', 41.26465, 69.21627, 'UZB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Vatican City', 1000, 'Y', 41.90268, 12.45414, 'VAT');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Kingstown', 27000, 'Y', 13.15527, -61.22742, 'VCT');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Caracas', 2935000, 'Y', 10.48801, -66.87919, 'VEN');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Hanoi', 1064000, 'Y', 21.0245, 105.84117, 'VNM');
--INSERT INTO cities (name, official_name, population, is_capital, latitude, longitude, country_id) VALUES ('Port Vila', 'Port-Vila', 53000, 'Y', -17.73648, 168.31366, 'VUT');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Apia', 36000, 'Y', -13.83333, -171.76666, 'WSM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Prishtina', 207062, 'Y', 42.66474, 21.16413, 'XKX');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Sanaa', 2779000, 'Y', 15.35472, 44.20667, 'YEM');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Pretoria', 2378000, 'Y', -25.74486, 28.18783, 'ZAF');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Cape Town', 4430000, 'Y', -33.9254, 18.42355, 'ZAF');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Bloemfontein', 465000, 'Y', -29.12036, 26.22535, 'ZAF');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Lusaka', 2524000, 'Y', -15.40669, 28.28713, 'ZMB');
--INSERT INTO cities (name, population, is_capital, latitude, longitude, country_id) VALUES ('Harare', 1515000, 'Y', -17.82772, 31.05337, 'ZWE');

/*********************************************/
/***************** COMMIT ********************/
/*********************************************/

COMMIT;