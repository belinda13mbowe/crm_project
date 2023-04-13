<?php
/**
 * 
 */
class Intro extends CI_Controller{
	public function _construct(){

		parent :: __construct();
	}

	public function index(){
		 $this ->load ->view("intro");
	}
}
