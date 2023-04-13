<?php
/**
 
 */

function jsonresponse($code,$cont) {
    echo json_encode(array("code"=>$code,"content"=>$cont));
}

function json_response($content) {
    $array=array("content"=>$content);
    echo json_encode($array,JSON_FORCE_OBJECT);
}

function json_array_response($array) {
    echo json_encode($array,JSON_FORCE_OBJECT);
}

function response($content) {
    //log_message("error", "response to print : " . $content);
    if (is_array($content)) {
        $response = json_decode(json_encode($content));
        print "<response><code>".$response->code."</code><desc>".$response->desc."</desc></response>";
    } else { print $content;}
}

function is_valid_xml($content)
{
    $content = trim($content);
    if (empty($content)) {
        return false;
    }

    if (stripos($content, '<!DOCTYPE html>') !== false) {
        return false;
    }

    libxml_use_internal_errors(true);
    simplexml_load_string($content);
    $errors = libxml_get_errors();
    libxml_clear_errors();

    return empty($errors);
}

function get($index) {
    return sess()->userdata($index);
}

function sess() {
    $ci =& get_instance();
    return $ci->session;
}
