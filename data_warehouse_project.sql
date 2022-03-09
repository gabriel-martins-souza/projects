#SRD PROJECT SUBMISSION - GROUP 07
#m20210598 Gabriel Souza
#m20210910 Beatriz Perez
#m20210554 Luis Vizeu

CREATE SCHEMA IF NOT EXISTS `restaurant_group07` DEFAULT CHARACTER SET utf8 ;


USE `restaurant_group07` ;

#CREATING TABLES IN THE DATABASE

-- -----------------------------------------------------
-- Table `restaurant_group07`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`CUSTOMER` (
  `CUSTOMER_ID` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Costumer ID defined as included in the database.',
  `FIRST_NAME` VARCHAR(100) NOT NULL COMMENT 'First name of the costumer.',
  `LAST_NAME` VARCHAR(100) NOT NULL COMMENT 'Last name of the costumer.',
  `EMAIL` VARCHAR(45) NULL COMMENT 'Costumer email.',
  `ADDRESS_ID` INTEGER NULL COMMENT 'Link to address table.',
  `FISCAL_ID` INTEGER NOT NULL COMMENT 'Fiscal identification (such as NIF).',
  `PHONE` VARCHAR(30) NULL COMMENT 'Costumer phone number including abroad code, if appliable.',
  `AGE` INTEGER NOT NULL COMMENT 'Costumer age as integer',
  PRIMARY KEY (`CUSTOMER_ID`))
;


-- -----------------------------------------------------
-- Table `restaurant_group07`.`ADDRESS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`ADDRESS` (
  `ADDRESS_ID` INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Address ID.',
  `STREET` VARCHAR(100) NOT NULL COMMENT 'Street name.',
  `NUMBER` INTEGER NOT NULL COMMENT 'Residential number.',
  `COMPLEMENT` VARCHAR(30) NULL COMMENT 'Residential complement (building, door etc.).',
  `ZIP_CODE` VARCHAR(20) NULL COMMENT 'ZIP_CODE / Postal Code',
  `CITY` VARCHAR(45) NOT NULL COMMENT 'City.',
  `STATE` VARCHAR(45) NOT NULL COMMENT 'State.',
  `COUNTRY` VARCHAR(45) NOT NULL COMMENT 'Country.',
  PRIMARY KEY (`ADDRESS_ID`))
;


-- -----------------------------------------------------
-- Table `restaurant_group07`.`DISHES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`DISHES` (
  `DISH_ID` INTEGER NOT NULL,
  `RECIPE_ID` INTEGER NOT NULL,
  `DISH_NAME` VARCHAR(45) NOT NULL,
  `COST` FLOAT NOT NULL,
  `PRICE` FLOAT NOT NULL,
  PRIMARY KEY (`DISH_ID`))
;


-- -----------------------------------------------------
-- Table `restaurant_group07`.`RECIPE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`RECIPE` (
  `RECIPE_ID` INTEGER NOT NULL,
  `DESCRIPTION` VARCHAR(500) NOT NULL,
  `RAW_ID` INTEGER NOT NULL,
  PRIMARY KEY (`RECIPE_ID`))
;


-- -----------------------------------------------------
-- Table `restaurant_group07`.`RAW_MATERIAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`RAW_MATERIAL` (
  `RAW_ID` INTEGER NOT NULL,
  `RAW_NAME` VARCHAR(45) NOT NULL,
  `RAW_PRICE` FLOAT NOT NULL,
  `SUPPLIER_ID` INTEGER NOT NULL,
  PRIMARY KEY (`RAW_ID`))
;


-- -----------------------------------------------------
-- Table `restaurant_group07`.`SUPPLIER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`SUPPLIER` (
  `SUPPLIER_ID` INTEGER NOT NULL,
  `NAME` VARCHAR(45) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `PHONE` VARCHAR(30) NOT NULL,
  `ADDRESS_ID` INTEGER NULL,
  PRIMARY KEY (`SUPPLIER_ID`))
;


-- -----------------------------------------------------
-- Table `restaurant_group07`.`ORDER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`ORDER` (
  `ORDER_ID` INTEGER AUTO_INCREMENT NOT NULL,
  `PAYMENT_ID` INTEGER NOT NULL,
  `CUSTOMER_ID` INTEGER NOT NULL,
  `ORDER_DATE` DATE NOT NULL,
  `DISH_ID` INTEGER NOT NULL,
  `RATING` INTEGER NULL COMMENT 'Rating ranges from 1 to 5',
  `ORDER_QUANTITY` INTEGER NOT NULL,
  `ORDER_TOTAL` FLOAT NOT NULL,
  PRIMARY KEY (`ORDER_ID`))
;


-- -----------------------------------------------------
-- Table `restaurant_group07`.`PAYMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`PAYMENT` (
  `PAYMENT_ID` INTEGER NOT NULL,
  `ISSUED_DATE` DATE NOT NULL,
  `ORDER_TOTAL` FLOAT NOT NULL,
  `TAX` FLOAT NOT NULL,
  `DISCOUNT_RATE` FLOAT NOT NULL,
  `PAYMENT_TOTAL` FLOAT NOT NULL,
  `CUSTOMER_ID` INTEGER NOT NULL,
  `PAYMENT_TYPE` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`PAYMENT_ID`))
;


-- -----------------------------------------------------
-- Table `restaurant_group07`.`RESERVATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`RESERVATION` (
  `RESERVATION_ID` INTEGER NOT NULL,
  `CUSTOMER_ID` INTEGER NOT NULL,
  `RESERVATION_DATE` DATE NOT NULL,
  `PARTY_SIZE` INT NULL,
  PRIMARY KEY (`RESERVATION_ID`))
