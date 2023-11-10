
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<form action="" method="post">
    <p>Вставьте ссылку:</p>
    <input type="text" name="link">
    <p>Вставьте статью:</p>
    <textarea name="text" cols="128" rows="32"></textarea>
    <p><input type="submit" name="send" value="Сгенерировать анонс"></p>
</form>
<?php
include 'announce_generator.php'
?>
</body>
</html>

