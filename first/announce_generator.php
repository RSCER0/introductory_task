<?php
$article = '';
$announce = '';
if(isset($_POST['send'])){
    if($_POST['link']==null){
        $link = '#';
    }
    else $link = $_POST['link'];

    $article = $_POST['text'];
    $announce = substr($article,0,500);
    $announce = explode(' ', $announce);
    $link_words = array_slice($announce, -3);

    for($i = 0; $i < 3; $i++){
        array_pop($announce);
    }

    $link_words[count($link_words)-1].='...';
    $link_words[0]=' '.$link_words[0];
    $link_words = implode(' ',$link_words);
    $announce = implode(' ',$announce);
    echo $announce.'<a href = "'.$link.'">'.$link_words.'</a>';
}