;


-- -----------------------------------------------------
-- Table `restaurant_group07`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`EMPLOYEE` (
  `EMPLOYEE_ID` INTEGER NOT NULL,
  `FIRST_NAME` VARCHAR(100) NOT NULL,
  `LAST_NAME` VARCHAR(100) NOT NULL,
  `EMAIL` VARCHAR(45) NOT NULL,
  `NIF` INTEGER NOT NULL,
  `PHONE` VARCHAR(30) NOT NULL,
  `AGE` INTEGER NOT NULL,
  `JOB_ID` INTEGER NULL,
  `SALARY` FLOAT NULL,
  `COMMISSION_PCT` FLOAT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`));


-- -----------------------------------------------------
-- Table `restaurant_group07`.`JOB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`JOB` (
  `JOB_ID` INTEGER NOT NULL,
  `JOB_DESCRIPTION` VARCHAR(100) NOT NULL,
  `DEPT_ID` INTEGER NOT NULL,
  PRIMARY KEY (`JOB_ID`))
;

-- -----------------------------------------------------
-- Table `restaurant_group07`.`DEPARTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`DEPARTMENT` (
  `DEPT_ID` INTEGER NOT NULL,
  `DEPARTMENT_NAME` VARCHAR(100) NOT NULL,
  `HEADCOUNT` INTEGER NOT NULL,
  PRIMARY KEY (`DEPT_ID`))
;


#INSERTING DATA INTO THE TABLES

INSERT INTO `restaurant_group07`.`CUSTOMER` (`CUSTOMER_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `ADDRESS_ID`, `FISCAL_ID`,`PHONE`, `AGE`) VALUES
(18840054, 'Cristiano', 'Ronaldo', 'cristiano.ronaldo@yahoo.com', 24570689 , 198637, 949108252, 18),
(17153633, 'Erick', 'Moura', 'erick.moura@yahoo.com', 35810263 , 157878, 863425639, 40),
(16768049, 'Natália', 'Nobre', 'natália.nobre@yahoo.com', 39916623 , 227831, 890844120, 64),
(19904433, 'Izabella', 'Tabosa', 'izabella.tabosa@yahoo.com', 31400650 , 336918, 811804939, 37),
(13436544, 'Vitória', 'Maia', 'vitória.maia@yahoo.com', 24078089 , 884908, 982010891, 28),
(15653697, 'Ilídio', 'Raposo', 'ilídio.raposo@google.com', 35810263 , 437299, 711181417, 43),
(19052964, 'Dânia', 'Valim', 'dânia.valim@google.com', 39916623 , 185033, 887391104, 62),
(17805469, 'Lionel', 'Messi', 'lionel.messi@google.com', 41250202 , 218766, 796839355, 25),
(12115636, 'Neymar', 'Junior', 'neymar.junior@google.com', 40203625 , 608228, 865462490, 63),
(12344897, 'Abraão', 'Barcelos', 'abraão.barcelos@google.com', 20874981 , 489644, 863434241, 67),
(18561229, 'Matthias', 'Severo', 'matthias.severo@google.com', 33622412 , 338497, 730040670, 65),
(17077352, 'Hayla', 'Garrid', 'hayla.garrid@google.com', 26836903 , 436535, 868628129, 36),
(11424997, 'Lavinia', 'Miranda', 'lavinia.miranda@google.com', 38601076 , 301886, 793095966, 63),
(13424376, 'Josefina', 'Pegado', 'josefina.pegado@sapo.pt', 21810486 , 451340, 931343121, 38),
(17886239, 'Manuel', 'Nogueira', 'manuel.nogueira@sapo.pt', 36165288 , 978634, 738697709, 23),
(10744822, 'Helena', 'Teofilo', 'helena.teofilo@sapo.pt', 37740748 , 615003, 773897581, 63),
(14376949, 'Olivia', 'Quintana', 'olivia.quintana@sapo.pt', 21725836 , 175263, 991715535, 59),
(15020607, 'Emilie', 'Saraiva', 'emilie.saraiva@sapo.pt', 38625055 , 267767, 865527567, 73),
(16835507, 'Emanuelle', 'Modesto', 'emanuelle.modesto@sapo.pt', 31937924 , 436082, 790160586, 24),
(19998084, 'Artur', 'Aveiro', 'artur.aveiro@icloud.com', 35120613 , 802929, 922082654, 64),
(13605367, 'Vitor', 'Novais', 'vitor.novais@icloud.com', 38537307 , 394367, 858474804, 17),
(13189711, 'Marisol', 'Arantes', 'marisol.arantes@icloud.com', 31270825 , 660303, 728598437, 70),
(14483387, 'Rodrigo', 'Camilo', 'rodrigo.camilo@icloud.com', 37740237 , 438533, 777820278, 22),
(11604445, 'Evandro', 'Lins', 'evandro.lins@google.com', 38601076 , 656973, 877727243, 35),
(15242179, 'Gabriela', 'Gois', 'gabriela.gois@google.com', 21810486 , 132721, 961348426, 62),
(11683155, 'Aliana', 'Lemes', 'aliana.lemes@google.com', 36165288 , 887236, 969763331, 73),
(11970435, 'Robert', 'Lewandovski', 'robert.lewandovski@google.com', 37740748 , 952128, 741476784, 35),
(15067801, 'Michael', 'Linhares', 'michael.linhares@google.com', 21725836 , 106783, 742987267, 42);


