-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 22 jan. 2022 à 18:37
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `happy_test2`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

DROP TABLE IF EXISTS `achat`;
CREATE TABLE IF NOT EXISTS `achat` (
  `ID_LIGNE` int NOT NULL AUTO_INCREMENT,
  `MAGASIN` varchar(150) NOT NULL,
  `MONTANT` float NOT NULL,
  `DATE_ACHAT` date NOT NULL,
  `DESCRIPTION` varchar(250) NOT NULL,
  `ID_Apiculteur` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_LIGNE`,`ID_Apiculteur`),
  KEY `fk_achat_apiculteur1_idx` (`ID_Apiculteur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `android_table`
--

DROP TABLE IF EXISTS `android_table`;
CREATE TABLE IF NOT EXISTS `android_table` (
  `ID_Ligne` int NOT NULL AUTO_INCREMENT,
  `ID_Api` int UNSIGNED NOT NULL,
  `Token` varchar(25) NOT NULL,
  `Etat_Token` tinyint NOT NULL,
  `Timeout` datetime NOT NULL,
  PRIMARY KEY (`ID_Ligne`),
  KEY `ID_Api` (`ID_Api`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `apiculteur`
--

DROP TABLE IF EXISTS `apiculteur`;
CREATE TABLE IF NOT EXISTS `apiculteur` (
  `ID_Apiculteur` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Login` varchar(50) NOT NULL,
  `MDP` varchar(255) NOT NULL,
  `Code_APE` varchar(5) DEFAULT NULL,
  `Code_API` varchar(10) NOT NULL,
  `SIRET` varchar(20) DEFAULT NULL,
  `NUMAGRI` varchar(30) NOT NULL,
  `Nom_Api` varchar(150) NOT NULL,
  `Prenom_Api` varchar(150) NOT NULL,
  `Ad_Mail` varchar(200) DEFAULT NULL,
  `Ville` varchar(150) NOT NULL,
  `Num_Rue` tinyint NOT NULL,
  `Nom_Rue` varchar(200) NOT NULL,
  `Code_Postal` int NOT NULL,
  `Id_Type` int NOT NULL,
  `ID_Question` int UNSIGNED NOT NULL,
  `Re_Question` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_Apiculteur`,`Id_Type`),
  UNIQUE KEY `Code_API` (`Code_API`),
  UNIQUE KEY `NUMAGRI` (`NUMAGRI`),
  UNIQUE KEY `Login` (`Login`),
  KEY `fk_apiculteur_type_voie1_idx` (`Id_Type`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `datalogger`
--

DROP TABLE IF EXISTS `datalogger`;
CREATE TABLE IF NOT EXISTS `datalogger` (
  `ID_Ligne` int NOT NULL AUTO_INCREMENT,
  `ID_DataLogger` int NOT NULL DEFAULT '999',
  `Date_Log` date NOT NULL,
  `Heure_Log` time NOT NULL,
  `Poids` int UNSIGNED DEFAULT '0',
  `TempExt` float DEFAULT '-100',
  `TempInt` float DEFAULT '-100',
  `HygroExt` int UNSIGNED DEFAULT '0',
  `HygroInt` int UNSIGNED DEFAULT '0',
  `ID_RUCHE` int NOT NULL,
  `ID_Apiculteur` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_Ligne`,`ID_RUCHE`),
  KEY `fk_datalogger_ruche1_idx` (`ID_RUCHE`),
  KEY `fk_Api_DataL` (`ID_Apiculteur`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `essaim`
--

DROP TABLE IF EXISTS `essaim`;
CREATE TABLE IF NOT EXISTS `essaim` (
  `ID_ESSAIM` int NOT NULL AUTO_INCREMENT,
  `ESPECE` varchar(60) DEFAULT NULL,
  `DATE_CREATION` date DEFAULT NULL,
  `LIEU_CAPTURE` varchar(100) DEFAULT NULL,
  `AGE_REINE` int DEFAULT NULL,
  `ORIGINE_REINE` varchar(100) DEFAULT NULL,
  `NOM_ESSAIM` varchar(50) NOT NULL,
  `ID_ORIGINE` int NOT NULL,
  `ID_RUCHE` int NOT NULL,
  `ID_Apiculteur` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_ESSAIM`,`ID_ORIGINE`,`ID_RUCHE`,`ID_Apiculteur`),
  KEY `fk_essaim_origine_essaim1_idx` (`ID_ORIGINE`),
  KEY `fk_essaim_ruche1_idx` (`ID_RUCHE`),
  KEY `fk_essaim_apiculteur1_idx` (`ID_Apiculteur`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etat_ruche`
--

DROP TABLE IF EXISTS `etat_ruche`;
CREATE TABLE IF NOT EXISTS `etat_ruche` (
  `ID_ETAT` int NOT NULL DEFAULT '0',
  `NOM_ETAT` varchar(30) DEFAULT NULL,
  `Photo` varchar(25) NOT NULL,
  PRIMARY KEY (`ID_ETAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat_ruche`
--

INSERT INTO `etat_ruche` (`ID_ETAT`, `NOM_ETAT`, `Photo`) VALUES
(0, 'Active', '_actif'),
(1, 'Morte', '_dead'),
(2, 'Re stockée', '_stock');

-- --------------------------------------------------------

--
-- Structure de la table `hausses`
--

DROP TABLE IF EXISTS `hausses`;
CREATE TABLE IF NOT EXISTS `hausses` (
  `id_hausses` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_cadre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_hausses`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hausses`
--

INSERT INTO `hausses` (`id_hausses`, `type_cadre`) VALUES
(1, 'Hausse 01 cadre'),
(2, 'Hausse 02 cadres'),
(3, 'Hausse 03 cadres'),
(4, 'Hausse 04 cadres'),
(5, 'Hausse 05 cadres'),
(6, 'Hausse 06 cadres'),
(7, 'Hausse 07 cadres'),
(8, 'Hausse 08 cadres'),
(9, 'Hausse 09 cadres'),
(10, 'Hausse 10 cadres'),
(11, 'Hausse 11 cadres'),
(12, 'Hausse 12 cadres');

-- --------------------------------------------------------

--
-- Structure de la table `historique`
--

DROP TABLE IF EXISTS `historique`;
CREATE TABLE IF NOT EXISTS `historique` (
  `Id_Ligne` int NOT NULL AUTO_INCREMENT,
  `Date_heure` datetime NOT NULL,
  `Ref_Action` int NOT NULL COMMENT 'indique l''ID sur ce que l''on a agit',
  `ID_EVT` int NOT NULL,
  `ID_Apiculteur` int UNSIGNED NOT NULL,
  PRIMARY KEY (`Id_Ligne`,`ID_EVT`,`ID_Apiculteur`),
  KEY `fk_historique_histo_evt1_idx` (`ID_EVT`),
  KEY `fk_historique_apiculteur1_idx` (`ID_Apiculteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `histo_evt`
--

DROP TABLE IF EXISTS `histo_evt`;
CREATE TABLE IF NOT EXISTS `histo_evt` (
  `ID_EVT` int NOT NULL AUTO_INCREMENT,
  `NOM_EVT` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_EVT`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `histo_evt`
--

INSERT INTO `histo_evt` (`ID_EVT`, `NOM_EVT`) VALUES
(1, 'Ajout'),
(2, 'Modification');

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

DROP TABLE IF EXISTS `maladie`;
CREATE TABLE IF NOT EXISTS `maladie` (
  `idmaladie` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Id_Api` int UNSIGNED NOT NULL,
  `Nom_Maladie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmaladie`),
  KEY `fk_Visite_Api_idx` (`Id_Api`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `origine_essaim`
--

DROP TABLE IF EXISTS `origine_essaim`;
CREATE TABLE IF NOT EXISTS `origine_essaim` (
  `ID_ORIGINE` int NOT NULL,
  `NOM_ORIGINE` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_ORIGINE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `origine_essaim`
--

INSERT INTO `origine_essaim` (`ID_ORIGINE`, `NOM_ORIGINE`) VALUES
(0, 'Achat'),
(1, 'Don'),
(3, 'Prélèvement'),
(4, 'Essaimage d\'une autre ruche');

-- --------------------------------------------------------

--
-- Structure de la table `param`
--

DROP TABLE IF EXISTS `param`;
CREATE TABLE IF NOT EXISTS `param` (
  `ID_Param` int NOT NULL AUTO_INCREMENT,
  `Nom_Param` varchar(200) NOT NULL,
  `Value_Param` varchar(100) NOT NULL,
  `ID_Apiculteur` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Param`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `param`
--

INSERT INTO `param` (`ID_Param`, `Nom_Param`, `Value_Param`, `ID_Apiculteur`) VALUES
(1, 'Version', '1.1C', 0),
(2, 'Template', 'default', 38);

-- --------------------------------------------------------

--
-- Structure de la table `question_secrete`
--

DROP TABLE IF EXISTS `question_secrete`;
CREATE TABLE IF NOT EXISTS `question_secrete` (
  `ID_Question` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nom_Question` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_Question`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `question_secrete`
--

INSERT INTO `question_secrete` (`ID_Question`, `Nom_Question`) VALUES
(1, 'Nom de famille de la mère'),
(2, 'Nom de l\'animal de compagnie'),
(3, 'Ville de naissance'),
(4, 'Livre préféré'),
(5, 'Nom du pays ou je souhaiterais vivre'),
(6, 'Chanteur préféré'),
(7, 'Film préféré'),
(8, 'peintre préféré');

-- --------------------------------------------------------

--
-- Structure de la table `recolte`
--

DROP TABLE IF EXISTS `recolte`;
CREATE TABLE IF NOT EXISTS `recolte` (
  `ID_Recolte` int NOT NULL AUTO_INCREMENT,
  `Id_Ruche` int NOT NULL,
  `Id_Type_Miel` int UNSIGNED NOT NULL,
  `Poids` float NOT NULL,
  `Date_R` date NOT NULL,
  PRIMARY KEY (`ID_Recolte`),
  KEY `fk_type_miel` (`Id_Type_Miel`),
  KEY `idx_recolte_ruche` (`Id_Ruche`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ruche`
--

DROP TABLE IF EXISTS `ruche`;
CREATE TABLE IF NOT EXISTS `ruche` (
  `ID_Ruche` int NOT NULL AUTO_INCREMENT,
  `DATE_MES` date DEFAULT NULL,
  `NBRE_CADRE` int NOT NULL,
  `NBRE_HAUSSE` int NOT NULL,
  `NUM_RUCHE` varchar(30) NOT NULL,
  `OBSERV` longtext,
  `Nom_Ruche` varchar(60) NOT NULL,
  `id_Rucher` int NOT NULL,
  `ID_ETAT` int NOT NULL,
  `ID_TYPERUCHE` int NOT NULL,
  `id_hausses` int UNSIGNED NOT NULL,
  `QRCode` varchar(255) DEFAULT NULL,
  `X_Ruche` int DEFAULT NULL,
  `Y_Ruche` int DEFAULT NULL,
  `Z_Ruche` int DEFAULT NULL,
  PRIMARY KEY (`ID_Ruche`,`id_Rucher`,`ID_ETAT`,`ID_TYPERUCHE`,`id_hausses`),
  KEY `fk_ruche_rucher1_idx` (`id_Rucher`),
  KEY `fk_ruche_etat_ruche1_idx` (`ID_ETAT`),
  KEY `fk_ruche_type_ruche1_idx` (`ID_TYPERUCHE`),
  KEY `fk_ruche_hausses1_idx` (`id_hausses`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rucher`
--

DROP TABLE IF EXISTS `rucher`;
CREATE TABLE IF NOT EXISTS `rucher` (
  `id_Rucher` int NOT NULL AUTO_INCREMENT,
  `Nom_Rucher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Localisation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Coordonnees_GPS` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Observations` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `Num_Rucher` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isActif` smallint NOT NULL,
  `ID_Apiculteur` int UNSIGNED NOT NULL,
  `Path_Image` varchar(130) DEFAULT NULL,
  `Last_Photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_Rucher`,`ID_Apiculteur`),
  UNIQUE KEY `Nom_Rucher_UNIQUE` (`Nom_Rucher`),
  KEY `fk_rucher_apiculteur1_idx` (`ID_Apiculteur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `templates`
--

DROP TABLE IF EXISTS `templates`;
CREATE TABLE IF NOT EXISTS `templates` (
  `Id_Template` int NOT NULL AUTO_INCREMENT,
  `Nom_Template` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_Template`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `templates`
--

INSERT INTO `templates` (`Id_Template`, `Nom_Template`) VALUES
(1, 'default');

-- --------------------------------------------------------

--
-- Structure de la table `temps_meteo`
--

DROP TABLE IF EXISTS `temps_meteo`;
CREATE TABLE IF NOT EXISTS `temps_meteo` (
  `ID_TEMPS` int NOT NULL AUTO_INCREMENT,
  `NOM_TEMPS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_TEMPS`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `temps_meteo`
--

INSERT INTO `temps_meteo` (`ID_TEMPS`, `NOM_TEMPS`) VALUES
(1, 'Nuageux'),
(2, 'Pluie'),
(3, 'Neige'),
(4, 'beau temps');

-- --------------------------------------------------------

--
-- Structure de la table `type_miel`
--

DROP TABLE IF EXISTS `type_miel`;
CREATE TABLE IF NOT EXISTS `type_miel` (
  `ID_Type_Miel` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ID_Api` int UNSIGNED NOT NULL,
  `Nom_Type_Miel` varchar(100) NOT NULL,
  `Nom_Image` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Type_Miel`),
  KEY `ID_Api` (`ID_Api`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_miel`
--

INSERT INTO `type_miel` (`ID_Type_Miel`, `ID_Api`, `Nom_Type_Miel`, `Nom_Image`) VALUES
(1, 38, 'Acacia', 'acacia'),
(2, 38, 'Toutes fleurs', 'Toutes_fleurs'),
(3, 38, 'Montagne', 'abeille');

-- --------------------------------------------------------

--
-- Structure de la table `type_ruche`
--

DROP TABLE IF EXISTS `type_ruche`;
CREATE TABLE IF NOT EXISTS `type_ruche` (
  `ID_TYPERUCHE` int NOT NULL,
  `NOM_TYPE_RUCHE` varchar(60) NOT NULL,
  `Photo` varchar(25) NOT NULL,
  PRIMARY KEY (`ID_TYPERUCHE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_ruche`
--

INSERT INTO `type_ruche` (`ID_TYPERUCHE`, `NOM_TYPE_RUCHE`, `Photo`) VALUES
(0, 'Dadant', 'dadant'),
(1, 'langstroth', 'langstroth'),
(3, 'Warré', 'warre'),
(4, 'Autre', 'autre'),
(5, 'Ruchette', 'ruchette');

-- --------------------------------------------------------

--
-- Structure de la table `type_voie`
--

DROP TABLE IF EXISTS `type_voie`;
CREATE TABLE IF NOT EXISTS `type_voie` (
  `Id_Type` int NOT NULL AUTO_INCREMENT,
  `Nom_Type` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`Id_Type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_voie`
--

INSERT INTO `type_voie` (`Id_Type`, `Nom_Type`) VALUES
(1, 'Allée'),
(2, 'Impasse'),
(3, 'Avenue'),
(4, 'Route'),
(5, 'Rue'),
(6, 'Voie');

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

DROP TABLE IF EXISTS `visite`;
CREATE TABLE IF NOT EXISTS `visite` (
  `ID_VISITE` int NOT NULL AUTO_INCREMENT,
  `TEMPERATURE` float DEFAULT '-100',
  `HYGRO` int DEFAULT '0',
  `TRAVAUX` int DEFAULT '0',
  `NOURISSAGE` int DEFAULT '0',
  `TYPE_NOURRISSAGE` varchar(100) DEFAULT NULL,
  `POIDS` float DEFAULT '0',
  `REINE_VISIBLE` int DEFAULT '0',
  `POPULATION` varchar(255) DEFAULT NULL,
  `COMPORT_ESSAIM` varchar(255) DEFAULT NULL,
  `NOTES` longtext,
  `Date_Visite` date NOT NULL,
  `ID_RUCHE` int NOT NULL,
  `ID_TEMPS` int NOT NULL,
  `Presence_Maladie` int NOT NULL,
  `ID_Maladie` int UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_VISITE`,`ID_RUCHE`,`ID_TEMPS`),
  KEY `fk_visite_ruche1_idx` (`ID_RUCHE`),
  KEY `fk_visite_temps_meteo1_idx` (`ID_TEMPS`),
  KEY `fk_visite_maladie_idx` (`ID_Maladie`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_achat`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_achat`;
CREATE TABLE IF NOT EXISTS `vue_achat` (
`ID_Apiculteur` int unsigned
,`Nom_Api` varchar(150)
,`Prenom_Api` varchar(150)
,`ID_Ligne` int
,`Magasin` varchar(150)
,`Montant` float
,`Date_Achat` date
,`Description` varchar(250)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_apiculteur`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_apiculteur`;
CREATE TABLE IF NOT EXISTS `vue_apiculteur` (
`ID_Apiculteur` int unsigned
,`Login` varchar(50)
,`MDP` varchar(255)
,`Code_APE` varchar(5)
,`Code_API` varchar(10)
,`SIRET` varchar(20)
,`NUMAGRI` varchar(30)
,`Nom_Api` varchar(150)
,`Prenom_Api` varchar(150)
,`Ad_Mail` varchar(200)
,`Ville` varchar(150)
,`Num_Rue` tinyint
,`Nom_Rue` varchar(200)
,`Code_Postal` int
,`Nom_Type` varchar(90)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_coord_ruches`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_coord_ruches`;
CREATE TABLE IF NOT EXISTS `vue_coord_ruches` (
`ID_Ruche` int
,`Nom_Ruche` varchar(60)
,`X_Ruche` int
,`Y_Ruche` int
,`Z_Ruche` int
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_coord_ruche_rucher`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_coord_ruche_rucher`;
CREATE TABLE IF NOT EXISTS `vue_coord_ruche_rucher` (
`X_Ruche` int
,`Y_Ruche` int
,`Z_Ruche` int
,`id_Rucher` int
,`Nom_Ruche` varchar(60)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_essaim_nomruche`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_essaim_nomruche`;
CREATE TABLE IF NOT EXISTS `vue_essaim_nomruche` (
`ID_ESSAIM` int
,`NOM_ESSAIM` varchar(50)
,`Id_Apiculteur` int unsigned
,`Nom_Ruche` varchar(60)
,`ID_RUCHE` int
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_recolte`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_recolte`;
CREATE TABLE IF NOT EXISTS `vue_recolte` (
`Poids` float
,`Date_R` date
,`Id_Ruche` int
,`Id_Type_Miel` int unsigned
,`Nom_Type_Miel` varchar(100)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_recolte_api`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_recolte_api`;
CREATE TABLE IF NOT EXISTS `vue_recolte_api` (
`Poids` float
,`Date_R` date
,`Id_Type_Miel` int unsigned
,`Nom_Type_Miel` varchar(100)
,`Id_Ruche` int
,`Nom_Ruche` varchar(60)
,`ID_Apiculteur` int unsigned
,`Id_Rucher` int
,`Image` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_rucher_api`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_rucher_api`;
CREATE TABLE IF NOT EXISTS `vue_rucher_api` (
`Id_Rucher` int
,`Nom_Rucher` varchar(100)
,`Localisation` varchar(100)
,`Coordonnees_GPS` varchar(30)
,`Observations` longtext
,`Num_Rucher` varchar(15)
,`isActif` smallint
,`Nom_Api` varchar(150)
,`Prenom_Api` varchar(150)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_rucher_declaration`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_rucher_declaration`;
CREATE TABLE IF NOT EXISTS `vue_rucher_declaration` (
`Nom_Api` varchar(150)
,`Prenom_Api` varchar(150)
,`Ville` varchar(150)
,`Num_Rue` tinyint
,`nom_Rue` varchar(200)
,`Code_Postal` int
,`SIRET` varchar(20)
,`Code_API` varchar(10)
,`Nom_Type` varchar(90)
,`Nom_Rucher` varchar(100)
,`Localisation` varchar(100)
,`Num_Rucher` varchar(15)
,`id_Rucher` int
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_ruche_api`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_ruche_api`;
CREATE TABLE IF NOT EXISTS `vue_ruche_api` (
`Id_Ruche` int
,`nom_ruche` varchar(60)
,`NUM_RUCHE` varchar(30)
,`ID_Apiculteur` int unsigned
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_ruche_complete_sans_api`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_ruche_complete_sans_api`;
CREATE TABLE IF NOT EXISTS `vue_ruche_complete_sans_api` (
`ID_Ruche` int
,`Date_MES` date
,`NBRE_CADRE` int
,`NBRE_HAUSSE` int
,`NUM_RUCHE` varchar(30)
,`Nom_Ruche` varchar(60)
,`OBSERV` longtext
,`EPHOTO` varchar(25)
,`NOM_ETAT` varchar(30)
,`Nom_Rucher` varchar(100)
,`Id_Rucher` int
,`NOM_TYPE_RUCHE` varchar(60)
,`TPHOTO` varchar(25)
,`type_cadre` varchar(45)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_ruche_etat_essaim`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_ruche_etat_essaim`;
CREATE TABLE IF NOT EXISTS `vue_ruche_etat_essaim` (
`ID_Ruche` int
,`NBRE_HAUSSE` int
,`Nom_ETAT` varchar(30)
,`Nom_Essaim` varchar(50)
,`ID_Apiculteur` int unsigned
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_ruche_sans_essaims`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_ruche_sans_essaims`;
CREATE TABLE IF NOT EXISTS `vue_ruche_sans_essaims` (
`Id_Ruche` int
,`Nom_Ruche` varchar(60)
,`Id_Apiculteur` int unsigned
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vue_visite`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `vue_visite`;
CREATE TABLE IF NOT EXISTS `vue_visite` (
`Temperature` float
,`Hygro` int
,`Travaux` int
,`Nourrissage` int
,`Type_Nourrissage` varchar(100)
,`Poids` float
,`Reine_Visible` int
,`Population` varchar(255)
,`Comportement` varchar(255)
,`Notes` longtext
,`Date_Visite` date
,`Presence_Maladie` int
,`Id_Ruche` int
,`Nom_Ruche` varchar(60)
,`Nom_Maladie` varchar(45)
,`Climat` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la vue `vue_achat`
--
DROP TABLE IF EXISTS `vue_achat`;

DROP VIEW IF EXISTS `vue_achat`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_achat`  AS  select `a`.`ID_Apiculteur` AS `ID_Apiculteur`,`a`.`Nom_Api` AS `Nom_Api`,`a`.`Prenom_Api` AS `Prenom_Api`,`v`.`ID_LIGNE` AS `ID_Ligne`,`v`.`MAGASIN` AS `Magasin`,`v`.`MONTANT` AS `Montant`,`v`.`DATE_ACHAT` AS `Date_Achat`,`v`.`DESCRIPTION` AS `Description` from (`apiculteur` `a` join `achat` `v` on((`v`.`ID_Apiculteur` = `a`.`ID_Apiculteur`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_apiculteur`
--
DROP TABLE IF EXISTS `vue_apiculteur`;

DROP VIEW IF EXISTS `vue_apiculteur`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_apiculteur`  AS  select `a`.`ID_Apiculteur` AS `ID_Apiculteur`,`a`.`Login` AS `Login`,`a`.`MDP` AS `MDP`,`a`.`Code_APE` AS `Code_APE`,`a`.`Code_API` AS `Code_API`,`a`.`SIRET` AS `SIRET`,`a`.`NUMAGRI` AS `NUMAGRI`,`a`.`Nom_Api` AS `Nom_Api`,`a`.`Prenom_Api` AS `Prenom_Api`,`a`.`Ad_Mail` AS `Ad_Mail`,`a`.`Ville` AS `Ville`,`a`.`Num_Rue` AS `Num_Rue`,`a`.`Nom_Rue` AS `Nom_Rue`,`a`.`Code_Postal` AS `Code_Postal`,`t`.`Nom_Type` AS `Nom_Type` from (`apiculteur` `a` join `type_voie` `t` on((`a`.`Id_Type` = `t`.`Id_Type`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_coord_ruches`
--
DROP TABLE IF EXISTS `vue_coord_ruches`;

DROP VIEW IF EXISTS `vue_coord_ruches`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_coord_ruches`  AS  select `ruche`.`ID_Ruche` AS `ID_Ruche`,`ruche`.`Nom_Ruche` AS `Nom_Ruche`,`ruche`.`X_Ruche` AS `X_Ruche`,`ruche`.`Y_Ruche` AS `Y_Ruche`,`ruche`.`Z_Ruche` AS `Z_Ruche` from `ruche` ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_coord_ruche_rucher`
--
DROP TABLE IF EXISTS `vue_coord_ruche_rucher`;

DROP VIEW IF EXISTS `vue_coord_ruche_rucher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_coord_ruche_rucher`  AS  select `ruche`.`X_Ruche` AS `X_Ruche`,`ruche`.`Y_Ruche` AS `Y_Ruche`,`ruche`.`Z_Ruche` AS `Z_Ruche`,`ruche`.`id_Rucher` AS `id_Rucher`,`ruche`.`Nom_Ruche` AS `Nom_Ruche` from `ruche` where ((`ruche`.`X_Ruche` is not null) and (`ruche`.`Y_Ruche` is not null) and (`ruche`.`Z_Ruche` is not null)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_essaim_nomruche`
--
DROP TABLE IF EXISTS `vue_essaim_nomruche`;

DROP VIEW IF EXISTS `vue_essaim_nomruche`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_essaim_nomruche`  AS  select `e`.`ID_ESSAIM` AS `ID_ESSAIM`,`e`.`NOM_ESSAIM` AS `NOM_ESSAIM`,`e`.`ID_Apiculteur` AS `Id_Apiculteur`,`r`.`Nom_Ruche` AS `Nom_Ruche`,`r`.`ID_Ruche` AS `ID_RUCHE` from (`essaim` `e` join `ruche` `r` on((`e`.`ID_RUCHE` = `r`.`ID_Ruche`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_recolte`
--
DROP TABLE IF EXISTS `vue_recolte`;

DROP VIEW IF EXISTS `vue_recolte`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_recolte`  AS  select `r`.`Poids` AS `Poids`,`r`.`Date_R` AS `Date_R`,`r`.`Id_Ruche` AS `Id_Ruche`,`r`.`Id_Type_Miel` AS `Id_Type_Miel`,`t`.`Nom_Type_Miel` AS `Nom_Type_Miel` from (`recolte` `r` join `type_miel` `t` on((`r`.`Id_Type_Miel` = `t`.`ID_Type_Miel`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_recolte_api`
--
DROP TABLE IF EXISTS `vue_recolte_api`;

DROP VIEW IF EXISTS `vue_recolte_api`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_recolte_api`  AS  select `re`.`Poids` AS `Poids`,`re`.`Date_R` AS `Date_R`,`re`.`Id_Type_Miel` AS `Id_Type_Miel`,`type_miel`.`Nom_Type_Miel` AS `Nom_Type_Miel`,`ru`.`ID_Ruche` AS `Id_Ruche`,`ru`.`Nom_Ruche` AS `Nom_Ruche`,`a`.`ID_Apiculteur` AS `ID_Apiculteur`,`rucher`.`id_Rucher` AS `Id_Rucher`,`type_miel`.`Nom_Image` AS `Image` from ((((`recolte` `re` join `ruche` `ru` on((`re`.`Id_Ruche` = `ru`.`ID_Ruche`))) join `type_miel` on((`re`.`Id_Type_Miel` = `type_miel`.`ID_Type_Miel`))) join `rucher` on((`ru`.`id_Rucher` = `rucher`.`id_Rucher`))) join `apiculteur` `a` on((`rucher`.`ID_Apiculteur` = `a`.`ID_Apiculteur`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_rucher_api`
--
DROP TABLE IF EXISTS `vue_rucher_api`;

DROP VIEW IF EXISTS `vue_rucher_api`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_rucher_api`  AS  select `r`.`id_Rucher` AS `Id_Rucher`,`r`.`Nom_Rucher` AS `Nom_Rucher`,`r`.`Localisation` AS `Localisation`,`r`.`Coordonnees_GPS` AS `Coordonnees_GPS`,`r`.`Observations` AS `Observations`,`r`.`Num_Rucher` AS `Num_Rucher`,`r`.`isActif` AS `isActif`,`a`.`Nom_Api` AS `Nom_Api`,`a`.`Prenom_Api` AS `Prenom_Api` from (`rucher` `r` join `apiculteur` `a` on((`r`.`ID_Apiculteur` = `a`.`ID_Apiculteur`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_rucher_declaration`
--
DROP TABLE IF EXISTS `vue_rucher_declaration`;

DROP VIEW IF EXISTS `vue_rucher_declaration`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_rucher_declaration`  AS  select `a`.`Nom_Api` AS `Nom_Api`,`a`.`Prenom_Api` AS `Prenom_Api`,`a`.`Ville` AS `Ville`,`a`.`Num_Rue` AS `Num_Rue`,`a`.`Nom_Rue` AS `nom_Rue`,`a`.`Code_Postal` AS `Code_Postal`,`a`.`SIRET` AS `SIRET`,`a`.`Code_API` AS `Code_API`,`t`.`Nom_Type` AS `Nom_Type`,`r`.`Nom_Rucher` AS `Nom_Rucher`,`r`.`Localisation` AS `Localisation`,`r`.`Num_Rucher` AS `Num_Rucher`,`r`.`id_Rucher` AS `id_Rucher` from ((`apiculteur` `a` join `rucher` `r` on((`r`.`ID_Apiculteur` = `a`.`ID_Apiculteur`))) join `type_voie` `t` on((`a`.`Id_Type` = `t`.`Id_Type`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_ruche_api`
--
DROP TABLE IF EXISTS `vue_ruche_api`;

DROP VIEW IF EXISTS `vue_ruche_api`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_ruche_api`  AS  select `r`.`ID_Ruche` AS `Id_Ruche`,`r`.`Nom_Ruche` AS `nom_ruche`,`r`.`NUM_RUCHE` AS `NUM_RUCHE`,`a`.`ID_Apiculteur` AS `ID_Apiculteur` from ((`ruche` `r` join `rucher` on((`r`.`id_Rucher` = `rucher`.`id_Rucher`))) join `apiculteur` `a` on((`rucher`.`ID_Apiculteur` = `a`.`ID_Apiculteur`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_ruche_complete_sans_api`
--
DROP TABLE IF EXISTS `vue_ruche_complete_sans_api`;

DROP VIEW IF EXISTS `vue_ruche_complete_sans_api`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_ruche_complete_sans_api`  AS  select `r`.`ID_Ruche` AS `ID_Ruche`,`r`.`DATE_MES` AS `Date_MES`,`r`.`NBRE_CADRE` AS `NBRE_CADRE`,`r`.`NBRE_HAUSSE` AS `NBRE_HAUSSE`,`r`.`NUM_RUCHE` AS `NUM_RUCHE`,`r`.`Nom_Ruche` AS `Nom_Ruche`,`r`.`OBSERV` AS `OBSERV`,`e`.`Photo` AS `EPHOTO`,`e`.`NOM_ETAT` AS `NOM_ETAT`,`ru`.`Nom_Rucher` AS `Nom_Rucher`,`ru`.`id_Rucher` AS `Id_Rucher`,`t`.`NOM_TYPE_RUCHE` AS `NOM_TYPE_RUCHE`,`t`.`Photo` AS `TPHOTO`,`h`.`type_cadre` AS `type_cadre` from ((((`ruche` `r` join `rucher` `ru` on((`r`.`id_Rucher` = `ru`.`id_Rucher`))) join `etat_ruche` `e` on((`r`.`ID_ETAT` = `e`.`ID_ETAT`))) join `type_ruche` `t` on((`r`.`ID_TYPERUCHE` = `t`.`ID_TYPERUCHE`))) join `hausses` `h` on((`r`.`id_hausses` = `h`.`id_hausses`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_ruche_etat_essaim`
--
DROP TABLE IF EXISTS `vue_ruche_etat_essaim`;

DROP VIEW IF EXISTS `vue_ruche_etat_essaim`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_ruche_etat_essaim`  AS  select `r`.`ID_Ruche` AS `ID_Ruche`,`r`.`NBRE_HAUSSE` AS `NBRE_HAUSSE`,`e`.`NOM_ETAT` AS `Nom_ETAT`,`es`.`NOM_ESSAIM` AS `Nom_Essaim`,`a`.`ID_Apiculteur` AS `ID_Apiculteur` from ((((`ruche` `r` join `etat_ruche` `e` on((`r`.`ID_ETAT` = `e`.`ID_ETAT`))) left join `essaim` `es` on((`es`.`ID_RUCHE` = `r`.`ID_Ruche`))) join `rucher` on((`r`.`id_Rucher` = `rucher`.`id_Rucher`))) join `apiculteur` `a` on((`a`.`ID_Apiculteur` = `rucher`.`ID_Apiculteur`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_ruche_sans_essaims`
--
DROP TABLE IF EXISTS `vue_ruche_sans_essaims`;

DROP VIEW IF EXISTS `vue_ruche_sans_essaims`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_ruche_sans_essaims`  AS  select `r`.`ID_Ruche` AS `Id_Ruche`,`r`.`Nom_Ruche` AS `Nom_Ruche`,`ru`.`ID_Apiculteur` AS `Id_Apiculteur` from ((`ruche` `r` left join `essaim` on((`r`.`ID_Ruche` = `essaim`.`ID_RUCHE`))) join `rucher` `ru` on((`r`.`id_Rucher` = `ru`.`id_Rucher`))) where (`essaim`.`ID_ESSAIM` is null) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vue_visite`
--
DROP TABLE IF EXISTS `vue_visite`;

DROP VIEW IF EXISTS `vue_visite`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vue_visite`  AS  select `v`.`TEMPERATURE` AS `Temperature`,`v`.`HYGRO` AS `Hygro`,`v`.`TRAVAUX` AS `Travaux`,`v`.`NOURISSAGE` AS `Nourrissage`,`v`.`TYPE_NOURRISSAGE` AS `Type_Nourrissage`,`v`.`POIDS` AS `Poids`,`v`.`REINE_VISIBLE` AS `Reine_Visible`,`v`.`POPULATION` AS `Population`,`v`.`COMPORT_ESSAIM` AS `Comportement`,`v`.`NOTES` AS `Notes`,`v`.`Date_Visite` AS `Date_Visite`,`v`.`Presence_Maladie` AS `Presence_Maladie`,`r`.`ID_Ruche` AS `Id_Ruche`,`r`.`Nom_Ruche` AS `Nom_Ruche`,`m`.`Nom_Maladie` AS `Nom_Maladie`,`t`.`NOM_TEMPS` AS `Climat` from (((`visite` `v` join `ruche` `r` on((`v`.`ID_RUCHE` = `r`.`ID_Ruche`))) join `maladie` `m` on((`v`.`ID_Maladie` = `m`.`idmaladie`))) join `temps_meteo` `t` on((`v`.`ID_TEMPS` = `t`.`ID_TEMPS`))) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achat`
--
ALTER TABLE `achat`
  ADD CONSTRAINT `fk_achat_apiculteur1` FOREIGN KEY (`ID_Apiculteur`) REFERENCES `apiculteur` (`ID_Apiculteur`);

--
-- Contraintes pour la table `android_table`
--
ALTER TABLE `android_table`
  ADD CONSTRAINT `FK_Api` FOREIGN KEY (`ID_Api`) REFERENCES `apiculteur` (`ID_Apiculteur`);

--
-- Contraintes pour la table `apiculteur`
--
ALTER TABLE `apiculteur`
  ADD CONSTRAINT `fk_apiculteur_type_voie1` FOREIGN KEY (`Id_Type`) REFERENCES `type_voie` (`Id_Type`);

--
-- Contraintes pour la table `datalogger`
--
ALTER TABLE `datalogger`
  ADD CONSTRAINT `FK_Api_Datalogger` FOREIGN KEY (`ID_Apiculteur`) REFERENCES `apiculteur` (`ID_Apiculteur`),
  ADD CONSTRAINT `fk_datalogger_ruche1` FOREIGN KEY (`ID_RUCHE`) REFERENCES `ruche` (`ID_Ruche`);

--
-- Contraintes pour la table `essaim`
--
ALTER TABLE `essaim`
  ADD CONSTRAINT `fk_essaim_apiculteur1` FOREIGN KEY (`ID_Apiculteur`) REFERENCES `apiculteur` (`ID_Apiculteur`),
  ADD CONSTRAINT `fk_essaim_origine_essaim1` FOREIGN KEY (`ID_ORIGINE`) REFERENCES `origine_essaim` (`ID_ORIGINE`),
  ADD CONSTRAINT `fk_essaim_ruche1` FOREIGN KEY (`ID_RUCHE`) REFERENCES `ruche` (`ID_Ruche`);

--
-- Contraintes pour la table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `fk_historique_apiculteur1` FOREIGN KEY (`ID_Apiculteur`) REFERENCES `apiculteur` (`ID_Apiculteur`),
  ADD CONSTRAINT `fk_historique_histo_evt1` FOREIGN KEY (`ID_EVT`) REFERENCES `histo_evt` (`ID_EVT`);

--
-- Contraintes pour la table `maladie`
--
ALTER TABLE `maladie`
  ADD CONSTRAINT `fk_maladie_api` FOREIGN KEY (`Id_Api`) REFERENCES `apiculteur` (`ID_Apiculteur`);

--
-- Contraintes pour la table `recolte`
--
ALTER TABLE `recolte`
  ADD CONSTRAINT `fk_recolte_ruche` FOREIGN KEY (`Id_Ruche`) REFERENCES `ruche` (`ID_Ruche`),
  ADD CONSTRAINT `FK_Recolte_Type` FOREIGN KEY (`Id_Type_Miel`) REFERENCES `type_miel` (`ID_Type_Miel`);

--
-- Contraintes pour la table `ruche`
--
ALTER TABLE `ruche`
  ADD CONSTRAINT `fk_ruche_etat_ruche1` FOREIGN KEY (`ID_ETAT`) REFERENCES `etat_ruche` (`ID_ETAT`),
  ADD CONSTRAINT `fk_ruche_hausses1` FOREIGN KEY (`id_hausses`) REFERENCES `hausses` (`id_hausses`),
  ADD CONSTRAINT `fk_ruche_rucher1` FOREIGN KEY (`id_Rucher`) REFERENCES `rucher` (`id_Rucher`),
  ADD CONSTRAINT `fk_ruche_type_ruche1` FOREIGN KEY (`ID_TYPERUCHE`) REFERENCES `type_ruche` (`ID_TYPERUCHE`);

--
-- Contraintes pour la table `rucher`
--
ALTER TABLE `rucher`
  ADD CONSTRAINT `fk_rucher_apiculteur1` FOREIGN KEY (`ID_Apiculteur`) REFERENCES `apiculteur` (`ID_Apiculteur`);

--
-- Contraintes pour la table `type_miel`
--
ALTER TABLE `type_miel`
  ADD CONSTRAINT `type_miel_ibfk_1` FOREIGN KEY (`ID_Api`) REFERENCES `apiculteur` (`ID_Apiculteur`);

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `fk_visite_maladie` FOREIGN KEY (`ID_Maladie`) REFERENCES `maladie` (`idmaladie`),
  ADD CONSTRAINT `fk_visite_ruche1` FOREIGN KEY (`ID_RUCHE`) REFERENCES `ruche` (`ID_Ruche`),
  ADD CONSTRAINT `fk_visite_temps_meteo1` FOREIGN KEY (`ID_TEMPS`) REFERENCES `temps_meteo` (`ID_TEMPS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
