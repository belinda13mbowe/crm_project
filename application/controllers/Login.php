<?php
/**
 * Created by PhpStorm.
 * User: Elitebook
 * Date: 4/8/2021
 * Time: 3:46 PM
 * developer: Nickson Maro
 */

class Login extends CI_Controller{
    public function __construct(){
        parent :: __construct();
    }

    public function index(){
        $this->load->view("users/login");
    }
}