INSERT INTO `restaurant_group07`.`ADDRESS` (`ADDRESS_ID`,`STREET`,`NUMBER`,`COMPLEMENT`,`ZIP_CODE`,`CITY`,`STATE`,`COUNTRY`) VALUES
(35810263, 'R São Silvestre', '84', 'Apartamento 15', '4835-452', 'Tabuadelo', 'Braga', 'Portugal'),
(39916623, 'R Afonso Albuquerque', '102', '', '2430-096', 'Embra', 'Leiria', 'Portugal'),
(31400650, 'R Miguel Bombarda', '86', 'R/C Esquerdo', '2445-207', 'Pataias', 'Leiria', 'Portugal'),
(24078089, 'R São Domingos', '96', '', '2650-043', 'Amadora', 'Lisboa', 'Portugal'),
(23082702, 'Avenida Madre Andaluz', '83', '', '2040-329', 'Rio Maior', 'Santarém', 'Portugal'),
(29677284, 'R Combatentes G Guerra', '90', '', '3080-019', 'Figueira Da Foz', 'Coimbra', 'Portugal'),
(26363307, 'R João C Loureiro', '106', 'Apartamento 12', '3830-295', 'Vista Alegre', 'Aveiro', 'Portugal'),
(24570689, 'R Alferes Veiga Pestana', '47', 'Ilha Inteira', '9230-086', 'Caminho Chão', 'Ilha da Madeira', 'Portugal'),
(31937924, 'R Doutor Manuel Faria', '96', 'Casa 2', '4805-595', 'Donim', 'Braga', 'Portugal'),
(35120613, 'Rua Pé Mouro Armz', '110', '', '2730-239', 'Leceia', 'Lisboa', 'Portugal'),
(38537307, 'R Fundo Vila', '21', '', '5400-785', 'Soutelinho Da Raia', 'Vila Real', 'Portugal'),
(31270825, 'Rua Comandante Henrique Brito', '85', '', '8950-143', 'Castro Marim', 'Faro', 'Portugal'),
(37740237, 'R Cimo Vila', '47', 'Apartamento 11', '4590-688', 'Raimonda', 'Porto', 'Portugal'),
(27905997, 'R Doutor Paulo Quintela', '72', 'Apartamento 08', '3025-317', 'Coimbra', 'Coimbra', 'Portugal'),
(36984298, 'Rua Cais', '110', '', '9950-538', 'São Mateus', 'Ilha do Pico', 'Portugal'),
(20874981, 'Rua Capitão Henrique Galvão', '69', '', '2705-036', 'Lisboa', 'Lisboa', 'Portugal'),
(33622412, 'R Germana Tânger', '113', 'Apartamento 10', '2730-006', 'Lisboa', 'Lisboa', 'Portugal'),
(26836903, 'Avenida Sacadura Cabral', '95', 'Apartamento 35', '1685-447', 'Lisboa', 'Lisboa', 'Portugal'),
(38601076, 'R Irene Lisboa', '133', 'Lote B', '2680-110', 'Lisboa', 'Lisboa', 'Portugal'),
(21810486, 'Praceta Maria Lamas', '1039', 'Casa 1B', '2705-711', 'Lisboa', 'Lisboa', 'Portugal'),
(36165288, 'R Alto Eira ', '152', '', '2745-221', 'Lisboa', 'Lisboa', 'Portugal'),
(37740748, 'Avenida Duque Ávila', '126', '', '2530-518', 'Lisboa', 'Lisboa', 'Portugal'),
(21725836, 'Avenida João Crisóstomo', '107', '', '2680-037', 'Lisboa', 'Lisboa', 'Portugal'),
(38625055, 'Avenida República', '153', '', '1900-101', 'Lisboa', 'Lisboa', 'Portugal'),
(41250202, 'Avenida 9 de Julho', '1000', 'Prédio Inteiro', '6030-000', 'Buenos Aires', 'Buenos Aires', 'Argentina'),
(40203625, 'Avenida Paulista', '500', 'Casa A', '01311-903', 'São Paulo', 'São Paulo', 'Brazil');

INSERT INTO `restaurant_group07`.`DISHES` (`DISH_ID`,`RECIPE_ID`,`DISH_NAME`,`COST`,`PRICE`) VALUES
(346525, '125', 'Bacalhau à Brás', '20', '29'),
(362699, '87', 'Polvo à Lagareiro', '30', '44'),
(557163, '53', 'Arroz de Pato', '12', '18'),
(648480, '94', 'Caldo Verde', '3', '5'),
(577321, '46', 'Arroz de Marisco', '15', '22'),
(443538, '22', 'Cataplana de mariscos', '15', '22'),
(597498, '18', 'Sardinhas grelhadas', '10', '15'),
(579728, '1', 'Risoto de gambas', '20', '29'),
(547956, '55', 'Risoto Funghi', '8', '12'),
(646909, '23', 'Francesinha', '20', '29'),
(525607, '12', 'Lagosta com manteiga de ervas', '50', '73'),
(333259, '93', 'Coelho à Caçador', '15', '22'),
(421697, '49', 'Entrecôte Paris', '45', '66'),
(217979, '15', 'Lasagna Bolognese Italia', '13', '19'),
(536291, '37', 'Leitão a pururuca Brazil', '15', '22'),
(137774, '86', 'Paella Espanha', '15', '22'),
(305062, '78', 'Parrillada Argentina', '45', '66'),
(592818, '6', 'Tacos al pastor Mexico', '20', '29'),
(378979, '32', 'Sukiyaki Japão', '20', '29'),
(643009, '13', 'Curry de Peixe India', '20', '29'),
(627859, '201', 'Torta de Chololate', '8', '12'),
(362219, '202', 'Creme Brulee', '8', '12'),
(457118, '203', 'Pastel de Nata', '4', '6');

