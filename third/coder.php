<?php

$out = '';

$dictionary = array("|", "А", "Б", "В",
                    "Г", "Д", "Е", "Ж",
                    "З", "И", "К", "Л",
                    "М", "Н", "О", "П",
                    "Р", "С", "Т", "У",
                    "Ф", "Х", "Ц", "Ч",
                    "Ш", "Щ", "Ъ", "Ы",
                    "Ь", "Э", "Ю", "Я");

if(isset($_POST['send'])){
    $in = $_POST['in'];
    $code_word = $_POST['code_word'];
    $out = coder($in, $code_word,$dictionary);
    echo '<p>Зашифрованное слово:</p>';
    echo $out;
}

function coder($in, $code_word, $dictionary):string
{
    $result = '';
    while(mb_strlen($in) != mb_strlen($code_word)){
        if (mb_strlen($in) > mb_strlen($code_word)) {
            $code_word .= $code_word;
        } else if(mb_strlen($in) < mb_strlen($code_word))
            $code_word = mb_substr($code_word, 0, mb_strlen($in) - mb_strlen($code_word));
    }
    $in = mb_str_split($in);
    $code_word = mb_str_split($code_word);
    for($i=0;$i<count($in);$i++)
    {
        $index = (int)array_search($in[$i], $dictionary)^(int)array_search($code_word[$i], $dictionary);
        $result .= $dictionary[$index];
    }
    return $result;
}