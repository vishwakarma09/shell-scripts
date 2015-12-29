<?php

class aws{
	
	public function __construct(){
	}
	
	public function ListRegions(){
		$cmd = 'bash controller.sh ec2-describe-regions';
		$output = array();
		exec($cmd, $output, $returnval);
		echo json_encode(array("output"=>$output, "returnValue"=>$returnval));
	}
	

}