INSERT INTO `restaurant_group07`.`RECIPE` (`RECIPE_ID`,`DESCRIPTION`,`RAW_ID`) VALUES
(125, 'Bacalhau à Brás', '244024'),
(87, 'Polvo à Lagareiro', '179766'),
(53, 'Arroz de Pato', '157485'),
(94, 'Caldo Verde', '197002'),
(46, 'Arroz de Marisco', '130117'),
(22, 'Cataplana de mariscos', '130117'),
(18, 'Sardinhas grelhadas', '216354'),
(1, 'Risoto de gambas', '184447'),
(55, 'Risoto Funghi', '218711'),
(23, 'Francesinha', '237281'),
(12, 'Lagosta com manteiga de ervas', '137180'),
(93, 'Coelho à Caçador', '182760'),
(49, 'Entrecôte Paris', '185368'),
(15, 'Lasagna Bolognese Italia', '185973'),
(37, 'Leitão a pururuca Brazil', '234069'),
(86, 'Paella Espanha', '130117'),
(78, 'Parrillada Argentina', '185368'),
(6, 'Tacos al pastor Mexico', '229335'),
(32, 'Sukiyaki Japão', '248384'),
(13, 'Curry de Peixe India', '128756'),
(201, 'Torta de Chololate', '410443'),
(202, 'Creme Brulee', '485398'),
(203, 'Pastel de Nata', '455791');

INSERT INTO `restaurant_group07`.`RAW_MATERIAL` (`RAW_ID`,`RAW_NAME`,`RAW_PRICE`,`SUPPLIER_ID`) VALUES
(244024, 'bacalhau', '20', '345789702'),
(179766, 'polvo', '30', '345789702'),
(157485, 'pato', '12', '506288311'),
(197002, 'couve', '3', '108248077'),
(130117, 'marisco', '15', '345789702'),
(216354, 'sardinha', '10', '345789702'),
(184447, 'gambas', '20', '345789702'),
(218711, 'cogumelos', '8', '108248077'),
(237281, 'vitela', '20', '506288311'),
(137180, 'lagosta', '50', '345789702'),
(182760, 'coelho', '15', '506288311'),
(185368, 'entrecote', '45', '506288311'),
(185973, 'massas', '13', '271270485'),
(234069, 'porco', '15', '506288311'),
(229335, 'tortilha', '20', '271270485'),
(248384, 'macarrao', '20', '271270485'),
(128756, 'peixe', '20', '345789702'),
(410443, 'chocolate', '8', '425265503'),
(485398, 'baunilha', '8', '545079289'),
(455791, 'ovos', '4', '271270485');

INSERT INTO `restaurant_group07`.`SUPPLIER` (`SUPPLIER_ID`,`NAME`,`EMAIL`,`PHONE`,`ADDRESS_ID`) VALUES
(506288311, 'carnes lisboa', 'carnes@gmail.com', '953259948', '23082702'),
(345789702, 'pescados lisboa', 'pescados@gmail.com', '997243496', '29677284'),
(108248077, 'vegetais lisboa', 'vegetais@gmail.com', '929712775', '26363307'),
(253311373, 'frutas lisboa', 'frutas@gmail.com', '945528961', '27905997'),
(425265503, 'chocolates SA', 'chocolates@yahoo.com', '918321624', '36984298'),
(271270485, 'massas SA', 'massas@yahoo.com', '925550615', '23082702'),
(341623770, 'temperos SA', 'temperos@yahoo.com', '878407366', '29677284'),
(545079289, 'cereais Porto', 'cereais@sapo.pt', '920075776', '26363307'),
(188750144, 'charcutaria Porto', 'charcutaria@sapo.pt', '847906878', '27905997'),
(367244943, 'segurança Porto', 'segurança@sapo.pt', '904445814', '36165288'),
(543231666, 'garçons Porto', 'garçons@sapo.pt', '960022645', '37740748'),
(404015528, 'eventos lisboa', 'eventos@sapo.pt', '993926878', '21725836'),
(57310139, 'decoração SA', 'decoração@gmail.com', '830965556', '35810263'),
(393582870, 'papelaria SA', 'papelaria@gmail.com', '873264472', '39916623'),
(564755650, 'limpeza SA', 'limpeza@gmail.com', '889692534', '31400650'),
(67123618, 'gás Porto', 'gás@gmail.com', '861037814', '24078089'),
(202284012, 'luz lisboa', 'luz@gmail.com', '817843418', '31937924'),
(458375572, 'água SA', 'água@aol.com', '973929040', '35120613'),
(404124812, 'panelas SA', 'panelas@aol.com', '831412568', '38537307'),
(298692442, 'marcenaria Porto', 'marcenaria@aol.com', '832713636', '37740748');

