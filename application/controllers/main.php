<?php
/**
 
 */

class Main extends CI_Controller{
    public function __construct(){
        parent :: __construct();
        // $this->load->model('Model_Users', 'users');
        // $this->load->model('Model_Reports', 'reports');
        // $this->init();
        // $this->stats();
    }

    public function index(){
        // if($this->session->has_userdata("user_id")){
        //     $this->data['mnu'] = mnu($this->users->getName($this->session->userdata("user_id")));
        //     $this->load->view("main",$this->data);
        // }else{redirect("intro");}
    }

    private function init(){
        // $this->data['top'] = top();
        // $this->data['nav'] = nav();
        // $this->data['bottom'] = bottom();
        // $this->data['footer'] = footer();
    }

    private function stats() {
        // $this->data["wakazi"]           = number_format($this->reports->wakazi(),0);
        // $this->data["marafiki"]         = number_format($this->reports->marafiki(),0);
        // $this->data["mikutano"]         = number_format($this->report->mikutano(),0);
        // $this->data["dini"]             = number_format($this->reports->dini(),0);
        // $this->data["institutions"]     = number_format($this->reports->institutions(),0);
        // $this->data["ahadi"]            = number_format(($this->reports->wakazi_ahadi() + $this->reports->marafiki_ahadi() + $this->reports->mikutano_ahadi() + $this->reports->dini_ahadi() + $this->reports->institutions_ahadi()),0);
        // $this->data["makusanyo"]        = number_format($this->reports->makusanyo(),0);
        // $this->data["madeni"]           = number_format(($this->reports->wakazi_madeni() + $this->reports->marafiki_madeni() + $this->reports->mikutano_madeni() + $this->reports->dini_madeni() + $this->reports->institutions_madeni()),0);
     }

}
