<?php
/**
 * Created by PhpStorm.
 * User: tom.vanderheijden
 * Date: 1/04/2015
 * Time: 14:55
 */

namespace Cinema\Data;

use PDO;
use Cinema\Data\DBConfig;
use Cinema\Entities\Film;


class FilmDAO {

    public function getFilm($id){
        $sql = "select Film_ID, Title, Year, Description, Runtime from films where Film_ID = $id";
        $dbh = new PDO(DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
        $resultSet = $dbh->query($sql);
        $result = $resultSet->fetch();
        $film = new Film($result["Film_ID"], $result["Title"], $result["Year"], $result["Description"], $result["Runtime"]);
        return $film;
        $dbh = null;
    }

    public function addFilm($title, $year, $description, $runtime){
        $sql = "insert into films (title, year, description, runtime) values ($title, $year, $description, $runtime)";
        $dbh = new PDO(DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
        $dbh->exec($sql);
        $dbh = null;
    }

    public function getFilmsByDate($date){
        $list = array();
        $sql="select distinct Title from Films inner join shows on films.Film_ID = shows.Film_ID where DATE(Time)='$date' AND Time > NOW()";
        $dbh = new PDO(DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
        $resultSet = $dbh->query($sql);
        foreach ($resultSet as $row ){
           $line = $row["Title"];
            array_push($list, $line);
        }
        $dbh = null;
        return $list;
    }

    public function getShows($Film_ID, $date){
        $list = array();
        $sql="select Title, TIME(Time)
              from films inner join shows on films.Film_ID = shows.Films.Film_ID
              where films.Film_ID = $Film_ID AND DATE(Time)=$date AND Time > NOW()";
        $dbh = new PDO(DBConfig::$DB_CONNSTRING, DBConfig::$DB_USERNAME, DBConfig::$DB_PASSWORD);
        $resultSet = $dbh->query($sql);
        $result = $resultSet->fetch();
        foreach ($result as $row){
            $line = new Film($row["Film_ID"],  $row["Title"], $row["Year"], $row["Description"], $row["Runtime"]);
            array_push($list, $line);
        }
        $dbh = null;
        return $list;
    }



}