INSERT INTO `restaurant_group07`.`ORDER` (`ORDER_ID`,`PAYMENT_ID`,`CUSTOMER_ID`,`ORDER_DATE`,`DISH_ID`,`RATING`,`ORDER_QUANTITY`,`ORDER_TOTAL`) VALUES
(48037455, '95081588', '18840054', '2020/11/02', '346525','5', '1', '29'),
(25994998, '97742366', '17153633', '2020/11/27', '362699','5', '4', '176'),
(16935986, '87248916', '16768049', '2020/11/25', '557163','5', '4', '72'),
(34842553, '80788819', '19904433', '2020/12/04', '648480','3', '4', '20'),
(62951719, '85274407', '13436544', '2020/11/22', '577321','4', '3', '66'),
(32174889, '92268607', '15653697', '2020/11/20', '443538',NULL, '4', '88'),
(66225636, '80442937', '19052964', '2020/11/23', '597498',NULL, '5', '75'),
(56636849, '96082155', '17805469', '2020/11/06', '579728','5', '2', '58'),
(45863083, '94594077', '12115636', '2020/11/04', '547956','5', '1', '12'),
(27066000, '96138589', '12344897', '2020/11/19', '646909',NULL, '2', '58'),
(59862794, '94789506', '18561229', '2020/11/11', '525607',NULL, '5', '365'),
(24158529, '86062371', '17077352', '2020/10/27', '333259','5', '5', '110'),
(57702422, '92249112', '11424997', '2020/10/15', '421697',NULL, '5', '330'),
(18049242, '81838692', '13424376', '2020/09/27', '217979','5', '2', '38'),
(29809769, '94924728', '17886239', '2020/09/12', '536291','5', '5', '110'),
(51463554, '95621101', '10744822', '2020/10/01', '137774',NULL, '2', '44'),
(53262482, '89339670', '14376949', '2020/09/25', '305062',NULL, '5', '330'),
(43625615, '89777019', '15020607', '2020/10/15', '592818',NULL, '4', '116'),
(32783201, '98240902', '16835507', '2020/10/29', '378979','5', '2', '58'),
(33981631, '88463380', '19998084', '2020/11/13', '643009','5', '2', '58'),
(12777862, '87927014', '13605367', '2020/12/11', '627859',NULL, '4', '48'),
(38898208, '82125325', '13189711', '2020/12/17', '362219',NULL, '1', '12'),
(59127151, '97380057', '14483387', '2020/12/03', '457118',NULL, '5', '30'),
(55734021, '96127584', '11604445', '2020/12/06', '346525','5', '2', '58'),
(21100414, '92905865', '15242179', '2020/12/25', '362699','5', '3', '132'),
(42894812, '86405533', '11683155', '2020/12/30', '557163',NULL, '4', '72'),
(57956533, '92051694', '11970435', '2020/12/21', '648480',NULL, '5', '25'),
(45870244, '96017823', '15067801', '2020/12/23', '577321',NULL, '2', '44'),
(59567820, '82109967', '12344897', '2021/01/07', '443538','4', '3', '66'),
(66499065, '90564615', '18561229', '2021/01/18', '597498','4', '1', '15'),
(39659259, '97333547', '17077352', '2021/02/08', '579728','4', '3', '87'),
(40645203, '96686740', '11424997', '2021/02/06', '547956','5', '3', '36'),
(18772847, '98694433', '13424376', '2021/02/23', '646909','5', '2', '58'),
(49621420, '85676133', '17886239', '2021/02/13', '217979','5', '4', '76'),
(58045592, '97039964', '10744822', '2021/02/10', '536291',NULL, '3', '66'),
(38522862, '88313627', '14376949', '2021/01/26', '137774',NULL, '1', '22'),
(60286763, '89076732', '17077352', '2021/02/25', '305062',NULL, '4', '264'),
(58951681, '82426295', '11424997', '2021/02/17', '592818',NULL, '3', '87'),
(64591598, '92793272', '13424376', '2021/02/04', '378979',NULL, '2', '58'),
(41615646, '81654852', '17886239', '2021/03/04', '627859','5', '3', '36'),
(63083494, '99581467', '10744822', '2021/03/15', '362219','5', '5', '60');

