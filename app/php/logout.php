<?php
    session_start();
    session_destroy();
    /*echo '<script>$(".user-panel").hide();</script>';
    echo '<script>$(".login-panel").show();</script>';*/
    header("location: ../s-white/index.html");
    exit();
?>