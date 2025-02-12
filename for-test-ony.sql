START TRANSACTION;

SELECT @id := COUNT(id_order) + 1 from Orders;


INSERT INTO Orders(id_order, id_customer, incom_date, state, delivered_date)
			  VALUES(@id, 1, '23456543', 'pending', 'pending' );
              
INSERT INTO Order_Detail(id_order,  id_article, amount, unit_price, taxes, total_price )
			 VALUES(@id,1, 2, 20, 2, 42 );
             
             INSERT INTO Order_Detail(id_order,  id_article, amount, unit_price, taxes, total_price )
			 VALUES(@id,1, 2, 20, 2, 42 );

COMMIT

INSERT INTO notes (title, contents)
VALUES 
('My First Note', 'A note about something'),
('My Second Note', 'A note about something else');

///////
INSERT INTO `phi_db`.`Collections` (`id_collection`, `name`, `date`, `active`) VALUES ('1', 'Secondhand Kleidung', '1666210638891', 'yes');
INSERT INTO `phi_db`.`Collections` (`id_collection`, `name`, `date`, `active`) VALUES ('2', 'Ätherische öle', '1666210638891', 'yes');
INSERT INTO `phi_db`.`Collections` (`id_collection`, `name`, `date`, `active`) VALUES ('3', 'Fair fashion', '1666210638891', 'yes');
INSERT INTO `phi_db`.`Collections` (`id_collection`, `name`, `date`, `active`) VALUES ('4', 'Detox denim', '1666210638891', 'yes');
INSERT INTO `phi_db`.`Collections` (`id_collection`, `name`, `date`, `active`) VALUES ('5', 'Küchenzubehör', '1666210638891', 'yes');
INSERT INTO `phi_db`.`Collections` (`id_collection`, `name`, `date`, `active`) VALUES ('6', 'Kunstgalerie', '1666210638891', 'yes');
INSERT INTO `phi_db`.`Collections` (`id_collection`, `name`, `date`, `active`) VALUES ('7', 'Kosmetik', '1666210638891', 'yes');


INSERT INTO `phi_db`.`Orders` (`id_order`, `id_sale`, `id_customer`, `incom_date`, `state`, `delivered_date`) VALUES ('1', '1', '1', '1666342206340', 'delivered', '1666342206340');
INSERT INTO `phi_db`.`Sales` (`id_sale`, `id_customer`, `conversion_date`) VALUES ('1', '1', '1666210638891');
INSERT INTO `phi_db`.`Sales_Details` (`id_sale`, `id_customer`, `conversion_date`) VALUES ('1', '1', '1666342979183');



INSERT INTO `phi_db`.`Customer` (`id_customer`, `vor_name`, `nach_name`, `gender`, `email`, `telephone`, `street_and_nr`, `PLZ`, `ort`) VALUES ('1', 'David', 'Castillo', 'Herr', 'david@gmail.com', '123456789', 'Kirchenstr. 12', '25364', 'Brande - Hörnerkirchen');

SELECT * FROM phi_db.Users, phi_db.User_Logs WHERE Users.id_user = 1;


SELECT * FROM phi_db.Arrival, phi_db.Arrivals_Details WHERE Arrival.id_arrival = Arrivals_Details.id_arrival;

SELECT * FROM phi_db.Arrival, phi_db.Arrivals_Details, phi_db.Articles WHERE Arrival.id_arrival = Arrivals_Details.id_arrival AND Arrivals_Details.id_article = Articles.id_article AND Articles.id_article = 2;

INSERT INTO `phi_db`.`Arrival` (`id_arrival`, `id_provider`, `state`, `observations`) VALUES ('2', '1', 'pending', 'Alles gut gelaufen');

SELECT * FROM phi_db.Collections,phi_db.Collection_Datails, phi_db.Articles WHERE Collections.id_collection = 1 AND Collection_Datails.id_article = Articles.id_article;


INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('5', 'phi-005-su', 'Süßholz', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic5.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg')

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('6', 'phi-006-ka', 'Kamillen Extrakt', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic6.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg')

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('7', 'phi-007-ka', 'Short und T-shirt', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic7.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg')

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('8', 'phi-008-ka', 'Körpercreme', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic8.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('9', 'phi-009-ki', 'Kirschblüten Extrakt', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic9.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('10', 'phi-010-po', 'Postkarte', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic10.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('11', 'phi-011-ic', 'Ice Tea', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic11.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('12', 'phi-012-ab', 'Abschminktücher', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic12.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('13', 'phi-013-bl', 'Blusen Set', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic13.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('14', 'phi-014-se', 'Second hand Kleider', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic14.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('15', 'phi-015-bu', 'Bürsten', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic15.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('16', 'phi-016-ba', 'Badezimmer Set', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic16.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('17', 'phi-017-ge', 'Geschenkstoff', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic17.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('18', 'phi-018-tr', 'Trinkflasche', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic18.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('19', 'phi-019-sc', 'Schönheitsextrakt Set', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic19.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('20', 'phi-020-ca', 'Cannabisöl', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic20.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('21', 'phi-021-me', 'Metal Trinkflasche', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic21.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('22', 'phi-022-ge', 'Gesichtscreme', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic22.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('23', 'phi-023-pu', 'Pullover', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic23.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('24', 'phi-024-ei', 'Einlkaufstasche', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic24.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('25', 'phi-025-se', 'Second Hand Jeans', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic25.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('26', 'phi-026-po', 'Postkarte', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic26.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('27', 'phi-027-pl', 'Plakat', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic27.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');

INSERT INTO `phi_db`.`Articles` (`id_article`, `cod_article`, `name`, `shipping_days`, `short_description`, `long_description`, `date`, `stock`, `active`, `pic_1`, `pic_2`, `pic_3`, `pic_4`) VALUES ('28', 'phi-028-pi', 'Pinsel', '2-3', 'Spezifikationen\n', 'Dies ist eine ausführlichere Beschreibung des Artikels. Hier kann man weitere Details des Artikels beschreiben', '1666175423138', '40', 'yes', '../../assets/detail-article/pic28.jpg', '../../assets/detail-article/img-holder-pic2.jpg', '../../assets/detail-article/img-holder-pic3.jpg', '../../assets/detail-article/img-holder-pic4.jpg');


UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '1');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '2');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '3');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '4');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '6');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '7');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '8');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '9');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '10');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '11');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '12');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '13');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '14');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '15');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '16');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '17');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '18');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '19');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '20');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '21');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '22');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '23');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '24');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '25');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '26');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '27');
UPDATE `phi_db`.`Articles` SET `price` = '100' WHERE (`id_article` = '28');