INSERT INTO `restaurant_group07`.`PAYMENT` (`PAYMENT_ID`,`ISSUED_DATE`,`ORDER_TOTAL`,`TAX`,`DISCOUNT_RATE`,`PAYMENT_TOTAL`,`CUSTOMER_ID`,`PAYMENT_TYPE`) VALUES
(95081588, '2020/11/02', '29', '6.67', '0.10', '32.77', '18840054', 'card'),
(97742366, '2020/11/27', '176', '40.48', '0.00', '216.48', '17153633', 'cash'),
(87248916, '2020/11/25', '72', '16.56', '0.00', '88.56', '16768049', 'card'),
(80788819, '2020/12/04', '20', '4.6', '0.05', '23.6', '19904433', 'cash'),
(85274407, '2020/11/22', '66', '15.18', '0.10', '74.58', '13436544', 'voucher'),
(92268607, '2020/11/20', '88', '20.24', '0.15', '95.04', '15653697', 'voucher'),
(80442937, '2020/11/23', '75', '17.25', '0.20', '77.25', '19052964', 'card'),
(96082155, '2020/11/06', '58', '13.34', '0.25', '56.84', '17805469', 'card'),
(94594077, '2020/11/04', '12', '2.76', '0.00', '14.76', '12115636', 'card'),
(96138589, '2020/11/19', '58', '13.34', '0.05', '68.44', '12344897', 'cash'),
(94789506, '2020/11/11', '365', '83.95', '0.10', '412.45', '18561229', 'cash'),
(86062371, '2020/10/27', '110', '25.3', '0.00', '135.3', '17077352', 'card'),
(92249112, '2020/10/15', '330', '75.9', '0.00', '405.9', '11424997', 'cash'),
(81838692, '2020/09/27', '38', '8.74', '0.00', '46.74', '13424376', 'voucher'),
(94924728, '2020/09/12', '110', '25.3', '0.00', '135.3', '17886239', 'voucher'),
(95621101, '2020/10/01', '44', '10.12', '0.00', '54.12', '10744822', 'card'),
(89339670, '2020/09/25', '330', '75.9', '0.00', '405.9', '14376949', 'gold'),
(89777019, '2020/10/15', '116', '26.68', '0.05', '136.88', '15020607', 'card'),
(98240902, '2020/10/29', '58', '13.34', '0.10', '65.54', '16835507', 'cash'),
(88463380, '2020/11/13', '58', '13.34', '0.15', '62.64', '19998084', 'card'),
(87927014, '2020/12/11', '48', '11.04', '0.00', '59.04', '13605367', 'gold'),
(82125325, '2020/12/17', '12', '2.76', '0.00', '14.76', '13189711', 'card'),
(97380057, '2020/12/03', '30', '6.9', '0.00', '36.9', '14483387', 'cash'),
(96127584, '2020/12/06', '58', '13.34', '0.00', '71.34', '11604445', 'card'),
(92905865, '2020/12/25', '132', '30.36', '0.05', '155.76', '15242179', 'card'),
(86405533, '2020/12/30', '72', '16.56', '0.10', '81.36', '11683155', 'card'),
(92051694, '2020/12/21', '25', '5.75', '0.00', '30.75', '11970435', 'cash'),
(96017823, '2020/12/23', '44', '10.12', '0.00', '54.12', '15067801', 'cash'),
(82109967, '2021/01/07', '66', '15.18', '0.00', '81.18', '12344897', 'cash'),
(90564615, '2021/01/18', '15', '3.45', '0.00', '18.45', '18561229', 'card'),
(97333547, '2021/02/08', '87', '20.01', '0.00', '107.01', '17077352', 'cash'),
(96686740, '2021/02/06', '36', '8.28', '0.00', '44.28', '11424997', 'voucher'),
(98694433, '2021/02/23', '58', '13.34', '0.05', '68.44', '13424376', 'voucher'),
(85676133, '2021/02/13', '76', '17.48', '0.10', '85.88', '17886239', 'cash'),
(97039964, '2021/02/10', '66', '15.18', '0.15', '71.28', '10744822', 'cash'),
(88313627, '2021/01/26', '22', '05.06', '0.00', '27.06', '14376949', 'card'),
(89076732, '2021/02/25', '264', '60.72', '0.00', '324.72', '17077352', 'cash'),
(82426295, '2021/02/17', '87', '20.01', '0.00', '107.01', '11424997', 'voucher'),
(92793272, '2021/02/04', '58', '13.34', '0.00', '71.34', '13424376', 'voucher'),
(81654852, '2021/03/04', '36', '8.28', '0.05', '42.48', '17886239', 'card'),
(99581467, '2021/03/15', '60', '13.8', '0.10', '67.8', '10744822', 'cash');

INSERT INTO `restaurant_group07`.`RESERVATION` (`RESERVATION_ID`,`CUSTOMER_ID`,`RESERVATION_DATE`,`PARTY_SIZE`) VALUES
(234, '18840054', '2020/11/02', '1'),
(108, '17153633', '2020/11/27', '4'),
(280, '16768049', '2020/11/25', '4'),
(243, '19904433', '2020/12/04', '4'),
(272, '13436544', '2020/11/22', '3'),
(242, '15653697', '2020/11/20', '4'),
(219, '19052964', '2020/11/23', '5'),
(38, '17805469', '2020/11/06', '2'),
(107, '12115636', '2020/11/04', '1'),
(165, '12344897', '2020/11/19', '2'),
(189, '18561229', '2020/11/11', '5'),
(33, '17077352', '2020/10/27', '5'),
(232, '11424997', '2020/10/15', '5'),
(55, '13424376', '2020/09/27', '2'),
(186, '17886239', '2020/09/12', '5'),
(128, '10744822', '2020/10/01', '2'),
(24, '14376949', '2020/09/25', '5'),
(36, '15020607', '2020/10/15', '4'),
(263, '16835507', '2020/10/29', '2'),
(235, '19998084', '2020/11/13', '2'),
(122, '13605367', '2020/12/11', '4');

