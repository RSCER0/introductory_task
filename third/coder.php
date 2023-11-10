<?php

$out = '';

$dictionary = array("|", "А", "Б", "В", // задаем массив со всеми возможными элементами
                    "Г", "Д", "Е", "Ж",
                    "З", "И", "К", "Л",
                    "М", "Н", "О", "П",
                    "Р", "С", "Т", "У",
                    "Ф", "Х", "Ц", "Ч",
                    "Ш", "Щ", "Ъ", "Ы",
                    "Ь", "Э", "Ю", "Я");

if(isset($_POST['send'])){ // обрабатываем форму при нажатии кнопки
    $in = $_POST['in']; // получаем значения из полей
    $code_word = $_POST['code_word'];
    $out = coder($in, $code_word,$dictionary); // передаем данные в функцию и получаем результат
    echo '<p>Зашифрованное слово:</p>'; // выводим результат
    echo $out;
}

function coder($in, $code_word, $dictionary):string // функция работает с нашим словарем и двумя заданными строками
{
    $result = '';
    while(mb_strlen($in) != mb_strlen($code_word)){ // выравниваем количество символов в строках
        if (mb_strlen($in) > mb_strlen($code_word)) { // если число символов входной строки больше, чем в кодовом слове, то прибавляем к кодовому слову его же.
            $code_word .= $code_word;
        } else if(mb_strlen($in) < mb_strlen($code_word)) // если меньше то урезаем кодовое слово до размеров входной строки
            $code_word = mb_substr($code_word, 0, mb_strlen($in) - mb_strlen($code_word));
    }
    $in = mb_str_split($in); // посимвольно делим входную строку
    $code_word = mb_str_split($code_word); // посимвольно делим кодовое слово
    for($i=0;$i<count($in);$i++) // шифрование
    {
        $index = (int)array_search($in[$i], $dictionary)^(int)array_search($code_word[$i], $dictionary); // ищем в массиве индексы символов, приводим их к int и выполняем сложение по модулю на 2.
        $result .= $dictionary[$index]; // ищем элемент с получившимся индексом и прибавляем к результату

    }
    return $result; // возвращаем результат
}