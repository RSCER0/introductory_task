<?php
$article = '';
$announce = '';
if(isset($_POST['send'])){ // обработка нажатия кнопки 'send'
    if($_POST['link']==null){ // проверка наличия ссылки в поле для ссылки
        $link = '#';
    }
    else $link = $_POST['link'];

    $article = $_POST['text']; // копируем текст статьи
    $announce = substr($article,0,500); // выделяем первые 250 символов из статьи (500 так как 1 символ в кодировке UTF-8 занимает 2 байта)
    $announce = explode(' ', $announce); // делим начало на слова по пробелам
    $link_words = array_slice($announce, -3); // выбираем 3 последних слова чтобы сделать из них ссылку

    for($i = 0; $i < 3; $i++){
        array_pop($announce);   // удаляем 3 последних слова из массива
    }

    $link_words[count($link_words)-1].='...'; // добавляем ... в конце ссылки
    $link_words[0]=' '.$link_words[0]; // ставим пробел перед первым словом ссылки, чтобы отделить ее от остальной аннотации
    $link_words = implode(' ',$link_words); // объединяем ссылку в строку
    $announce = implode(' ',$announce); // объединяем аннотацию в строку
    echo $announce.'<a href = "'.$link.'">'.$link_words.'</a>'; // создаем аннотацию
}