INSERT INTO `restaurant_group07`.`EMPLOYEE` (`EMPLOYEE_ID`,`FIRST_NAME`,`LAST_NAME`,`EMAIL`,`NIF`,`PHONE`,`AGE`,`JOB_ID`,`SALARY`,`COMMISSION_PCT`) VALUES
(168767, 'Carlos', 'Siqueira', 'carlos.siqueira@gmail.com.pt', '347986', '907388785', '23', '308921', '1200', '0.15'),
(313632, 'Miguel', 'Alonso', 'miguel.alonso@gmail.com.pt', '761356', '846351151', '40', '277185', '1000', '0'),
(470965, 'Sandro', 'Castro', 'sandro.castro@gmail.com.pt', '182344', '928093132', '51', '227453', '1500', '0'),
(226481, 'Alexa', 'Amazon', 'alexa.amazon@amazon.com.pt', '501513', '840473491', '49', '184543', '1200', '0'),
(514820, 'Shirley', 'Domingues', 'shirley.domingues@gmail.com.pt', '231624', '858504347', '19', '329098', '1000', '0'),
(374787, 'Sonia', 'Abrao', 'sonia.abrao@sapo.pt', '680262', '928104099', '53', '231532', '950', '0'),
(331050, 'Rebeca', 'Goncalves', 'rebeca.goncalves@amazon.com.pt', '585763', '991913737', '29', '358182', '1800', '0'),
(301391, 'Leila', 'Russo', 'leila.russo@gmail.com.pt', '126667', '956180652', '49', '315024', '1350', '0'),
(532318, 'Joao', 'Vizinho', 'joao.vizinho@sapo.pt', '689951', '850919887', '53', '107339', '1500', '0'),
(336413, 'Camilo', 'Freire', 'camilo.freire@amazon.com.pt', '353055', '991131469', '41', '346610', '1650', '0'),
(233074, 'Pedro', 'Alvarez', 'pedro.alvarez@gmail.com.pt', '650635', '852618521', '30', '263974', '1250', '0'),
(471017, 'Cristovao', 'Colombo', 'cristovao.colombo@sapo.pt', '785774', '885984859', '27', '291302', '1600', '0'),
(283719, 'Barack', 'Obama', 'barack.obama@amazon.com.pt', '525599', '927648444', '46', '331353', '2100', '0'),
(441875, 'Michael', 'Jackson', 'michael.jackson@gmail.com.pt', '695942', '925342872', '20', '131080', '1500', '0'),
(492596, 'Jair', 'Bolsonaro', 'jair.bolsonaro@gmail.com.pt', '409437', '963750557', '47', '406811', '1250', '0'),
(437308, 'Natasha', 'Romanov', 'natasha.romanov@gmail.com.pt', '477532', '972642916', '43', '151812', '1000', '0'),
(436753, 'Elizabeth', 'II', 'elizabeth.ii@amazon.com.pt', '535192', '844669908', '22', '195184', '1400', '0'),
(365588, 'Joana', 'Dark', 'joana.dark@gmail.com.pt', '545332', '974569485', '21', '260368', '1950', '0'),
(201429, 'Dilma', 'Rouseff', 'dilma.rouseff@sapo.pt', '670415', '825106193', '53', '123473', '1400', '0'),
(413208, 'Catarina', 'Jones', 'catarina.jones@amazon.com.pt', '744104', '801944741', '33', '190911', '1400', '0'),
(381345, 'Gal', 'Gadot', 'gal.gadot@gmail.com.pt', '568247', '857191348', '43', '358182', '1800', '0');


INSERT INTO `restaurant_group07`.`JOB` (`JOB_ID`,`JOB_DESCRIPTION`,`DEPT_ID`) VALUES
(308921, 'vendedor', '656102'), 
(277185, 'recepcionista', '713508'), 
(227453, 'garçon metri', '582261'), 
(184543, 'operador de caixa', '437043'), 
(329098, 'manobrista', '280167'), 
(231532, 'auxiliar de limpeza', '173111'), 
(358182, 'cozinheiro', '149087'), 
(315024, 'estoquista', '786592'), 
(107339, 'comprador', '308295'), 
(346610, 'auxiliar administrativo', '644449'), 
(263974, 'auxiliar de eventos', '382516'), 
(291302, 'supervisor de serviços', '644449'), 
(331353, 'gerente administrativo', '644449'), 
(131080, 'contador', '644449'), 
(406811, 'auxiliar de RH', '644449'), 
(151812, 'motorista', '382516'), 
(195184, 'somellier', '149087'), 
(260368, 'chef', '149087'), 
(123473, 'garçon carnes', '582261'), 
(190911, 'garçon sobremesas', '582261');

INSERT INTO `restaurant_group07`.`DEPARTMENT` (`DEPT_ID`,`DEPARTMENT_NAME`,`HEADCOUNT`) VALUES
(656102, 'vendas', '1'),
(713508, 'atendimento', '1'),
(582261, 'mesas', '3'),
(437043, 'caixa', '1'),
(280167, 'parking', '1'),
(173111, 'limpeza', '1'),
(149087, 'cozinha', '4'),
(786592, 'armazem', '1'),
(308295, 'compras', '1'),
(644449, 'administrativo', '5'),
(382516, 'entregas e reservas', '2');



#FOREIGN KEY'S DEFINITION:

ALTER TABLE `CUSTOMER`
ADD CONSTRAINT `fk_customer_1`
  FOREIGN KEY (`ADDRESS_ID`)
  REFERENCES `ADDRESS` (`ADDRESS_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `DISHES`
ADD CONSTRAINT `fk_dishes_1`
  FOREIGN KEY (`RECIPE_ID`)
  REFERENCES `RECIPE` (`RECIPE_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `RECIPE`
ADD CONSTRAINT `fk_recipe_1`
  FOREIGN KEY (`RAW_ID`)
  REFERENCES `RAW_MATERIAL` (`RAW_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `RAW_MATERIAL`
ADD CONSTRAINT `fk_raw_material_1`
  FOREIGN KEY (`SUPPLIER_ID`)
  REFERENCES `SUPPLIER` (`SUPPLIER_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `SUPPLIER`
ADD CONSTRAINT `fk_supplier_1`
  FOREIGN KEY (`ADDRESS_ID`)
  REFERENCES `ADDRESS` (`ADDRESS_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;  

ALTER TABLE `ORDER`
ADD CONSTRAINT `fk_order_1`
  FOREIGN KEY (`PAYMENT_ID`)
  REFERENCES `PAYMENT` (`PAYMENT_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_order_2`
  FOREIGN KEY (`CUSTOMER_ID`)
  REFERENCES `CUSTOMER` (`CUSTOMER_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_order_3`
  FOREIGN KEY (`DISH_ID`)
  REFERENCES `DISHES` (`DISH_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `PAYMENT`
ADD CONSTRAINT `fk_payment_1`
  FOREIGN KEY (`CUSTOMER_ID`)
  REFERENCES `CUSTOMER` (`CUSTOMER_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `RESERVATION`
ADD CONSTRAINT `fk_reservation_1`
  FOREIGN KEY (`CUSTOMER_ID`)
  REFERENCES `CUSTOMER` (`CUSTOMER_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `EMPLOYEE`
ADD CONSTRAINT `fk_employee_1`
  FOREIGN KEY (`JOB_ID`)
  REFERENCES `JOB` (`JOB_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `JOB`
ADD CONSTRAINT `fk_job_1`
  FOREIGN KEY (`DEPT_ID`)
  REFERENCES `DEPARTMENT` (`DEPT_ID`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;



# CREATING VIEWS FOR THE INVOICE

#View for invoice header
CREATE VIEW invoice_head_and_totals AS
SELECT
  `PAYMENT`.PAYMENT_ID AS invoice_number,
  `PAYMENT`.ISSUED_DATE AS date_of_issue,
  CONCAT(FIRST_NAME, ' ', LAST_NAME) AS client_name,
  STREET AS street_address,
  CONCAT (CITY,', ', STATE,', ',COUNTRY) AS city_state_country,
  ZIP_CODE,
  'Allied Restaurant' AS company_name,
  'Praça Dom Pedro IV 96, 1100-202 Lisboa' AS company_street,
  '351-964983169' AS phone,
  'alliedrestaurant@gmail.com' AS email,
  'alliedrestaurant.com' AS website,
  `PAYMENT`.ORDER_TOTAL AS subtotal,
  ROUND(`PAYMENT`.DISCOUNT_RATE*`PAYMENT`.ORDER_TOTAL,2) AS discount,
  0.23 AS tax_rate,
  `PAYMENT`.TAX,
  `PAYMENT`.PAYMENT_TOTAL AS invoice_total
FROM `ORDER`
  INNER JOIN `PAYMENT` ON `ORDER`.PAYMENT_ID = `PAYMENT`.PAYMENT_ID
    LEFT JOIN `CUSTOMER` ON `ORDER`.CUSTOMER_ID = `CUSTOMER`.CUSTOMER_ID
    LEFT JOIN `ADDRESS` ON `CUSTOMER`.ADDRESS_ID = `ADDRESS`.ADDRESS_ID
WHERE `PAYMENT`.PAYMENT_ID = '92905865';

#View for invoice details
CREATE VIEW invoice_details AS
SELECT
  DISH_NAME AS description,
  PRICE AS unit_cost,
  ORDER_QUANTITY AS quantity,
  ORDER_TOTAL AS amount
FROM `ORDER`
  INNER JOIN `DISHES` USING(DISH_ID)
WHERE PAYMENT_ID = '92905865';    




#CREATING TRIGGERS

#1) trigger to update the comission_pct if the new employee is a salesman
DELIMITER $$
CREATE TRIGGER employee_comission
BEFORE INSERT
ON `restaurant_group07`.`EMPLOYEE`
FOR EACH ROW
BEGIN
  IF NEW.JOB_ID = '308921' THEN
      SET NEW.COMMISSION_PCT = 0.15;
  END IF;
END $$
DELIMITER ;



#2) a trigger that inserts a row in a “log” table if the price of the raw material updates.
CREATE TABLE IF NOT EXISTS `restaurant_group07`.`LOG` (
  `ID` INTEGER NOT NULL AUTO_INCREMENT, 
    `USER` VARCHAR(30),
  `TIMESTAMP` DATETIME,
  `OLD_PRICE` FLOAT,
    `NEW_PRICE` FLOAT,
  `RAW_ID` INTEGER,
    PRIMARY KEY (`ID`));

DELIMITER $$
CREATE TRIGGER update_price
AFTER UPDATE
ON `restaurant_group07`.`RAW_MATERIAL`
FOR EACH ROW
BEGIN
  INSERT INTO `restaurant_group07`.`LOG` (`TIMESTAMP`, `USER`, `RAW_ID`, `OLD_PRICE`, `NEW_PRICE`) VALUES
    (now(), user(), NEW.RAW_ID, OLD.RAW_PRICE, NEW.RAW_PRICE);
END $$
DELIMITER ;